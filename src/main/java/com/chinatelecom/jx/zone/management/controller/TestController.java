package com.chinatelecom.jx.zone.management.controller;

import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.bean.InvokeInfoBean;
import com.chinatelecom.jx.zone.filter.word.proxy.IFilterWordValidateProxy;
import com.chinatelecom.jx.zone.management.bean.projectActivity.TestBean;
import com.chinatelecom.jx.zone.management.bean.showInfo.ShowProductInfoBean;
import com.chinatelecom.jx.zone.management.util.HttpToolkit;
import com.chinatelecom.jx.zone.management.util.StringUtil;
import com.chinatelecom.jx.zone.management.websocket.Msg;
import com.chinatelecom.jx.zone.management.websocket.WSServer;
import com.jfinal.kit.HashKit;
import com.jfinal.kit.PropKit;
import com.jfinal.weixin.sdk.api.ApiConfig;
import com.jfinal.weixin.sdk.api.ApiConfigKit;
import com.jfinal.weixin.sdk.api.JsTicket;
import com.jfinal.weixin.sdk.api.JsTicketApi;
import com.jfinal.weixin.sdk.api.JsTicketApi.JsApiType;

@Controller
// @RequestMapping(value = "/test")
public class TestController extends BaseController {

	@Autowired
	IFilterWordValidateProxy filterWordValidateProxy;

	@PostConstruct
	public void initialize() {
		logger.info("ShowPageController initialized!");
	}

	@RequestMapping(value = "/test/404")
	public String show404() {
		// return new ModelAndView("forward:/WEB-INF/views/images/1.jpg");
		// return "forward:/WEB-INF/views/images/" + imageUrl;
		return "common/404";
	}

	/**
	 * 各种按钮
	 */
	@RequestMapping(value = "/test/buttons")
	public String buttons() {
		// return new ModelAndView("forward:/WEB-INF/views/images/1.jpg");
		// return "forward:/WEB-INF/views/images/" + imageUrl;
		return "test/buttons";
	}

	/**
	 * 企业红包
	 */
	@RequestMapping(value = "/test/redpack")
	public String redpack(Model model, ServletRequest request) {
		return "/test/redpack";
	}

	/**
	 * 微博分享
	 */
	@RequestMapping(value = "/test/share3")
	public String share3(Model model, ServletRequest request) {

		return "test/share3";
	}

	/**
	 * 首页
	 */
	@RequestMapping(value = "/test/main")
	public String test(Model model, ServletRequest request) {
		// System.out.println("======test========");
		model.addAttribute("success", true);
		model.addAttribute("errorCode", "正确");
		model.addAttribute("errorMsg", "首页跳转成功");
		return "test/main";
	}

	/**
	 * 移动端附件上传
	 */
	@RequestMapping(value = "/test/test0")
	public String test0(Model model, ServletRequest request) {
		return "test/test0";
	}

	/**
	 * PC端附件上传
	 */
	@RequestMapping(value = "/test/test1")
	public String test1(Model model, ServletRequest request) {
		model.addAttribute("success", true);
		model.addAttribute("errorCode", "正确");
		model.addAttribute("errorMsg", "跳转成功");
		return "test/test1";
	}

	/**
	 * ztree
	 */
	@RequestMapping(value = "/test/test2")
	public String test2(Model model, ServletRequest request) {
		return "test/test2";
	}

	/**
	 * 弹出框
	 */
	@RequestMapping(value = "/test/test3")
	public String test3(@ModelAttribute("info") TestBean info, RedirectAttributes attr) {
		int n = 0;
		if (info.getId() == null) {
			info.setId(seq.getNextSeqIdToBigDecimal());
			// n = testBeanService.insert(info);
		} else {
			// TestBean record = testBeanService.queryById(info.getId());
			// MyBeanUtils.copyProperties(info, record);
			// n = testBeanService.updateByPrimaryKey(record);
		}
		attr.addFlashAttribute("message", "操作" + (n == 1 ? "成功" : "失败"));
		return "test/test3";
	}

