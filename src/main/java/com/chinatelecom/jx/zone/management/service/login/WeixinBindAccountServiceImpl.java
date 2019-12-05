package com.chinatelecom.jx.zone.management.service.login;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.PostConstruct;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.account.image.bean.AccountImageBean;
import com.chinatelecom.jx.zone.account.image.service.IAccountImageBeanService;
import com.chinatelecom.jx.zone.account.info.bean.AccountInfoBean;
import com.chinatelecom.jx.zone.account.validate.helper.AccountValidateHelper;
import com.chinatelecom.jx.zone.account.weixin.bean.AccountWeixinBean;
import com.chinatelecom.jx.zone.account.weixin.proxy.IAccountWeixinBeanProxy;
import com.chinatelecom.jx.zone.bean.InvokeInfoBean;
import com.chinatelecom.jx.zone.config.info.proxy.IConfigInfoBeanProxy;

/**
 * 微信账号绑定系统用户的业务封装实现
 * 
 * @author ZuoGuangDe
 *
 */
@Service("weixinBindAccountService")
@Transactional
public class WeixinBindAccountServiceImpl implements IWeixinBindAccountService {

	@Autowired
	private IAccountWeixinBeanProxy accountWeixinBeanProxy;
	@Autowired
	private IConfigInfoBeanProxy configInfoBeanProxy;

	@Autowired
	private IAccountImageBeanService accountImageBeanService;


	private static final Logger logger = LoggerFactory.getLogger(WeixinBindAccountServiceImpl.class);

	@PostConstruct
	protected void initialize() {
		logger.info("WeixinBindAccountHelper初始化成功！");
	}

	@Override
	public InvokeInfoBean<Integer> bindAccount(BigDecimal accountId, String openId) {

		
		InvokeInfoBean<Integer> rst = new InvokeInfoBean<Integer>();
		int value = 0;
		List<AccountWeixinBean> list2 = accountWeixinBeanProxy.selectListByAccountIdAndOpenIdAndAppIdAndUnionIdAndNickName(null, openId, null, null,null);
		if (list2.isEmpty()) {
			rst.setSuccess(false);
			rst.setErrorCode(20);
			rst.setErrorMsg("微信信息缺失！");
		} else {
			//需要将多个应用关联的相同的unionId进行统一账户绑定。
			Set<String> unionIdSet = new HashSet<String>(7);
			for (AccountWeixinBean bean2 : list2) {
				if (!StringUtils.isEmpty(bean2.getUnionId())) {
					unionIdSet.add(bean2.getUnionId());
				}
 			}
			if (logger.isTraceEnabled()) {
				StringBuilder builder = new StringBuilder(1024);
				builder.append("微信账户绑定，openId：" + openId + "，关联unionIdSet：" + JSONArray.toJSONString(unionIdSet));
			}
			
			List<AccountWeixinBean> list3 = new ArrayList<AccountWeixinBean>(3);
			for (String unionId: unionIdSet) {
				List<AccountWeixinBean> list4 = accountWeixinBeanProxy.selectListByAccountIdAndOpenIdAndAppIdAndUnionIdAndNickName(null, null, null, unionId,null);
				list3.addAll(list4);								
			}

			for (AccountWeixinBean bean3 : list3) {

				AccountWeixinBean bean4 = new AccountWeixinBean();
				bean4.setAccountId(accountId);
				bean4.setBindId(bean3.getBindId());

				InvokeInfoBean<Integer> rst5 = accountWeixinBeanProxy.validateUpdateByPrimaryKeySelective(bean4);
				if (logger.isTraceEnabled()) {
					StringBuilder builder = new StringBuilder(128).append("微信用户绑定系统账户，").append("，record：")
							.append(JSONObject.toJSONString(bean4)).append("，rst：")
							.append(JSONObject.toJSONString(rst5));
					logger.trace(builder.toString());
				}
				if (!rst5.isSuccess()) {
					rst.setSuccess(false);
					rst.setErrorCode(rst5.getErrorCode());
					rst.setErrorMsg("更新记录失败！");
					break;
				} else {
					value++;
					if (!StringUtils.isEmpty(bean3.getHeadImgurl())) { //微信有头像，判断是否要初始化内置头像
						AccountImageBean bean6 = accountImageBeanService.selectFirstByAccountIdAndImageType(accountId,
								(short) 10);
						if (bean6 == null) { //账户没有默认头像，根据微信头像初始化用户头像
							bean6 = new AccountImageBean();
							bean6.setImageKind((short) 0);
							bean6.setImageType((short) 10);
							bean6.setImageUrl(bean3.getHeadImgurl());
							bean6.setAccountId(accountId);							
							accountImageBeanService.insertSelective(bean6);
							if (logger.isTraceEnabled()) {
								StringBuilder builder = new StringBuilder(384);
								builder.append("基于微信头像初始化系统用户头像，record：").append(JSONObject.toJSONString(bean6)).append("！");
								logger.trace(builder.toString());
							}
						}
					}
					rst.setSuccess(true);
					rst.setErrorCode(0);
					rst.setErrorMsg("绑定账户成功！");

				}
			}
			rst.setValue(value);
		}

		return rst;
	}

}
