package com.cloud.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesUtil {
	private static String proFileName = "/config.properties";
	private static Properties pro;
	static{
		try { 
            pro = new Properties();  
            InputStream in = PropertiesUtil.class.getResourceAsStream(proFileName);  
            pro.load(in);  
            in.close();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
	}
	
	public static String getValue(String key){
		return pro.getProperty(key);
	}
	
	public static void main(String[] args) {
		System.out.println(getValue("RONGYUN_KEY"));
	}
	

	
}
