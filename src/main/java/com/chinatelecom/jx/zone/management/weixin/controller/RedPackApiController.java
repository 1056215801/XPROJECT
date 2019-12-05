package com.chinatelecom.jx.zone.management.weixin.controller;

import com.chinatelecom.jx.zone.management.util.ReadPackUtils;
import com.jfinal.core.Controller;
import com.jfinal.kit.PropKit;
import com.jfinal.weixin.sdk.api.ApiResult;
import com.jfinal.weixin.sdk.api.UserApi;

/**
 * 微信红包demo
 * @author Javen
 * 2016年5月28日
 */
public class RedPackApiController extends Controller {
	private static String sendName = PropKit.get("mch_name");
	//微信签名证书路径 "d:/cert/apiclient_cert.p12"  
	private static String certPath = "/opt/zone/cert/apiclient_cert.p12";
	//商户相关资料
	String wxappid = PropKit.get("appId");
	// 微信支付分配的商户号
	String partner = PropKit.get("mch_id");
	//API密钥
	String paternerKey = PropKit.get("paternerKey");
	//接受人 xwf
	String userOpenId = "obnfavjAH7CRrrwIpVI7L7vHLLf0" ;
	//普通红包
	public void send() {
		String isSend = "";
		String act_name=getPara("act_name"); //活动名称
		String wishing=getPara("wishing"); //活动祝福语
		String remark=getPara("remark"); //活动备注
		String total_num=getPara("total_num"); //数量
		String path=getPara("path"); //路径
		String money=getPara("money"); // 
		try{ 
	 	 isSend = ReadPackUtils.send(getRequest(),money, total_num, wishing,
	 			act_name, remark,userOpenId ,partner, wxappid, sendName, paternerKey,path);
		}catch(Exception e){
			isSend =e.getMessage();
		}
		renderJson(isSend);
	}
	//裂变红包
	public void sendGroup() {
		String isSend = "";
		String act_name=getPara("act_name"); //活动名称
		String wishing=getPara("wishing"); //活动祝福语
		String remark=getPara("remark"); //活动备注
		String total_num=getPara("total_num"); //数量
		String path=getPara("path"); //路径
		String money=getPara("money"); // 
		try{ 
	 	 isSend = ReadPackUtils.sendGroup(getRequest(), money, total_num, wishing,
	 			act_name, remark,userOpenId ,partner, wxappid, sendName, paternerKey,path);
		}catch(Exception e){
			isSend =e.getMessage();
		}
		renderJson(isSend);
	}

	public void query() {
		String query = ReadPackUtils.query("10000098201411111234567890", partner, wxappid, paternerKey, certPath);
		renderJson(query);
	}

	public void allUser() {
		
		ApiResult result =UserApi.getFollows();

	}
}