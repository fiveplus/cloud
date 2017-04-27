package com.cloud.util;

import java.security.MessageDigest;

public class MD5 {
	public static String md5Encode(String inStr) throws Exception{
		MessageDigest md5 = null;
		try{
			md5 = MessageDigest.getInstance("MD5");
		}catch(Exception e){
			System.out.println(e.toString());
			e.printStackTrace();
			return "";
		}
		
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
		return hexValue.toString();
	}
	
	public static String GetMD5Password(String strObj) throws Exception{
		if(strObj == null) return null;
		int count = 5;
		String result = strObj;
		for(int i = 0;i<count;i++){
			result = md5Encode(result);
		}
		return result;
	}
	
	public static void main(String[] args) throws Exception {
		System.out.println(GetMD5Password("123456"));
	}
}