	/**
	 * 移动端日期控件
	 */
	@RequestMapping(value = "/test/test4")
	public String test4(Model model, HttpServletRequest request) {
		return "test/test4";
	}

	/**
	 * 富文本编辑器2
	 */
	@RequestMapping(value = "/test/test5")
	public String test5(Model model, ServletRequest request) {
		return "test/test5";
	}

	/**
	 * 省市县
	 */
	@RequestMapping(value = "/test/test6")
	public String test6(Model model, ServletRequest request) {

		return "test/test6";
	}

	/**
	 * 瀑布流
	 */
	@RequestMapping(value = "/test/test7")
	public String test7(Model model, ServletRequest request) {

		return "test/test7";
	}

	/**
	 * tinymce
	 */
	@RequestMapping(value = "/test/test8")
	public String test8(Model model, ServletRequest request) {

		return "test/test8";
	}

	/**
	 * 分享到微信微博空间等
	 */
	@RequestMapping(value = "/test/share1")
	public String share1(Model model, ServletRequest request) {
		model.addAttribute("success", true);
		model.addAttribute("errorCode", "正确");
		model.addAttribute("errorMsg", "跳转成功");
		return "test/share1";
	}

	/**
	 * 微信内分享
	 */
	@RequestMapping(value = "/test/share22")
	public String share22(Model model, HttpServletRequest request) {
		try {
			initWxConfig();
			JsTicket jsApiTicket = JsTicketApi.getTicket(JsApiType.jsapi);
			String jsapi_ticket = jsApiTicket.getTicket();
			String nonce_str = create_nonce_str();
			// 注意 URL 一定要动态获取，不能 hardcode.
			String url = "http://" + request.getServerName() // 服务器地址
			// + ":"
			// + getRequest().getServerPort() //端口号
					+ request.getContextPath() // 项目名称
					+ request.getServletPath();// 请求页面或其他地址
			String qs = request.getQueryString(); // 参数
			if (qs != null) {
				url = url + "?" + (request.getQueryString());
			}
			System.out.println("url>>>>" + url);
			String timestamp = create_timestamp();
			// 这里参数的顺序要按照 key 值 ASCII 码升序排序
			// 注意这里参数名必须全部小写，且必须有序
			String str = "jsapi_ticket=" + jsapi_ticket + "&noncestr=" + nonce_str + "&timestamp=" + timestamp + "&url="
					+ url;
			String signature = HashKit.sha1(str);
			System.out.println("===========appId " + ApiConfigKit.getApiConfig().getAppId() + "  nonceStr " + nonce_str
					+ " timestamp " + timestamp);
			System.out.println("===========url " + url + " signature " + signature);
			System.out.println("===========nonceStr " + nonce_str);
			System.out.println("===========timestamp " + timestamp);
			System.out.println("===========jsapi_ticket " + jsapi_ticket);

			model.addAttribute("nonceStr", nonce_str);
			model.addAttribute("timestamp", timestamp);
			model.addAttribute("url", url);
			model.addAttribute("signature", signature);
			model.addAttribute("jsapi_ticket", jsapi_ticket);
			model.addAttribute("appId", "wxe2612226be2bf0dd");
		} catch (Exception ex) {
			ex.printStackTrace();
			logger.error("");
		}

		return "test/share2";
	}

	@RequestMapping(value = "/test/json1")
	@ResponseBody
	public JSON json1(Model model, ServletRequest request) {
		JSONObject jo = new JSONObject();
		jo.put("success", true);
		jo.put("errorCode", 0);
		jo.put("errorMsg", "操作成功！");

		return jo;
	}

