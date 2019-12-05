package com.chinatelecom.jx.zone.management.service.login;

import java.math.BigDecimal;
/**
 *  微信用户关联，系统自助注册账户的的业务接口
 * @author ZuoGuangDe
 *
 */
public interface IWeixinRegisterAccountService {
	public void registerAccount(String mobilePhone,String accountName,String accountPasswd,BigDecimal areaId,String openId);
}
