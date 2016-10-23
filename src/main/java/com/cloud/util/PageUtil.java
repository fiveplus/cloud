package com.cloud.util;

import java.util.List;


public class PageUtil {
	
	private int pageSize;
	
	private int count;
	private int page;
	private List<Integer> pageList;	
	private int pageCount;
	
	public PageUtil(int page,int count,int pageSize){
		this.pageSize = pageSize;
		initPage(page,count);
	}
	
	public void initPage(int page,int count){
		this.page = page;
		this.count = count;
		this.pageCount = initPageCount(count);
		if(page < 1){
			page = 1;
		}
		if(page > pageCount){
			page = pageCount;
		}
		PageCode pc = new PageCode(page, pageCount);
		this.pageList = pc.getPageList();
	}
	
	public int initPageCount(int count){
		int pageCount = 1;
		if(count%pageSize==0 && count > 0){
			pageCount = count/pageSize; 
		}else{
			pageCount = count/pageSize + 1; 
		}
		if(count==0){
			pageCount = 1;
		}
		return pageCount;
	}
	
	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}
	
	public List<Integer> getPageList(){
		return this.pageList;
	}
	
	public void setPageList(List<Integer> pageList){
		this.pageList = pageList;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getCount() {
		return count;
	}
	
}
