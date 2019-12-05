package com.chinatelecom.jx.zone.management.bean.logisticsInfo;

import java.security.MessageDigest;

import com.chinatelecom.jx.util.CryptUtils;

public class Test {
	private static final String appId = "42623EF1E11528B582D0E76E93213C21";
	private static final String appSecret = "12985595331454F20C5E5555A9653DDC";
	private static final String serverHost = "http://v3.wanji56.com/open";

	public static void main(String[] args) {
		try{
			String url = "http://v3.wanji56.com";
			
			String encodeUrl1 = java.net.URLEncoder.encode(url, "UTF-8");
			
			String encodeUrl2 = encodeUrl1.replaceAll("%21", "!"); //感叹号不要编码。
			
			String openId = "8E652DEBE380AA4649E8F0F975E2CFF8";
			
			String expireTime = Long.valueOf(System.currentTimeMillis() / 1000 + 3600).toString();
	
			String sign = CryptUtils.md5((appSecret+ appId + openId 
					+ url + expireTime + appSecret).toLowerCase());
			
			String authUrl = new StringBuilder(128)
					.append(serverHost+"/OAuth/Authorize")
					.append("?appId=").append(appId)
					.append("&openId=").append(openId)
					.append("&expireTime=").append(expireTime)
					.append("&url=").append(encodeUrl2).append("&sign=")
					.append(sign.toUpperCase()).toString();
			System.out.println(expireTime);
			System.out.println(authUrl);
			
		}catch (Exception e) {
			System.out.println(e);
		}
		
	}
	
	 public static String MD5(String inStr) {
	        MessageDigest md5 = null;
	        try {
	            md5 = MessageDigest.getInstance("MD5");
	        } catch (Exception e) {
//	            System.out.println(e.toString());
	            e.printStackTrace();
	            return "";
	        }
	        char[] charArray = inStr.toCharArray();
	        byte[] byteArray = new byte[charArray.length];
	 
	        for (int i = 0; i < charArray.length; i++)
	            byteArray[i] = (byte) charArray[i];
	 
	        byte[] md5Bytes = md5.digest(byteArray);
	 
	        StringBuffer hexValue = new StringBuffer();
	 
	        for (int i = 0; i < md5Bytes.length; i++) {
	            int val = ((int) md5Bytes[i]) & 0xff;
	            if (val < 16)
	                hexValue.append("0");
	            hexValue.append(Integer.toHexString(val));
	        }
	 
	        return hexValue.toString();
	    }
}
