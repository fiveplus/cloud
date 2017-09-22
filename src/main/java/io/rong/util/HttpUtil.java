package io.rong.util;

import io.rong.models.SdkHttpResult;

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import org.apache.log4j.Logger;


public class HttpUtil {
	
	private HttpUtil(){}
	
	private static final Logger LOGGER = Logger.getLogger(HttpUtil.class); 
	
	private static final String APPKEY = "RC-App-Key";
	private static final String NONCE = "RC-Nonce";
	private static final String TIMESTAMP = "RC-Timestamp";
	private static final String SIGNATURE = "RC-Signature";

	// 设置body体
	public static void setBodyParameter(StringBuilder sb, HttpURLConnection conn){
		try{
			DataOutputStream out = new DataOutputStream(conn.getOutputStream());
			out.writeBytes(sb.toString());
			out.flush();
			out.close();
		}catch(IOException e){
			LOGGER.error(e);
		}
	}

	// 添加签名header
	public static HttpURLConnection CreatePostHttpConnection(String appKey,
			String appSecret, String uri){
		HttpURLConnection conn = null;
		try{
			String nonce = String.valueOf(Math.random() * 1000000);
			String timestamp = String.valueOf(System.currentTimeMillis() / 1000);
			StringBuilder toSign = new StringBuilder(appSecret).append(nonce)
					.append(timestamp);
			String sign = CodeUtil.hexSHA1(toSign.toString());

			URL url = new URL(uri);
			conn = (HttpURLConnection) url.openConnection();
			conn.setUseCaches(false);
			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setInstanceFollowRedirects(true);
			conn.setConnectTimeout(30000);
			conn.setReadTimeout(30000);

			conn.setRequestProperty(APPKEY, appKey);
			conn.setRequestProperty(NONCE, nonce);
			conn.setRequestProperty(TIMESTAMP, timestamp);
			conn.setRequestProperty(SIGNATURE, sign);
			conn.setRequestProperty("Content-Type",
					"application/x-www-form-urlencoded");
		}catch(IOException e){
			LOGGER.error(e);
		}
		return conn;
	}

	public static byte[] readInputStream(InputStream inStream) {
		byte[] data = null;
		try{
			ByteArrayOutputStream outStream = new ByteArrayOutputStream();
			byte[] buffer = new byte[1024];
			int len = 0;
			while ((len = inStream.read(buffer)) != -1) {
				outStream.write(buffer, 0, len);
			}
			data = outStream.toByteArray();
			outStream.close();
			inStream.close();
		}catch(IOException e){
			LOGGER.error(e);
		}
		return data;
	}

	public static SdkHttpResult returnResult(HttpURLConnection conn){
		String result = null;
		InputStream input = null;
		int responseCode = -1;
		try{
			responseCode = conn.getResponseCode();
			if (responseCode == 200) {
				input = conn.getInputStream();
			} else {
				input = conn.getErrorStream();
			}
			result = new String(readInputStream(input),"UTF-8");
		}catch(IOException e){
			LOGGER.error(e);
		}
		return new SdkHttpResult(responseCode, result);
	}
}
