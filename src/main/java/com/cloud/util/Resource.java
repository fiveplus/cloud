package com.cloud.util;

public class Resource {
	
	private Resource(){}
	
	public static int getRandomCount(int n){
		return (int)(Math.random()*n) + 1;
	}
	
	public static final String N = "N";
	public static final String Y = "Y";
}
