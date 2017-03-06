package com.cloud.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;



public class StringUtil {
	
	public static final String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";

	public static final String DATE_FORMAT2 = "YYYY/MM/dd HH:mm";
	
	public static Long getDateToLong(Date date){
		return date.getTime();
	}
	
	public static String formatDate(Date date,String format){
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		String d = sdf.format(date);
		return d;
	}
	
	public static Long getStringToLong(String date,String format){
		try {
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			Date d = sdf.parse(date);
			return getDateToLong(d);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static String getLongToString(Long time,String format){
		Calendar c = Calendar.getInstance();
		c.setTimeInMillis(time);
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		String s = sdf.format(c.getTime());
		return s;
	}
	
	
	public static String HTML2Text(String html) {
		String htmlStr = html; // 含html标签的字符串
		String textStr = "";
		try {
			String regEx_script = "<[\\s]*?script[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?script[\\s]*?>"; // 定义script的正则表达式{或<script[^>]*?>[\\s\\S]*?<\\/script>
			// }
			String regEx_style = "<[\\s]*?style[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?style[\\s]*?>"; // 定义style的正则表达式{或<style[^>]*?>[\\s\\S]*?<\\/style>
			// }
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
			e.printStackTrace();
		}
		return textStr;// 返回文本字符串
	}
	
	public static List<String> getImgStr(int port,String html) {
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
	
	public static Map<String,Long> getBetweenTime2(String temp){
		String before = temp.split("-")[0].trim();
		String after = temp.split("-")[1].trim();
		Map<String, Long> map = new HashMap<String, Long>();
		map.put("beforeTime", getStringToLong(before+" 00:00:00","yyyy-MM-dd HH:mm:ss"));
		map.put("afterTime", getStringToLong(after+" 23:59:59","yyyy-MM-dd HH:mm:ss"));
		return map;
	}
	
	public static String getBetweenToString2(long startTime,long endTime){
		String before = getLongToString(startTime,"yyyy-MM-dd");
		String after = getLongToString(endTime,"yyyy-MM-dd");
		return before + " - " + after;
	}
	
	/**
	 * 格式转换
	 * @param temp DatePicker 传输数据格式 [dd/MM/yyyy - dd/MM/yyyy)
	 * @return beforeTime and afterTime;
	 */
	public static Map<String,Long> getBetweenTime(String temp){
		String before = temp.split("-")[0].trim();
		String after = temp.split("-")[1].trim();
		Map<String, Long> map = new HashMap<String, Long>();
		map.put("beforeTime", getStringToLong(before+" 00:00:00","MM/dd/yyyy HH:mm:ss"));
		map.put("afterTime", getStringToLong(after+" 23:59:59","MM/dd/yyyy HH:mm:ss"));
		return map;
	}
	
	public static String getBetweenToString(long startTime,long endTime){
		String before = getLongToString(startTime,"MM/dd/yyyy");
		String after = getLongToString(endTime,"MM/dd/yyyy");
		return before + " - " + after;
	}
	
	/**
	 * 转换GMT格式时间
	 * @param time
	 * @return
	 */
	public static String getDateToString(Long time){
		String date = getLongToString(time,DATE_FORMAT);
		String str = date.split(" ")[0]+"T"+date.split(" ")[1];
		return str+".000+08:00";
	}
	/**
	 * 转换GMT时间
	 * @param date
	 * @return
	 */
	public static long getDateToLong(String date){
		DateFormat sdf = new SimpleDateFormat("EEE MMM dd yyyy HH:mm:ss 'GMT'Z ('CST')",Locale.US);
		long time = 0;
		try {
			Date d = sdf.parse(date);
			time = getDateToLong(d);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return time;
	}
	
	public static String substring(String str,int length){
		String t = "";
		if(str!=null && !str.equals("")){
			int len = str.length();
			t = len > length ? str.substring(0,length)+"..." : str;
		}
		return t;
	}
	
	public static void main(String[] args) {
		System.out.println(getDateToString(1473224400000l));
	}
	
	
	
}
