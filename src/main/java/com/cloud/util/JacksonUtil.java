package com.cloud.util;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.log4j.Logger;

/**
 * Json处理类
 */
public class JacksonUtil {

    private static final Logger LOGGER = Logger.getLogger(JacksonUtil.class);
	
	private JacksonUtil(){}
	
	private final static ObjectMapper objectMapper = new ObjectMapper();
	
	/** 
     * 使用泛型方法，把json字符串转换为相应的JavaBean对象。 
     * (1)转换为普通JavaBean：readValue(json,Student.class) 
     * (2)转换为List,如List<Student>,将第二个参数传递为Student 
     * [].class.然后使用Arrays.asList();方法把得到的数组转换为特定类型的List 
     *  
     * @param jsonStr 
     * @param valueType 
     * @return 
     */  
	public static <T> T readValue(String jsonStr,Class<T> valueType){
		try {
			return objectMapper.readValue(jsonStr, valueType);
		} catch (Exception e) {
            LOGGER.error(e);
		}
		return null;
	}
	
	/** 
     * json数组转List 
     * @param jsonStr 
     * @param valueTypeRef 
     * @return 
     */  
    public static <T> T readValue(String jsonStr, TypeReference<T> valueTypeRef){
        try {  
            return objectMapper.readValue(jsonStr, valueTypeRef);  
        } catch (Exception e) {
            LOGGER.error(e);
        }  
  
        return null;  
    }  
    
    /** 
     * 把JavaBean转换为json字符串 
     *  
     * @param object 
     * @return 
     */  
    public static String toJSon(Object object) {
        try {  
            return objectMapper.writeValueAsString(object);  
        } catch (Exception e) {
            LOGGER.error(e);
        }
        return null;  
    }  
	
	
}
