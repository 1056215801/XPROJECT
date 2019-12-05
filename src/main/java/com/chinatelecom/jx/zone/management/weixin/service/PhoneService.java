package com.chinatelecom.jx.zone.management.weixin.service;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.chinatelecom.jx.zone.management.util.WeixinUtil;
import com.jfinal.kit.HttpKit;
import com.jfinal.weixin.sdk.kit.ParaMap;
/**
 * 手机归属地查询
 */
public class PhoneService {
	private static  String httpUrl="http://apis.baidu.com/apistore/mobilenumber/mobilenumber";
	public static String getPhoneInfo(String phoneNumber){
	//	System.out.println(phoneNumber);
		String result=request2(httpUrl,phoneNumber);
	//	System.out.println(result);
		JSONObject resultObject = JSON.parseObject(result);
		Integer errNum = resultObject.getInteger("errNum");
		StringBuffer sbf=new StringBuffer();
		if (errNum==0) {
			JSONObject retDataObject = resultObject.getJSONObject("retData");
			
			sbf.append("手机号:"+retDataObject.getString("phone")).append("\n");
			sbf.append("归属地查询结果如下:").append("\n\n");
			sbf.append("运营商:"+retDataObject.getString("supplier")).append("\n");
			sbf.append("卡类型:"+retDataObject.getString("suit")).append("\n");
			sbf.append("省份:"+retDataObject.getString("province")).append("\n");
			sbf.append("城市:"+retDataObject.getString("city")).append("\n");
			
		}else {
			sbf.append("\ue336 查询异常,稍后尝试.");
		}
		return sbf.toString();
	}
	
	
	public static String request2(String httpUrl, String httpArg) {
	    return HttpKit.get(httpUrl, ParaMap.create("phone", httpArg).getData(), ParaMap.create("apikey", WeixinUtil.APIKEY).getData());
	}
	
	
	/**
	 * @param urlAll
	 *            :请求接口
	 * @param httpArg
	 *            :参数
	 * @return 返回结果
	 */
	public static String request(String httpUrl, String httpArg) {
	    BufferedReader reader = null;
	    String result = null;
	    StringBuffer sbf = new StringBuffer();
	    httpUrl = httpUrl + "?phone=" + httpArg;
	    try {
	        URL url = new URL(httpUrl);
	        HttpURLConnection connection = (HttpURLConnection) url
	                .openConnection();
	        connection.setRequestMethod("GET");
	        // 填入apikey到HTTP header
	        connection.setRequestProperty("apikey",  WeixinUtil.APIKEY);
	        connection.connect();
	        InputStream is = connection.getInputStream();
	        reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
	        String strRead = null;
	        while ((strRead = reader.readLine()) != null) {
	            sbf.append(strRead);
	            sbf.append("\r\n");
	        }
	        reader.close();
	        result = sbf.toString();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return result;
	}

	
	public static String getGuide(){
		StringBuffer buffer = new StringBuffer();
        buffer.append("\ue00a 手机归属地查询操作指南：").append("\n\n");  
        buffer.append("归属地@手机号吗").append("\n");  
        buffer.append("回复“?”显示主菜单");  
        return buffer.toString();
	}
	public static void main(String[] args) {
		System.out.println(getPhoneInfo("13545191276"));
	}
}
