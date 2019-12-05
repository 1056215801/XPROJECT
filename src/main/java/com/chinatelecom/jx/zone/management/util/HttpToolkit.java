package com.chinatelecom.jx.zone.management.util;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

 
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.entity.BufferedHttpEntity;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntity;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
 

/**
 * @author treebear
 * 
 * @since 2013年11月14日下午4:25:58
 * 
 * @description
 */
public class HttpToolkit {

	/**
	 * 以Post方法访问
	 * 
	 * @param url 请求地址
	 * @param argsMap 携带的参数
	 * @return String 返回结果
	 * @throws Exception
	 */
	public static String POSTMethod(String url, Map<String, Object> argsMap) throws Exception {
		byte[] dataByte = null;
		HttpClient httpClient = new DefaultHttpClient();
		HttpPost httpPost = new HttpPost(url);
		// 设置参数
		UrlEncodedFormEntity encodedFormEntity = new UrlEncodedFormEntity(setHttpParams(argsMap), "UTF-8");
		httpPost.setEntity(encodedFormEntity);
		// httpPost.setHeader("", "");
		// 执行请求
		HttpResponse httpResponse = httpClient.execute(httpPost);
		// 获取返回的数据
		HttpEntity httpEntity = httpResponse.getEntity();
		if (httpEntity != null) {
			byte[] responseBytes = getData(httpEntity);
			dataByte = responseBytes;
			httpPost.abort();
		}
		// 将字节数组转换成为字符串
		String result = bytesToString(dataByte);
		return result;
	}

	/**
	 * 以Post方法访问
	 * 
	 * @param url 请求地址
	 * @param argsMap 携带的参数
	 * @return String 返回结果
	 * @throws Exception
	 */
	public static String POST4SgkjMethod(String url, String cookie, String token) throws Exception {
		byte[] dataByte = null;
		HttpClient httpClient = new DefaultHttpClient();
		HttpPost httpPost = new HttpPost(url);
		// 设置参数
		// UrlEncodedFormEntity encodedFormEntity = new UrlEncodedFormEntity(setHttpParams(argsMap), "UTF-8");
		// httpPost.setEntity(encodedFormEntity);
		if (StringUtil.checkNotNull(cookie)) {
			httpPost.setHeader("Cookie", cookie);
		}
		if (StringUtil.checkNotNull(token)) {
			httpPost.setHeader("X-CSRF-Token", token);
		}
		// 执行请求
		HttpResponse httpResponse = httpClient.execute(httpPost);
		// 获取返回的数据
		HttpEntity httpEntity = httpResponse.getEntity();
		if (httpEntity != null) {
			byte[] responseBytes = getData(httpEntity);
			dataByte = responseBytes;
			httpPost.abort();
		}
		// 将字节数组转换成为字符串
		String result = bytesToString(dataByte);
		return result;
	}

	/**
	 * 以Get方法访问
	 * 
	 * @param url 请求地址
	 * @return String
	 * @throws Exception
	 */
	public static String GETMethod(String url, Map<String, Object> argsMap) throws Exception {
		byte[] dataByte = null;
		HttpClient httpClient = new DefaultHttpClient();
		// 为GET请求链接构造参数
		url = formatGetParameter(url, argsMap);
		HttpGet httpGet = new HttpGet(url);
		HttpResponse httpResponse = httpClient.execute(httpGet);
		HttpEntity httpEntity = httpResponse.getEntity();
		if (httpEntity != null) {
			byte[] responseBytes = getData(httpEntity);
			dataByte = responseBytes;
			httpGet.abort();
		}
		// 将字节数组转换成为字符串
		String result = bytesToString(dataByte);
		return result;
	}

	/**
	 * 以Get方法访问
	 * 
	 * @param url 请求地址
	 * @return String
	 * @throws Exception
	 */
	public static String GET4SgkjMethod(String url, String cookie, String token) throws Exception {
		byte[] dataByte = null;
		HttpClient httpClient = new DefaultHttpClient();
		// 为GET请求链接构造参数
		// url = formatGetParameter(url, argsMap);
		HttpGet httpGet = new HttpGet(url);
		if (StringUtil.checkNotNull(cookie)) {
			httpGet.setHeader("Cookie", cookie);
		}
		if (StringUtil.checkNotNull(token)) {
			httpGet.setHeader("X-CSRF-Token", token);
		}
		HttpResponse httpResponse = httpClient.execute(httpGet);
		HttpEntity httpEntity = httpResponse.getEntity();
		if (httpEntity != null) {
			byte[] responseBytes = getData(httpEntity);
			dataByte = responseBytes;
			httpGet.abort();
		}
		// 将字节数组转换成为字符串
		String result = bytesToString(dataByte);
		return result;
	}

