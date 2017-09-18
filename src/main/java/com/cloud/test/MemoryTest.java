package com.cloud.test;


public class MemoryTest {
	public static void main(String[] args) {
		System.out.println(toMemoryInfo());
	}
	
	public static String toMemoryInfo(){
		Runtime currRuntime = Runtime.getRuntime();
		float nFree = currRuntime.freeMemory()/1024/1024;
		float nTotal = currRuntime.totalMemory()/1024/1024;
		return nFree+"M / "+nTotal+"M (free/total)";
	}
	
}
