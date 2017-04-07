package com.cloud.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;



public class HtmlParser {
	
	/**
	 * 根据HTML解析Kineditor中文件下载的内容
	 * @param html
	 * @return Map集合：href=下载地址,text=文件名
	 */
	public static List<Map<String,String>> getMapToHtml(String html){
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		Document doc = Jsoup.parse(html);
		Elements es = doc.select("a[class='ke-insertfile']");
		for (int i = 0; i < es.size(); i++) {
			Element e = es.get(i);
			String href = e.attr("href");
			String text = e.text();
			Map<String,String> map = new HashMap<String, String>();
			map.put("href", href);
			map.put("text", text);
			list.add(map);
		}
		return list;
	}
	
	public static void main(String[] args)  {
		Document doc = Jsoup.parse("<a href='#' class='test'>Test</a>");
		Elements as = doc.select("a[class='test']");
		for (int i = 0; i < as.size(); i++) {
			Element e = as.get(i);
			String href = e.attr("href");
			System.out.println(href);
			String text = e.text();
			System.out.println(text);
		}
	}
}