	/**
	 * 以Put方法访问
	 * 
	 * @param url 请求地址
	 * @param argsMap 携带的参数
	 * @return String
	 * @throws Exception
	 */
	public static String PUTMethod(String url, Map<String, Object> argsMap) throws Exception {
		byte[] dataByte = null;
		HttpClient httpClient = new DefaultHttpClient();
		HttpPut httpPut = new HttpPut(url);
		// 设置参数
		UrlEncodedFormEntity encodedFormEntity = new UrlEncodedFormEntity(setHttpParams(argsMap), "UTF-8");
		httpPut.setEntity(encodedFormEntity);
		// 执行请求
		HttpResponse httpResponse = httpClient.execute(httpPut);
		// 获取返回的数据
		HttpEntity httpEntity = httpResponse.getEntity();
		if (httpEntity != null) {
			byte[] responseBytes = getData(httpEntity);
			dataByte = responseBytes;
			httpPut.abort();
		}
		// 将字节数组转换成为字符串
		String result = bytesToString(dataByte);
		return result;
	}
	
	/**
	 * 以Post方法访问
	 * 
	 * @param url 请求地址
	 * @param argsMap 携带的参数
	 * @return String 返回结果
	 * @throws Exception
	 */
	public static String POST4FileMethod(String url, File file, String path) throws Exception {
		byte[] dataByte = null;
		HttpClient httpClient = new DefaultHttpClient();
		// MultipartEntity entity = new MultipartEntity();
		MultipartEntity entity = new MultipartEntity(HttpMultipartMode.BROWSER_COMPATIBLE, null,
				Charset.forName("UTF-8"));
		entity.addPart("path", new StringBody(path, Charset.forName("UTF-8")));
		entity.addPart("attachment", new FileBody(file));
		//System.out.println(file.getName());
		HttpPost httpPost = new HttpPost(url);
		// httpPost.setHeaders(headers);
		httpPost.setEntity(entity);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		// 获取返回的数据
		HttpEntity httpEntity = httpResponse.getEntity();
		if (httpEntity != null) {
			byte[] responseBytes = getData(httpEntity);
			dataByte = responseBytes;
			httpPost.abort();
		}
		// 将字节数组转换成为字符串
		String result = bytesToString(dataByte);
		return result;
	}
	
	/**
	 * 以Post方法访问
	 * 
	 * @param url 请求地址
	 * @param argsMap 携带的参数
	 * @return String 返回结果
	 * @throws Exception
	 */
	public static String POST4FilesMethod(String url, List<File> files, String path) throws Exception {
		byte[] dataByte = null;
		HttpClient httpClient = new DefaultHttpClient();
		// MultipartEntity entity = new MultipartEntity();
		MultipartEntity entity = new MultipartEntity(HttpMultipartMode.BROWSER_COMPATIBLE, null,
				Charset.forName("UTF-8"));
		entity.addPart("path", new StringBody(path, Charset.forName("UTF-8")));
		for (File file : files) {
			entity.addPart("attachments", new FileBody(file));
		}
		// System.out.println(file.getName());
		HttpPost httpPost = new HttpPost(url);
		// httpPost.setHeaders(headers);
		httpPost.setEntity(entity);
		HttpResponse httpResponse = httpClient.execute(httpPost);
		// 获取返回的数据
		HttpEntity httpEntity = httpResponse.getEntity();
		if (httpEntity != null) {
			byte[] responseBytes = getData(httpEntity);
			dataByte = responseBytes;
			httpPost.abort();
		}
		// 将字节数组转换成为字符串
		String result = bytesToString(dataByte);
		return result;
	}


