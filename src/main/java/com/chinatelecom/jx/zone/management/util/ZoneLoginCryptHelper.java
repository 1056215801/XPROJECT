package com.chinatelecom.jx.zone.management.util;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.binary.Hex;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ZoneLoginCryptHelper {
	private static final Logger logger = LoggerFactory.getLogger(ZoneLoginCryptHelper.class);

	/**
	 * 
	 * @param string
	 * @param timestamp
	 *            yyyyMMddHHmmss
	 * @return
	 * @throws NoSuchAlgorithmException
	 * @throws NoSuchPaddingException
	 * @throws InvalidKeyException
	 * @throws UnsupportedEncodingException
	 * @throws BadPaddingException
	 * @throws IllegalBlockSizeException
	 */
	public static String encryptor(String string, String timestamp) throws NoSuchAlgorithmException, NoSuchPaddingException,
			InvalidKeyException, UnsupportedEncodingException, IllegalBlockSizeException, BadPaddingException {

		String key = "0000000000".concat(timestamp); //3DES的秘钥必须是24位字节的内容
		SecretKey deskey = new SecretKeySpec(key.getBytes(), "DESede");

		Cipher c = Cipher.getInstance("DESede");
		c.init(Cipher.ENCRYPT_MODE, deskey);
		byte[] is = string.getBytes("UTF-8");
		byte[] os = c.doFinal(is);
		//return org.apache.commons.codec.binary.Base64.encodeBase64URLSafeString(os);
		return Hex.encodeHexString(os).toUpperCase();
	}

	public static String decryptor(String string, String timestamp) throws NoSuchAlgorithmException, NoSuchPaddingException,
			InvalidKeyException, IllegalBlockSizeException, BadPaddingException, UnsupportedEncodingException, DecoderException {
		byte [] is = Hex.decodeHex(string.toCharArray());
		//byte[] is = org.apache.commons.codec.binary.Base64.decodeBase64(string);

		String key = "0000000000".concat(timestamp);//3DES的秘钥必须是24位字节的内容
		SecretKey deskey = new SecretKeySpec(key.getBytes(), "DESede");

		Cipher c = Cipher.getInstance("DESede");
		c.init(Cipher.DECRYPT_MODE, deskey);
		byte[] os = c.doFinal(is);
		return new String(os, "UTF-8");
	}
	public static void main(String[] args) throws Exception {
		ZoneLoginCryptHelper helper = new ZoneLoginCryptHelper();
		java.text.SimpleDateFormat df = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
		String timestamp = df.format( new java.util.Date());
//		System.out.println("timestamp: " + timestamp);
		
		String userCode = "18979177626";
		userCode = helper.encryptor(userCode, timestamp);
		
		String redirectUrl = "/admin/main";
		redirectUrl = helper.encryptor(redirectUrl, timestamp);
		StringBuilder builder = new StringBuilder(10240);
		builder.append("http://localhost:8080/XProject/auth/page/validateP2PLogin?")
		.append("_timestamp=").append(timestamp).append("&userCode=").append(userCode)		
		.append("&url=").append(java.net.URLEncoder.encode(redirectUrl, "UTF-8"));
//		System.out.println("url: " + builder.toString());

	}

}
