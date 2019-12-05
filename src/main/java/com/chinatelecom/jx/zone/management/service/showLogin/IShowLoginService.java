package com.chinatelecom.jx.zone.management.service.showLogin;

import java.math.BigDecimal;

public interface IShowLoginService {

	/**
	 * 判读该账户企业信息是否完善，是否配置产品展销角色
	 * @param accountId
	 * @return
	 */
	public boolean isComplete(BigDecimal accountId);
	//获取当前环境的路径
    String  getUrlPath();
    
    String getJxGovCaClientId();
    
    //跨域请求
    String getAccessAllowUrl();
    
    
  //websocket
    String getWebSocketPath();
}
