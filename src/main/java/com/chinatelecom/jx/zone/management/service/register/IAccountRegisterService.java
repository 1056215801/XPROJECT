package com.chinatelecom.jx.zone.management.service.register;

import java.math.BigDecimal;

import com.chinatelecom.jx.zone.bean.InvokeInfoBean;

public interface IAccountRegisterService {
	/**
	 * 账户注册，Web门户注册
     * @param userName 账户姓名 
	 * @param mobilePhone 手机号码
	 * @param accountPasswd 账号密码
	 * @param openId 用户微信账号
	 * @param areaId 区域Id。
	 * @return 结果对象。success为true，注册成功，value为(accountId,organizationId)；success为false，注册失败，errorCode为错误码，errorMsg为错误描述
	 */
	public InvokeInfoBean<BigDecimal[]> registerAccount(String userName,String mobilePhone,String accountPasswd,String openId,BigDecimal areaId);
	
	
	/**
	 * 账户注册，Web门户注册，附带校验信息是否存在！
     * @param userName 账户姓名 
	 * @param mobilePhone 手机号码
	 * @param accountPasswd 账号密码
	 * @param openId 用户微信账号 
	 * @param areaId 区域Id。
	 * @return 结果对象。success为true，注册成功，value为(accountId,organizationId)；success为false，注册失败，errorCode为错误码，errorMsg为错误描述
	 */
	public InvokeInfoBean<BigDecimal[]> validateRegisterAccount(String userName,String mobilePhone,String accountPasswd,String openId,BigDecimal areaId);	
}
