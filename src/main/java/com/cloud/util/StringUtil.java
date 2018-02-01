package com.cloud.util;

import org.apache.log4j.Logger;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;



public class StringUtil {
	
	private StringUtil(){}

	private static final Logger LOGGER = Logger.getLogger(StringUtil.class);

	/**
	 * 将HTML过滤标签转换为字符串
	 * @param html
	 * @return
	 */
	public static String HTML2Text(String html) {
		String htmlStr = html; // 含html标签的字符串
		String textStr = "";
		try {
			String regEx_script = "<[\\s]*?script[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?script[\\s]*?>"; // 定义script的正则表达式{或<script[^>]*?>[\\s\\S]*?<\\/script>
			String regEx_style = "<[\\s]*?style[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?style[\\s]*?>"; // 定义style的正则表达式{或<style[^>]*?>[\\s\\S]*?<\\/style>
			String regEx_html = "<[^>]+>"; // 定义HTML标签的正则表达式

			Pattern p_script = Pattern.compile(regEx_script,
					Pattern.CASE_INSENSITIVE);
			Matcher m_script = p_script.matcher(htmlStr);
			htmlStr = m_script.replaceAll(""); // 过滤script标签

			Pattern p_style = Pattern.compile(regEx_style,
					Pattern.CASE_INSENSITIVE);
			Matcher m_style = p_style.matcher(htmlStr);
			htmlStr = m_style.replaceAll(""); // 过滤style标签

			Pattern p_html = Pattern.compile(regEx_html,
					Pattern.CASE_INSENSITIVE);
			Matcher m_html = p_html.matcher(htmlStr);
			htmlStr = m_html.replaceAll(""); // 过滤html标签

			textStr = htmlStr;
		} catch (Exception e) {
			LOGGER.error(e);
		}
		return textStr; // 返回文本字符串
	}

	/**
	 * 获取HTML中所有的图片路径
	 * @param port
	 * @param html
	 * @return
	 */
	public static List<String> getImagePath(int port,String html) {
		html = html.replaceAll("\r\n", "");
		String img = "";
		Pattern p_image;
		Matcher m_image;
		List<String> pics = new ArrayList<String>();
		String regEx_img = "<img.*src=(.*?)[^>]*?>";
		p_image = Pattern.compile(regEx_img, Pattern.CASE_INSENSITIVE);
		m_image = p_image.matcher(html);
		while (m_image.find()) {
			img = img + "," + m_image.group();
			Matcher m = Pattern.compile("src\\s*=\\s*\"?(.*?)(\"|>|\\s+)").matcher(img);
			while (m.find()) {
				int width = ImageUtil.getImageWidth(port,m.group(1));
				if(width > 100 || width == -1){
					pics.add(m.group(1));
				}
			}
		}
		
		return pics;
	}
	
	public static String substring(String str,int length){
		String t = "";
		if(str!=null && !str.equals("")){
			int len = str.length();
			t = len > length ? str.substring(0,length)+"..." : str;
		}
		return t;
	}
	
}