	/**
	 * 构造GET请求地址的参数拼接
	 * 
	 * @param url
	 * @param argsMap
	 * @return String
	 */
	private static String formatGetParameter(String url, Map<String, Object> argsMap) {
		if ((url != null) && (url.length() > 0)) {
			if (!url.endsWith("?")) {
				url = url + "?";
			}

			if ((argsMap != null) && !argsMap.isEmpty()) {
				Set<Entry<String, Object>> entrySet = argsMap.entrySet();
				Iterator<Entry<String, Object>> iterator = entrySet.iterator();
				while (iterator.hasNext()) {
					Entry<String, Object> entry = iterator.next();
					if (entry != null) {
						String key = entry.getKey();
						String value = entry.getValue().toString();
						url = url + key + "=" + value;
						if (iterator.hasNext()) {
							url = url + "&";
						}
					}
				}
			}
		}
		return url;
	}

	/**
	 * 获取数据
	 * 
	 * @param httpEntity
	 * @return
	 * @throws Exception
	 */
	private static byte[] getData(HttpEntity httpEntity) throws Exception {
		BufferedHttpEntity bufferedHttpEntity = new BufferedHttpEntity(httpEntity);
		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
		bufferedHttpEntity.writeTo(byteArrayOutputStream);
		byte[] responseBytes = byteArrayOutputStream.toByteArray();
		return responseBytes;
	}

	/**
	 * 设置HttpPost请求参数
	 * 
	 * @param argsMap
	 * @return BasicHttpParams
	 */
	private static List<BasicNameValuePair> setHttpParams(Map<String, Object> argsMap) {
		List<BasicNameValuePair> nameValuePairList = new ArrayList<BasicNameValuePair>();
		// 设置请求参数
		if ((argsMap != null) && !argsMap.isEmpty()) {
			Set<Entry<String, Object>> set = argsMap.entrySet();
			Iterator<Entry<String, Object>> iterator = set.iterator();
			while (iterator.hasNext()) {
				Entry<String, Object> entry = iterator.next();
				if(entry.getValue()==null) continue ;
				BasicNameValuePair basicNameValuePair = new BasicNameValuePair(entry.getKey(), entry.getValue()
						.toString());
				nameValuePairList.add(basicNameValuePair);
			}
		}
		return nameValuePairList;
	}

	/**
	 * 将字节数组转换成字符串
	 * 
	 * @param bytes
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	private static String bytesToString(byte[] bytes) throws UnsupportedEncodingException {
		if (bytes != null) {
			String returnStr = new String(bytes, "utf-8");
			return returnStr;
		}
		return null;
	}
	
	public static String getContent(String url) throws Exception {
		StringBuilder sb = new StringBuilder();
		HttpClient client = new DefaultHttpClient();
		HttpParams httpParams = client.getParams(); // 设置网络超时参数
		HttpConnectionParams.setConnectionTimeout(httpParams, 10000);
		HttpConnectionParams.setSoTimeout(httpParams, 10000);
		HttpResponse response = client.execute(new HttpGet(url));
		HttpEntity entity = response.getEntity();
		if (entity != null) {
			BufferedReader reader = new BufferedReader(new InputStreamReader(entity.getContent(), "UTF-8"), 8192);
			String line = null;
			while ((line = reader.readLine()) != null) {
				sb.append(line);
			}
			reader.close();
		}
		return sb.toString();
	}
	

	
/*	public static String getPostContent(String url) throws Exception {
		StringBuilder sb = new StringBuilder();
		HttpClient client = new DefaultHttpClient();
		HttpParams httpParams = client.getParams(); // 设置网络超时参数
		HttpConnectionParams.setConnectionTimeout(httpParams, 10000);
		HttpConnectionParams.setSoTimeout(httpParams, 10000);
		// 创建httppost
		HttpPost httppost = new HttpPost(
						"http://localhost:8080/myDemo/Ajax/serivceJ.action");
		HttpResponse response = client.execute(new HttpGet(url));
		HttpEntity entity = response.getEntity();
		if (entity != null) {
			BufferedReader reader = new BufferedReader(new InputStreamReader(entity.getContent(), "UTF-8"), 8192);
			String line = null;
			while ((line = reader.readLine()) != null) {
				sb.append(line);
			}
			reader.close();
		}
		return sb.toString();
	}*/

}