	@RequestMapping(value = "/test/weixin")
	public String weixin(Model model, HttpServletRequest request) {
		// initWxConfig();
		ApiConfig ac = new ApiConfig();
		ac.setAppId("wx86faeaae9aa0b316");
		ac.setAppSecret("9a67bef81744bb2687bc274d4336a5ba");
		ApiConfigKit.setThreadLocalApiConfig(ac);

		JsTicket jsApiTicket = JsTicketApi.getTicket(JsApiType.jsapi);
		String jsapi_ticket = jsApiTicket.getTicket();
		String nonce_str = create_nonce_str();
		// 注意 URL 一定要动态获取，不能 hardcode.
		String url = "http://" + request.getServerName() // 服务器地址
		// + ":"
		// + getRequest().getServerPort() //端口号
				+ request.getContextPath() // 项目名称
				+ request.getServletPath();// 请求页面或其他地址
		String qs = request.getQueryString(); // 参数
		if (qs != null) {
			url = url + "?" + (request.getQueryString());
		}
		System.out.println("url>>>>" + url);
		String timestamp = create_timestamp();
		// 这里参数的顺序要按照 key 值 ASCII 码升序排序
		// 注意这里参数名必须全部小写，且必须有序
		String str = "jsapi_ticket=" + jsapi_ticket + "&noncestr=" + nonce_str + "&timestamp=" + timestamp + "&url="
				+ url;
		String signature = HashKit.sha1(str);
		System.out.println("===========appId " + ApiConfigKit.getApiConfig().getAppId() + "  nonceStr " + nonce_str
				+ " timestamp " + timestamp);
		System.out.println("===========url " + url + " signature " + signature);
		System.out.println("===========nonceStr " + nonce_str);
		System.out.println("===========timestamp " + timestamp);
		System.out.println("===========jsapi_ticket " + jsapi_ticket);

		model.addAttribute("nonceStr", nonce_str);
		model.addAttribute("timestamp", timestamp);
		model.addAttribute("url", url);
		model.addAttribute("signature", signature);
		model.addAttribute("jsapi_ticket", jsapi_ticket);
		// model.addAttribute("appId", "wxe2612226be2bf0dd");//工业微讯
		model.addAttribute("appId", "wx86faeaae9aa0b316");// 星南

		return "test/weixin";
	}

	private static String create_timestamp() {
		return Long.toString(System.currentTimeMillis() / 1000);
	}

	private static String create_nonce_str() {
		return UUID.randomUUID().toString();
	}

