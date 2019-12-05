package com.chinatelecom.jx.zone.management.weixin.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.management.util.WeixinUtil;
import com.jfinal.kit.HttpKit;
import com.jfinal.weixin.sdk.kit.ParaMap;
/**
 * @author Javen
 * 2016年1月27日
 * 星座查询
 */
public class StarService {
	private static  String httpUrl="http://apis.baidu.com/bbtapi/constellation/constellation_query";
	public static String getInfo(String star){
		String result=request(httpUrl,star);
		//System.out.println(result);
		JSONObject resultObject = JSON.parseObject(result);
		Integer errNum = resultObject.getInteger("error_code");
		StringBuilder sbf=new StringBuilder();
		if (errNum==0) {
			sbf.append("星座:"+star).append("\n");
			sbf.append("查询结果如下:").append("\n\n");
			JSONObject retDataObject = resultObject.getJSONObject("today");
			sbf.append("今日运势:"+retDataObject.getString("summary")).append("\n");
			sbf.append("桃花运:"+retDataObject.getString("love")).append("\n");
		 	sbf.append("财运:"+retDataObject.getString("money")).append("\n");
		 	sbf.append("健康:"+retDataObject.getString("health")).append("\n");
		 	sbf.append("幸运数字:"+retDataObject.getString("number")).append("\n");
		 	sbf.append("搭配星座:"+retDataObject.getString("QFriend")).append("\n");
		}else {
			sbf.append("\ue336").append(resultObject.getString("retMsg"));
		}
		return sbf.toString();
	}
	
	public static String request(String httpUrl, String httpArg) {
	    return HttpKit.get(httpUrl, ParaMap.create("consName", httpArg).getData(), ParaMap.create("apikey", WeixinUtil.APIKEY).getData());
	}
	
	public static String getGuide(){
		StringBuilder buffer = new StringBuilder();
        buffer.append("\ue321 星座运势操作指南：").append("\n\n");  
        buffer.append("比如输入：星座@天蝎座").append("\n");  
        buffer.append("回复“?”显示主菜单");  
        return buffer.toString();
	}
	public static void main(String[] args) {
		System.out.println(getInfo("420117199210027116"));
	}
}
