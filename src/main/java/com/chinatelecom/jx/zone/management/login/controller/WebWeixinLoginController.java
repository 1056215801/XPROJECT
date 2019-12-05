package com.chinatelecom.jx.zone.management.login.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.web.WebAttributes;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.alibaba.fastjson.JSON;

import com.chinatelecom.jx.servlet.ServletHelper;
import com.chinatelecom.jx.zone.account.bind.bean.AccountBindBean;
import com.chinatelecom.jx.zone.account.bind.proxy.IAccountBindBeanProxy;
import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.info.proxy.IAccountInfoBeanProxy;
import com.chinatelecom.jx.zone.account.weixin.bean.AccountWeixinBean;
import com.chinatelecom.jx.zone.account.weixin.bean.AccountWeixinBeanExample;
import com.chinatelecom.jx.zone.account.weixin.proxy.IAccountWeixinBeanProxy;
import com.chinatelecom.jx.zone.bean.InvokeInfoBean;
import com.chinatelecom.jx.zone.config.info.proxy.IConfigInfoBeanProxy;
import com.chinatelecom.jx.zone.entrance.config.info.bean.EntranceConfigInfoBean;
import com.chinatelecom.jx.zone.entrance.config.info.proxy.IEntranceConfigInfoBeanProxy;
import com.chinatelecom.jx.zone.entrance.helper.EntranceIdHelper;
import com.chinatelecom.jx.zone.exception.ServiceException;
import com.chinatelecom.jx.zone.management.login.controller.RegisterController;
import com.chinatelecom.jx.zone.management.login.controller.weixin.MobileWeixinLoginController;
import com.chinatelecom.jx.zone.module.info.proxy.IModuleInfoBeanLookup;
 
import com.chinatelecom.jx.zone.system.info.proxy.ISystemInfoBeanLookup;
import com.chinatelecom.jx.zone.system.log.sync.ISystemLogSync;
import com.chinatelecom.jx.zone.weixin.sns.UserInfoApi;
import com.chinatelecom.jx.zone.weixin.sns.UserInfoApiResult;

import com.chinatelecom.jx.zone.weixin.sns.oauth2.AccessTokenApiResult;
import com.chinatelecom.jx.zone.weixin.ticket.bean.WeixinTicketBean;
import com.chinatelecom.jx.zone.weixin.ticket.proxy.IWeixinTicketBeanProxy;

import net.sf.ehcache.Element;

/**
 * 登录页面封装微信扫码相关页面逻辑处理
 * 
 * @author ZuoGuangDe
 *
 */
@Controller
public class WebWeixinLoginController {
	@Autowired
	private IWeixinTicketBeanProxy weixinTicketBeanProxy;
	@Autowired
	private RegisterController registerController;
	@Autowired
	private MobileWeixinLoginController mobileWeixinLoginController;
	@Autowired
	private com.chinatelecom.jx.zone.hcode.pt.proxy.IHcodePtValidateProxy hcodePtValidateProxy;
	@Autowired
	private IAccountWeixinBeanProxy accountWeixinBeanProxy;
	@Autowired
	private IAccountBindBeanProxy accountBindBeanProxy;
	@Autowired
	private IAccountInfoBeanProxy accountInfoBeanProxy;

	@Autowired
	private ISystemInfoBeanLookup systemInfoBeanProxy;
	@Autowired
	private IModuleInfoBeanLookup moduleInfoBeanProxy;
	@Autowired
	private EntranceIdHelper entranceIdHelper;
	@Autowired
	private IEntranceConfigInfoBeanProxy entranceConfigInfoBeanProxy;
	@Autowired
	private LoginController loginController;
 
	@Autowired
	private ISystemLogSync systemLogSync;

	private static final Logger logger = LoggerFactory.getLogger(WebWeixinLoginController.class);

	@PostConstruct
	public void initialize() {

		logger.info("WebWeixinLoginController初始化成功！");
	}

