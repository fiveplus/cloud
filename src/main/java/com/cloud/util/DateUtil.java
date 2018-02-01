package com.cloud.util;

import org.apache.log4j.Logger;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class DateUtil {
    private static final Logger LOGGER = Logger.getLogger(DateUtil.class);

    private DateUtil(){}

    private static final String DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";

    private static final String DATE_FORMAT2 = "YYYY/MM/dd HH:mm";

    /**
     * 将Date转换为Long
     * @param date
     * @return
     */
    public static Long convertDate(Date date){
        return date.getTime();
    }

    /**
     * 将Date转换为String
     * @param date
     * @param format
     * @return
     */
    public static String convertDate(Date date,String format){
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(date);
    }

    /**
     * 将String类型的Date转换为Long
     * @param date
     * @param format
     * @return
     */
    public static Long convertDate(String date,String format){
        try {
            SimpleDateFormat sdf = new SimpleDateFormat(format);
            Date d = sdf.parse(date);
            return convertDate(d);
        } catch (ParseException e) {
            LOGGER.error(e);
        }
        return null;
    }

    /**
     * 将Long类型的Date转换为String
     * @param time
     * @param format
     * @return
     */
    public static String convertDate(Long time,String format){
        Calendar c = Calendar.getInstance();
        c.setTimeInMillis(time);
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(c.getTime());
    }

    public static Map<String,Long> getBetweenTime2(String temp){
        String before = temp.split(" - ")[0].trim();
        String after = temp.split(" - ")[1].trim();
        Map<String, Long> map = new HashMap<String, Long>();
        map.put("beforeTime", convertDate(before+" 00:00:00","yyyy-MM-dd HH:mm:ss"));
        map.put("afterTime", convertDate(after+" 23:59:59","yyyy-MM-dd HH:mm:ss"));
        return map;
    }

    public static String getBetweenToString2(long startTime,long endTime){
        String before = convertDate(startTime,"yyyy-MM-dd");
        String after = convertDate(endTime,"yyyy-MM-dd");
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
        map.put("beforeTime", convertDate(before+" 00:00:00","MM/dd/yyyy HH:mm:ss"));
        map.put("afterTime", convertDate(after+" 23:59:59","MM/dd/yyyy HH:mm:ss"));
        return map;
    }

    public static String getBetweenToString(long startTime,long endTime){
        String before = convertDate(startTime,"MM/dd/yyyy");
        String after = convertDate(endTime,"MM/dd/yyyy");
        return before + " - " + after;
    }

    /**
     * 转换GMT格式时间
     * @param time
     * @return
     */
    public static String getDateToString(Long time){
        String date = convertDate(time,DATE_FORMAT);
        String str = date.split(" ")[0]+"T"+date.split(" ")[1];
        return str+".000+08:00";
    }
    /**
     * 转换GMT时间
     * @param date
     * @return
     */
    public static long getDateToLong(String date){
        DateFormat sdf = new SimpleDateFormat("EEE MMM dd yyyy HH:mm:ss 'GMT'Z ('CST')", Locale.US);
        long time = 0;
        try {
            Date d = sdf.parse(date);
            time = convertDate(d);
        } catch (ParseException e) {
            LOGGER.error(e);
        }
        return time;
    }

    public static Map<String,Long> getBeforeTimeAndNowTime(int offsetDay){
        Map<String,Long> map = new HashMap<String, Long>();
        Date now = new Date();
        Calendar cal = Calendar.getInstance();
        cal.setTime(now);
        cal.add(Calendar.DATE, offsetDay);
        map.put("beforeTime", cal.getTimeInMillis());
        map.put("afterTime", now.getTime());
        return map;
    }


}
