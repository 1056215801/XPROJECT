package com.chinatelecom.jx.zone.management.weixin.service;

import java.util.HashMap;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.management.util.DateUtil;
import com.chinatelecom.jx.zone.management.util.WeixinUtil;
import com.jfinal.kit.HttpKit;
import com.jfinal.weixin.sdk.kit.ParaMap;

public class HistorytodayService {
	private static  String httpUrl="http://apis.baidu.com/avatardata/historytoday/lookup";
	public static String getInfo(){
		String result=request(httpUrl,DateUtil.getMonth(),DateUtil.getDay());
	//	System.out.println(result);
		JSONObject resultObject = JSON.parseObject(result);
		Integer errNum = resultObject.getInteger("error_code");
		StringBuilder sbf=new StringBuilder();
		if (errNum==0){
			JSONArray arr = resultObject.getJSONArray("result");
		 	for(int i=0;i<arr.size();i++){
		 		JSONObject obj=(JSONObject)arr.get(i);
		 		sbf.append(  obj.getString("year")+"年"+obj.getString("month")+"月"+obj.getString("day")+"日").append("\n");
		 		sbf.append(obj.getString("title")).append("\n");  
		 	}
		}else {
			sbf.append("\ue336").append(resultObject.getString("retMsg"));
		}
		return sbf.toString();
	}
	
	public static String request(String httpUrl, String month,String day) {
		Map<String ,String> map= new HashMap<String,String>() ;
		map.put("ri", day);
		map.put("type", "1");
		map.put("yue", month) ;
	    return HttpKit.get(httpUrl,map , ParaMap.create("apikey", WeixinUtil.APIKEY).getData());
	}
	
	public static String getGuide(){
		StringBuilder buffer = new StringBuilder();
        buffer.append("回复“?”显示主菜单");  
        return buffer.toString();
	}
	public static void main(String[] args) {
		System.out.println(getInfo());
	}
}
