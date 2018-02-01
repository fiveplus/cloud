package com.cloud.util;

import org.apache.log4j.Logger;

import java.security.MessageDigest;

public class MD5 {
	
	private MD5(){}

	private static final Logger LOGGER = Logger.getLogger(MD5.class);
	
	public static String md5Encode(String inStr){
		String value = "";
		try{
			MessageDigest md5 = null;
			md5 = MessageDigest.getInstance("MD5");

			byte[] byteArray = inStr.getBytes("UTF-8");
			byte[] md5Bytes = md5.digest(byteArray);
			StringBuffer hexValue = new StringBuffer();
			for(int i = 0;i<md5Bytes.length;i++){
				int val = ((int)md5Bytes[i]) & 0xff;
				if(val < 16){
					hexValue.append("0");
				}
				hexValue.append(Integer.toHexString(val));
			}
			value = hexValue.toString();
		}catch(Exception e){
			LOGGER.error(e);
		}
		return value;
	}
	
	public static String GetMD5Password(String strObj){
		if(strObj == null) return null;
		int count = 5;
		String result = strObj;
		for(int i = 0;i < count;i++){
			result = md5Encode(result);
		}
		return result;
	}
	
	public static void main(String[] args){
		System.out.println(GetMD5Password("123456"));
	}
}