	// 引导到账号登录模块 -> 微信扫码的页面
	@RequestMapping(value = "/session/page/login/weixin/generateQrCode")
	public String generateQrCode(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			Model model) {
		final BigDecimal entranceId = entranceIdHelper.setupPerfectEntranceId(request);
		// 腾讯网站应用平台AppId
		EntranceConfigInfoBean entranceConfigInfoBean = entranceConfigInfoBeanProxy
				.selectByPrimaryKey(entranceId);
		if (entranceConfigInfoBean == null) {
			logger.error("门户入口未配置腾讯网站应用接入，t_entrance_auth_config表没有配置organization_id=" + entranceId + "的记录！");
			BadCredentialsException se = new BadCredentialsException("微信扫码登录方式没有开通！");
			model.addAttribute(WebAttributes.AUTHENTICATION_EXCEPTION, se);
			return loginController.index(null, null, request, response, session, model);
		}
		final String appId = entranceConfigInfoBean.getWeixinWebAppId();
		// 生成UUID随机数
		String state = UUID.randomUUID().toString();
		WeixinTicketBean record = new WeixinTicketBean();
		record.setState(state);
		record.setEntranceId(entranceId);
		record.setAppId(entranceConfigInfoBean.getWeixinWebAppId());
		record.setAppSecret(entranceConfigInfoBean.getWeixinWebAppSecret());
		weixinTicketBeanProxy.set(state, record); // 初始化微信认证业务票据。

		final String serviceUrlPrefix = request.getScheme() + "://" + request.getServerName()
				+ request.getContextPath(); // 端口必须使用80端口

		// 微信客户端扫码后跳转的系统鉴权路径
		StringBuilder builder = new StringBuilder(128);
		builder.append(serviceUrlPrefix).append("/session/page/login/weixin/validateQrCode");
		String redirectUri = builder.toString();
		if (logger.isTraceEnabled()) {
			logger.trace("生成的Web微信扫码系统鉴权链接redirectUri为：" + redirectUri);
		}
		model.addAttribute("redirectUri", redirectUri);
		model.addAttribute("appId", appId);
		model.addAttribute("state", state);

		logger.info("执行封装生成微信二维码及相关数据的generateWeixinQrCode方法成功！");
		return "/login/weixin/generateQrCode";
	}

