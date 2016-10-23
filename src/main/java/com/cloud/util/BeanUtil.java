package com.cloud.util;

import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;

public class BeanUtil {
	/**
	 * 重写工具类BeanUtils，如果为NULL则不复制属性值
	 * @param source newClass
	 * @param target oldClass
	 */
	public static void copyProperties(Object source,Object target){
		BeanUtils.copyProperties(source, target,getNullPropertyNames(source));
	}
	
	public static String[] getNullPropertyNames(Object source){
		final BeanWrapper src = new BeanWrapperImpl(source);
		java.beans.PropertyDescriptor[] pds = src.getPropertyDescriptors();
		Set<String> emptyNames = new HashSet<String>();
		for(java.beans.PropertyDescriptor pd:pds){
			Object srcValue = src.getPropertyValue(pd.getName());
			if(srcValue == null) emptyNames.add(pd.getName());
		}
		String[] result = new String[emptyNames.size()];
		return emptyNames.toArray(result);
	}
	
}
