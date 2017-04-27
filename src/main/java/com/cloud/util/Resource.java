package com.cloud.util;

public class Resource {
	public static int getRandomCount(int n){
		return (int)(Math.random()*n) + 1;
	}
}