	// 封装手机微信客户端扫码后轮询触发的Web端业务处理逻辑
	@RequestMapping(value = "/session/page/login/weixin/validateQrCode")
	public synchronized String validateQrCode(@RequestParam(value = "state", required = false) String state,
			@RequestParam(value = "code", required = false) String code, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, Model model) throws IOException {
		
		try {
			final String requestIp = ServletHelper.getIpAddress(request);
			final String thisModuleName = "门户微信扫码";
			final BigDecimal thisModuleId = moduleInfoBeanProxy.selectModuleIdByModuleName(thisModuleName);

			if (StringUtils.isEmpty(state) || StringUtils.isEmpty(code)) {
				String errorMsg = new StringBuilder(128).append("异常手机微信客户端扫码，参数不能为空，requestIp：").append(requestIp)
						.append("，code：").append(code).append("，state：").append(state).append("！").toString();
				logger.error(errorMsg);
				BadCredentialsException se = new BadCredentialsException("微信扫码异常，请重试！");
				model.addAttribute(WebAttributes.AUTHENTICATION_EXCEPTION, se);
				return loginController.index(null, null, request, response, session, model);
			}

			WeixinTicketBean ticket = weixinTicketBeanProxy.get(state);
			if (ticket == null) {
				String errorMsg = new StringBuilder(128).append("微信业务票据已失效，requestIp：").append(requestIp)
						.append("，state：").append(state).append("！").toString();
				logger.error(errorMsg);
				BadCredentialsException se = new BadCredentialsException("微信业务票据已经失效，请重试！");
				model.addAttribute(WebAttributes.AUTHENTICATION_EXCEPTION, se);
				return loginController.index(null, null, request, response, session, model);
			}
			if (ticket.getBindId() == null) { //首次扫码
				// 腾讯网站应用平台AppId
				final String appId = ticket.getAppId();
				// 腾讯网站应用平台AppSecret
				final String appSecret = ticket.getAppSecret();
				AccessTokenApiResult rst1 = com.chinatelecom.jx.zone.weixin.sns.oauth2.AccessTokenApi.invoking(appId,
						appSecret, code, "authorization_code");
				final String openId = rst1.getOpenid();
				final String accessToken = rst1.getAccess_token();				
				if (StringUtils.isEmpty(openId) || StringUtils.isEmpty(accessToken)) {
					weixinTicketBeanProxy.remove(state);
					String errorMsg = new StringBuilder(512)
							.append("获取微信票据accessToken及用户账号openId失败，AccessTokenApi接口调用 -> appId：").append(appId)
							.append("，appSecret：").append(appSecret).append("，code：").append(code)
							.append("，AccessTokenApiResult：").append(JSON.toJSONString(rst1)).append("！").toString();
					logger.error(errorMsg);
					int errorCode = rst1.getErrcode();
					if (errorCode == 40125) {
						BadCredentialsException se = new BadCredentialsException("微信开放账号已经失效！");
						model.addAttribute(WebAttributes.AUTHENTICATION_EXCEPTION, se);
					} else {
						BadCredentialsException se = new BadCredentialsException("微信用户票据已经失效！");
						model.addAttribute(WebAttributes.AUTHENTICATION_EXCEPTION, se);
					}
					return loginController.index(null, null, request, response, session, model);
				} 
				if (logger.isTraceEnabled()) {
					StringBuilder builder = new StringBuilder(512);
					builder.append("调用获取AccessTokenApi接口信息执行结束，appId：").append(appId).append("，appSecret：")
							.append(appSecret).append("，code：").append(code).append("，AccessTokenApiResult：")
							.append(JSON.toJSONString(rst1)).append("！");
					logger.trace(builder.toString());
				}

				UserInfoApiResult rst2 = UserInfoApi.invoking(accessToken, openId, "zh_CN");
				if (!StringUtils.isEmpty(rst2.getErrcode())) {
					String errorMsg = new StringBuilder(512).append("调用获取UserInfoApi接口信息执行失败，acessToken：")
							.append(accessToken).append("，openId：").append(openId).append("，UserInfoApiResult：")
							.append(JSON.toJSONString(rst2)).append("！").toString();
					logger.error(errorMsg);
					BadCredentialsException se = new BadCredentialsException("微信查询客户信息失效，服务忙！");
					model.addAttribute(WebAttributes.AUTHENTICATION_EXCEPTION, se);
					return loginController.index(null, null, request, response, session, model);
				} 
				if (logger.isTraceEnabled()) {
					StringBuilder builder = new StringBuilder(512);
					builder.append("调用获取UserInfoApi接口信息执行结束，accessToken：").append(accessToken).append("，openId：")
							.append(openId).append("，UserInfoApiResult：").append(JSON.toJSONString(rst2)).append("！");
					logger.trace(builder.toString());
				}

				String unionId = rst2.getUnionid();
				
				AccountWeixinBeanExample example3 = new AccountWeixinBeanExample();
				AccountWeixinBeanExample.Criteria criteria3 = example3.createCriteria();
				if (StringUtils.isEmpty(unionId)) { // 微信公共号没有绑定到微信开放平台账号
					criteria3.andOpenIdEqualTo(openId).andAppIdEqualTo(appId);
				} else {
					criteria3.andUnionIdEqualTo(unionId);
				}
				List<AccountWeixinBean> list3 = accountWeixinBeanProxy.selectByExample(example3);

				final boolean exists = !list3.isEmpty(); // 是否存在微信账户数据
				if (logger.isTraceEnabled()) {
					logger.trace("微信用户记录是否存在exists：" + exists);
				}

				AccountWeixinBean bean4 = new AccountWeixinBean();
				bean4.setUnionId(rst2.getUnionid());
				bean4.setNickName(rst2.getNickname());
				bean4.setCountry(rst2.getCountry());
				bean4.setProvince(rst2.getProvince());
				bean4.setCity(rst2.getCity());
				bean4.setGroupId(rst2.getGroupId());
				bean4.setHeadImgurl(rst2.getHeadimgurl());
				bean4.setLanguage(rst2.getLanguage());
				bean4.setSex(String.valueOf(rst2.getSex()));

				if (exists) { //本地已存微信用户记录
					AccountInfoBean accountInfoBean = null;
					BigDecimal bindId = null;
					for (AccountWeixinBean item : list3) {
						if (item.getAccountId() != null && !item.getAccountId().equals(BigDecimal.valueOf(-1))) {
							if (accountInfoBean == null) {
								BigDecimal accountId = item.getAccountId();
								accountInfoBean = accountInfoBeanProxy.selectByPrimaryKey(accountId);
								if (accountInfoBean != null && accountInfoBean.getStatus() > 0) {
									bean4.setBindId(item.getBindId());
									bean4.setAccountId(accountInfoBean.getAccountId());
									// 扫码关联用户成功，提供自动登录数据。
									model.addAttribute("accountInfoBean", accountInfoBean);
									// 基于微信扫码登录时需要安全校验的数据。
									session.setAttribute("username", accountInfoBean.getAccountCode());
									session.setAttribute("accountId", accountInfoBean.getAccountId());
									bindId = item.getBindId();
								}
							}
						}						
						bean4.setBindId(item.getBindId());
						InvokeInfoBean<Integer> rst5 = accountWeixinBeanProxy
								.validateUpdateByPrimaryKeySelective(bean4);
						if (!rst5.isSuccess()) {
							StringBuilder builder = new StringBuilder(1024);
							builder.append("联带即时刷新绑定微信账号信息失败，record：").append(JSON.toJSONString(bean4)).append("，")
									.append(rst5.getErrorMsg()).append("！");
							String warnMsg = builder.toString();
							logger.warn(warnMsg);
						} else {
							if (logger.isInfoEnabled()) {
								StringBuilder builder = new StringBuilder(1024);
								builder.append("联带即时刷新绑定微信账号信息成功，record：").append(JSON.toJSONString(bean4)).append("！");
								logger.info(builder.toString());
							}
						}
					}
					ticket.setBindId(bindId == null ? bean4.getBindId() : bindId);
					weixinTicketBeanProxy.set(state, ticket);

				} else {//本地未存微信用户记录
					bean4.setAccountId(BigDecimal.valueOf(-1));// 未关联账户
					bean4.setOpenId(rst2.getOpenid());
					bean4.setAppId(appId);
					
					InvokeInfoBean<Integer> rst5 = accountWeixinBeanProxy.validateInsertSelective(bean4);
					if (!rst5.isSuccess()) {
						StringBuilder builder = new StringBuilder(1024);
						builder.append("联带即时记录游客微信账号信息失败，record：").append(JSON.toJSONString(bean4)).append("，")
								.append(rst5.getErrorMsg()).append("！");
						String errorMsg = builder.toString();
						logger.error(errorMsg);
						BadCredentialsException se = new BadCredentialsException("微信扫码失败，服务忙！");
						model.addAttribute(WebAttributes.AUTHENTICATION_EXCEPTION, se);
						return loginController.index(null, null, request, response, session, model);
					}

					if (logger.isInfoEnabled()) {
						StringBuilder builder = new StringBuilder(1024);
						builder.append("联带即时记录游客微信账号信息成功，record：").append(JSON.toJSONString(bean4)).append("！");
						logger.info(builder.toString());
					}
					ticket.setBindId(bean4.getBindId());
					weixinTicketBeanProxy.set(state, ticket);
				}
				StringBuilder builder = new StringBuilder(384);
				builder.append("手机微信端扫码缓存校验成功，state：").append(state).append("，record：").append(JSON.toJSONString(bean4))
						.append("。");
				String logDetail = builder.toString();
				logger.info(logDetail); // 记录系统程序日志
			
				systemLogSync.insert(request, thisModuleId, bean4.getAccountId(), null, null, (short) 0, 0,
						logDetail); // 记录系统审计日志

				if (bean4.getAccountId() == null || bean4.getAccountId().equals(BigDecimal.valueOf(-1))) {
					session.setAttribute("accountWeixinBean", bean4);// 号码绑定页面，账户注册页面使用
				}
				model.addAttribute("accountWeixinBean", bean4);
				return "/login/weixin/validateQrCode";
			} else {
				AccountWeixinBean bean4 = accountWeixinBeanProxy.selectByPrimaryKey(ticket.getBindId());
				if (bean4 == null) {
					logger.error("手机微信扫码校验失败，缓存bindId相关记录不存在，bindId：" + ticket.getBindId().toPlainString() + "！");
					BadCredentialsException se = new BadCredentialsException("微信扫码失败，服务忙！");
					model.addAttribute(WebAttributes.AUTHENTICATION_EXCEPTION, se);
					return loginController.index(null, null, request, response, session, model);
				}
				final BigDecimal accountId = bean4.getAccountId();
				if (accountId != null && !BigDecimal.valueOf(-1).equals(accountId)) {
					AccountInfoBean accountInfoBean = accountInfoBeanProxy.selectByPrimaryKey(accountId);
					model.addAttribute("accountInfoBean", accountInfoBean);
					// 基于微信扫码登录时需要安全校验的数据。
					session.setAttribute("username", accountInfoBean.getAccountCode());
					session.setAttribute("accountId", accountInfoBean.getAccountId());
				} 
				if (bean4.getAccountId() == null || bean4.getAccountId().equals(BigDecimal.valueOf(-1))) {
					session.setAttribute("accountWeixinBean", bean4);// 号码绑定页面，账户注册页面使用
				}
				model.addAttribute("accountWeixinBean", bean4);
				StringBuilder builder = new StringBuilder(384);
				builder.append("手机微信端扫码接口校验成功，state：").append(state).append("，record：").append(JSON.toJSONString(bean4))
						.append("。");
				String logDetail = builder.toString();
				logger.info(logDetail); // 记录系统程序日志
			
				systemLogSync.insert(request, thisModuleId, bean4.getAccountId(), null, null, (short) 0, 0,
						logDetail); // 记录系统审计日志				
				
				return "/login/weixin/validateQrCode";
			}

		} catch (Exception ex) {
			String errorMsg = "手机微信扫码校验失败，" + ex.getLocalizedMessage();
			logger.error(errorMsg, ex);

			BadCredentialsException se = new BadCredentialsException("微信扫码失败，服务忙！");
			model.addAttribute(WebAttributes.AUTHENTICATION_EXCEPTION, se);
			return loginController.index(null, null, request, response, session, model);

		}

	}

