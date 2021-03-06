package com.cloud.util;

import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Properties;
import org.apache.log4j.Logger;

public class PropertiesUtil {

	private static final Logger LOGGER = Logger.getLogger(PropertiesUtil.class);

	private PropertiesUtil(){}
	
	private static String proFileName = "/config.properties";
	private static Properties pro;
	static{
		try { 
            pro = new Properties();  
            InputStreamReader in = new InputStreamReader(PropertiesUtil.class.getResourceAsStream(proFileName),"UTF-8");  
            pro.load(in);  
            in.close();  
        } catch (IOException e) {  
            LOGGER.error(e);
        }  
	}
	
	public static String getValue(String key){
		return pro.getProperty(key);
	}
	
	public static void main(String[] args) {
	    System.out.println(getValue("RONGYUN_KEY"));
	}
	

	
}
