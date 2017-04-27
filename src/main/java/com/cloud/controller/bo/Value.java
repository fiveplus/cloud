package com.cloud.controller.bo;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Value {
	private String from;
	private String to;
	private String label;
	private String customClass;
	
	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getCustomClass() {
		return customClass;
	}

	public void setCustomClass(String customClass) {
		this.customClass = customClass;
	}

	private List<String> classes = new ArrayList<String>(){{
		add("ganttRed");
		add("ganttGreen");
		add("ganttBlue");
		add("ganttOrange");
	}};
	
	public Value(){
		Random r = new Random();
		int x = r.nextInt(3);
		this.customClass = classes.get(x); 
	}
	
	public Value(String from,String to,String label){
		Random r = new Random();
		int x = r.nextInt(3);
		this.customClass = classes.get(x); 
		
		this.from = from;
		this.to = to;
		this.label = label;
	}
	
	@Override
	public String toString() {
		String values = "[{" +
			"\"from\":\"/Date("+this.from+")/\"," +
			"\"to\":\"/Date("+this.to+")/\"," +
			"\"label\":\""+this.label+"\"," +
			"\"customClass\":\""+this.customClass+"\"" +
		"}]";
		return values;
	}
}