	// 引导到账号登录模块 -> 微信扫码 -> 绑定手机号码 -> 输入手机号码的页面
	@RequestMapping(value = "/session/page/login/weixin/phoneInput")
	public String phoneInput(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model)
			throws IOException {
		final String successUrl = "/login/weixin/phoneInput"; // 处理成功的跳转View
		return successUrl;

	}

	// 封装查询验证手机号码相关功能,如果手机号码已绑定账户则跳转到绑定手机号码页面，否则跳转到账户注册页面。
	@RequestMapping(value = "/session/page/login/weixin/phoneVerification")
	public String phoneVerification(@RequestParam(value = "username", required = false) String username,
			HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model)
			throws IOException {

		if (logger.isTraceEnabled()) {
			final BigDecimal entranceId = entranceIdHelper.setupPerfectEntranceId(request);
			final String redirectUrl = (String) session.getAttribute("redirectUrl");
			final AccountWeixinBean accountWeixinBean = (AccountWeixinBean) session.getAttribute("accountWeixinBean"); // 如果有值，则是通过WebWeixinLoginController中方法设置。

			logger.trace("PC端Web用户验证手机号码phoneVerification，输入手机号码username：" + username + "，客户地址requestIp："
					+ ServletHelper.getIpAddress(request) + "，访问路径requestURI：" + request.getRequestURI()
					+ "，登录入口entranceId：" + entranceId + "，事务会话sessionId：" + session.getId() + "，会话手机号码username："
					+ session.getAttribute("username") + "，会话微信记录accountWeixinBean："
					+ JSON.toJSONString(accountWeixinBean) + "，会话登录跳转redirectUrl：" + redirectUrl + "。");
		}

		if (StringUtils.isEmpty(username)) {
			BadCredentialsException se = new BadCredentialsException("手机号码不能为空！");
			model.addAttribute(WebAttributes.AUTHENTICATION_EXCEPTION, se);
			return phoneInput(request, response, session, model); // 返回到号码绑定页面，显示相关错误。
		}
		if (hcodePtValidateProxy.queryOperatorGate(username) == null) {
			BadCredentialsException se = new BadCredentialsException("手机号码格式不正确！");
			model.addAttribute(WebAttributes.AUTHENTICATION_EXCEPTION, se);
			return phoneInput(request, response, session, model); // 返回到号码绑定页面，显示相关错误。
		}

		session.setAttribute("username", username);

		AccountBindBean accountBindBean = accountBindBeanProxy.selectBySystemIdAndOpenId(BigDecimal.valueOf(-1),
				username);
		if (accountBindBean == null) { // 手机号码未绑定
			return registerController.index(username, null, request, session, model);
		} else { // 手机号码已绑定，引导到微信绑定页面。
			return "/login/weixin/phoneVerification";
		}

	}

	// 验证微信账号绑定。
	@RequestMapping(value = "/session/json/login/weixin/bind")
	public String bind(@RequestParam(value = "username", required = true) String username,
			@RequestParam(value = "password", required = true) String password, HttpServletRequest request,
			HttpServletResponse response, HttpSession session, Model model) {
		return mobileWeixinLoginController.bind(username, password, request, response, session, model);
	}
}
