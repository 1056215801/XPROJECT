package com.chinatelecom.jx.zone.management.service.login;

import java.math.BigDecimal;

import com.chinatelecom.jx.zone.bean.InvokeInfoBean;
/**
 * 微信账号绑定系统用户的业务接口
 * @author ZuoGuangDe
 *
 */
public interface IWeixinBindAccountService {
	/**
	 *  
	 * @param accountId 账号Id
	 * @param openId 用户微信账号
	 * @return
	 */
	public InvokeInfoBean<Integer> bindAccount(BigDecimal accountId,String openId);
}
