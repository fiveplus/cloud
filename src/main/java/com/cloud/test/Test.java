package com.cloud.test;



import java.lang.reflect.Array;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

import com.cloud.entity.User;
import com.cloud.util.BeanUtil;


public class Test {
	public static void main(String[] args) {
		//A<User> a = new A<User>();
		//a.a();
		/*
		User user = new User();
		user.setId(1);
		user.setLoginName("zhangsan");
		user.setCreateTime(13456l);
		
		User user2 = new User();
		user2.setId(1);
		user2.setLoginName("lisi");
		user2.setCreateTime(null);
		
		BeanUtil.copyProperties(user2, user);
		
		System.out.println(user.getLoginName()+" "+user.getCreateTime());
		System.out.println(user2.getLoginName()+" "+user2.getCreateTime());
		*/
		
	}
	
	
	public static <T,U> T[] copyOf(U[] original, int newLength, Class<? extends T[]> newType) {
        @SuppressWarnings("unchecked")
        T[] copy = ((Object)newType == (Object)Object[].class)
            ? (T[]) new Object[newLength]
            : (T[]) Array.newInstance(newType.getComponentType(), newLength);
        System.arraycopy(original, 0, copy, 0,
                         Math.min(original.length, newLength));
        T[] a = null;
        boolean flag = (Object)newType == Object[].class;
        
        return copy;
    }
	
}

interface B<T>{
	
}

class A<T> implements B<T>{
	Class<T> getClasses(){
		Class<T> entityClass = null;
		Type genType = getClass().getGenericSuperclass();  
        Type[] params = ((ParameterizedType) genType).getActualTypeArguments();  
        entityClass = (Class) params[0]; 
        return entityClass;
	}
	
	void a(){
		System.out.println(getClass().getSimpleName());
	}
}