	/**
	 * 微信菜单点击
	 * https://open.weixin.qq.com/connect/oauth2/authorize?appid=wxe2612226be2bf0dd&redirect_uri=http://www.jx968969.com/XProject/test/weixinUserInfo%3Ftest1=1%26test2=2&response_type=code&scope=snsapi_base&state=1#wechat_redirect
	 * 
	 * @param 获取用户openId
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/test/weixinUserInfo")
	public String weixinUserInfo(Model model, HttpServletRequest request) {
		String code = request.getParameter("code"); // oauth2返回的
		String test1 = request.getParameter("test1");
		String state = request.getParameter("state");
		model.addAttribute("test1", test1);
		model.addAttribute("state", state);
		model.addAttribute("code", code);
		String appId = PropKit.get("appId");
		String appSecret = PropKit.get("appSecret");
		// code 换取 token
		String url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=" + appId + "&secret=" + appSecret
				+ "&code=" + code + "&grant_type=authorization_code";
		try {
			String backJson1 = HttpToolkit.PUTMethod(url, null);
			System.out.println("========backJson1=======" + backJson1);
			JSONObject jsonObject1 = JSONObject.parseObject(backJson1);
			// 正确的返回{"access_token":"o0ageQ_U5uu-PO5rMhSRnWo9X-FY30cMQ0JC84Goj-Kq_pE6hboTT5t92X1f_nJw9sOg9fhEsJf_reyye7VJEVqnG1D93VkubHigM-rE6Fw","expires_in":7200,"refresh_token":"dLlOBReZIKFPa_CLlT43KxzyP2IlPquJeqxswxwVRTwXkLH9fplgvyTIDJa4llHiXAkHX92it7Cm1jfmJ-s6x2bst19IZ2gVgdJ6WwVkDGQ","openid":"obnfavjAH7CRrrwIpVI7L7vHLLf0","scope":"snsapi_base"}
			// 错误的返回 {"errcode":40029,"errmsg":"invalid code, hints: [ req_id:
			// sny7tA0077s105 ]"}
			Integer errcode = (Integer) jsonObject1.get("errcode");
			if (errcode != null) {
				model.addAttribute("errmsg", jsonObject1.get("errmsg").toString());
			} else {
				String openid = jsonObject1.get("openid").toString();
				System.out.println("========openid=======" + openid);
				model.addAttribute("openid", openid);
			}

		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}

		return "test/weixinUserInfo";
	}

	@RequestMapping(value = "/auth/page/mobile/weixin/test11")
	public String mobileTest1(Model model, HttpServletRequest request) {

		model.addAttribute("userId", getCurrentAccountId());
		return "test/weixinUserInfo";
	}

	@RequestMapping(value = "/auth/page/mobile/weixin/test22")
	public String mobileTest2(Model model, HttpServletRequest request) {

		model.addAttribute("userId", getCurrentAccountId());
		return "test/weixinUserInfo";
	}

	@RequestMapping(value = "/test/userTest3")
	public String mobileTest3(Model model, HttpServletRequest request) {
		model.addAttribute("userId", getCurrentAccountId());
		return "test/weixinUserInfo";
	}

	@RequestMapping(value = "/test/t1")
	public String t1(Model model, HttpServletRequest request) {
		String type = request.getParameter("type");
		/*if ("f".equals(type)) {
			return "forward:/test/t2?type=" + type;
		} else {
			return "redirect:/test/t3?type=" + type;
		}
		*/
		return "test/t1";
	}

	@RequestMapping(value = "/test/t2")
	public String t2(Model model, HttpServletRequest request) {
		String type = request.getParameter("type");
		model.addAttribute("type", "this is t2 and Type=" + type);
		return "test/t1";
	}

	@RequestMapping(value = "/test/t3")
	public String t3(Model model, HttpServletRequest request) {
		String type = request.getParameter("type");
		model.addAttribute("type", "this is t3 and Type=" + type);
		return "test/t1";
	}

	/**
	 * 测试过滤敏感字
	 * 
	 * @return
	 */
	@RequestMapping(value = "/test/filterWord")
	@ResponseBody
	public InvokeInfoBean<Boolean> testFilterWord(@RequestParam(defaultValue = "") String word1,
			@RequestParam(defaultValue = "") String word2, @RequestParam(defaultValue = "") String word3) {
		return filterWordValidateProxy.validateText(word1, word2, word3);
	}

	@RequestMapping(value = "/test/filterWordObject")
	@ResponseBody
	public InvokeInfoBean<Boolean> filterWordObject() {
		ShowProductInfoBean bean = new ShowProductInfoBean();
		bean.setCompanyName("法轮功");
		return filterWordValidateProxy.validateObject(bean);
	}

	// 发送websocket测试消息
	@RequestMapping(value = "/test/sendMsg")
	@ResponseBody
	public String sendMsg(Model model, HttpServletRequest request) {
		try {
			String content = request.getParameter("content");
			String type = request.getParameter("type");
			//System.out.println("======content======"+content);
			// System.out.println("======from======"+from);
			if (StringUtil.checkNotNull(content)) {
				Msg msg = new Msg();
				msg.setData("服务器发来消息：" + content);
				msg.setType(type);
			//	msg.setToUid(u.getId().toString());
			 	WSServer.pushBySys(msg);
			}
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			e.printStackTrace();
		}
		return "OK";
	}
	
	//websocket测试
	@RequestMapping(value = "/test/ws")
	public String ws(Model model, HttpServletRequest request) {
		String wsPath=showLoginService.getWebSocketPath();
		model.addAttribute("wsPath", wsPath);
		return "test/ws";
	}
	
	//视频监控测试
	@RequestMapping(value = "/test/video")
	public String video(Model model, HttpServletRequest request) {
		return "test/video";
	}

}
