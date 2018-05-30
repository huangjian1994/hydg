package com.htcf.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * 
 *日期工具处理类：主要用于实现  {java.util.Calendar}、{java.util.Date}、{java.sql.date}
 *之间相互的转换；最常用的方法是dateToString()方法和stringToUtilDate()。
 * 
 */
public final class DateUtil {
	
	/**
	 * 将Date类型的日期转换成String类型"任意"格式
	 * java.sql.date,java.sql.Timestamp类型是java.util.Date类型的子类
	 * @param date	需要转换的日期
	 * @param format  "2014-01-01"格式  "yyyy年MM月dd日""yyyy-MM-dd HH:mm:ss"格式
	 * @return 表示日期的字符串
	 */
	public static String dateToString(java.util.Date date,String format){
		if(date==null||StringUtil.isBlank(format)) return null;
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		String str = sdf.format(date);
		return str;
	}
	
	
	/**
	 * 将String类型的日期转换成java.util.Date类型"2014-01-01"
	 * @param str 需要格式化的日期
	 * @param format  "2014-01-01"格式  "yyyy年MM月dd日""yyyy-MM-dd HH:mm:ss"格式
	 * @return java.util.Date 日期对象
	 */
	public static java.util.Date StringToUtilDate(String str,String format){
		if(StringUtil.isBlank(str)||StringUtil.isBlank(format)) return null;
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		java.util.Date date = null;
		try{
			date = sdf.parse(str);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return date;
	}
	
	
	/**
	 * 将String类型的日期转换成java.sql.Date类型"2014-01-01"
	 * @param str 需要格式化的日期
	 * @param format  "2014-01-01"格式  "yyyy年MM月dd日""yyyy-MM-dd HH:mm:ss"格式
	 * @return java.sql.Date 日期对象
	 */
	public static java.sql.Date StringToSqlDate(String str,String format){
		if(StringUtil.isBlank(str)||StringUtil.isBlank(format)) return null;
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		java.util.Date date = null;
		try{
			date = sdf.parse(str);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return new java.sql.Date(date.getTime());
	}
	
	/**
	 * 将java.util.Date日期转化成java.sql.Date类型。
	 * 
	 * @param date 需要转换的日期
	 * @return 格式化后的java.sql.Date。
	 */
	public static java.sql.Date toSqlDate(java.util.Date date)
	{
		if (date == null) return null; 
		return new java.sql.Date(date.getTime());
	}
	
	/**
	 * 将日历转换成日期
	 * @param calendar 需要转换的日历实例
	 * @return 转换后的日期
	 */
	public static java.util.Date converToDate(java.util.Calendar calendar){
		return calendar.getTime();
	}
	
	
	/**
	 * 将日期转换成日历
	 * @param date 需要转换的日期实例
	 * @return 转换后的日历
	 */
	public static java.util.Calendar converToCalendar(java.util.Date date){
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar;
	}
	/**
	 * 
	 * <p>功能：将错误的日期转换成想要的</p>
	 *
	 * @param date
	 * @param format
	 * @return
	 */
	public static String StringToString(String date,String format){
		return  DateUtil.dateToString(DateUtil.StringToUtilDate(date , "yyyy-MM-dd HH:mm:ss"), format);
	}

	/**
	 * 
	 * <p>功能：Timestamp转为String</p>
	 *
	 * @param date
	 * @param format
	 * @return String
	 */
	public static String timestampToStr(java.sql.Timestamp date, String format){
		
		String dateStr = null;
		try {
			
			dateStr = new SimpleDateFormat(format).format(date);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return dateStr;
	}
	
	/**
	 * 
	 * <p>功能：日期加/减 几天</p>
	 *
	 * @param date
	 * @param days 天数
	 * @return java.util.Date
	 */
	public static java.util.Date dateAddDay(java.util.Date date,int days){
		
		java.util.Calendar cal = new java.util.GregorianCalendar();
		cal.setTime(date);
		cal.add(cal.DATE, days);
		
		return cal.getTime();
	}
	
	/**
	 * 
	 * <p>功能：日期加/减 几月</p>
	 *
	 * @param date
	 * @param mons 月数
	 * @return java.util.Date
	 */
	public static java.util.Date dateAddMon(java.util.Date date,int mons){
		
		java.util.Calendar cal = new java.util.GregorianCalendar();
		cal.setTime(date);
		cal.add(Calendar.MONTH, mons);
		
		return cal.getTime();
	}
	
	/**
	 * 
	 * <p>功能：取得日期所在季度</p>
	 *
	 * @return yyyy-n季度
	 */
	public static String getThisSeason(java.util.Date date){
		
		String season = dateToString(date, "yyyy");
		
		java.util.Calendar cal = new java.util.GregorianCalendar();
		cal.setTime(date);
		
		int month = cal.get(cal.MONTH)+1;
		if(month>3 && month<7){
			season += "-2季度";
		}else if(month>6 && month<10){
			season += "-3季度";
		}else if(month>9 && month<13){
			season += "-4季度";
		}else{
			season += "-1季度";
		}
		return season;
	}
	
	/**
	 * 
	 * <p>功能：获取日期所在季度第一天</p>
	 *
	 * @param date
	 * @return Date
	 */
	public static java.util.Date getCurrentSeasonFirstTime(java.util.Date date){
		
		java.util.Calendar cal = new java.util.GregorianCalendar();
		cal.setTime(date);
		
		int month = cal.get(cal.MONTH)+1;
		int year = cal.get(cal.YEAR);
		if(month>0 && month<4){
			cal.set(year, 1, 1);
		}else if(month>3 && month<7){
			cal.set(year, 4, 1);
		}else if(month>6 && month<10){
			cal.set(year, 7, 1);
		}else if(month>9 && month<13){
			cal.set(year, 10, 1);
		}
		return cal.getTime();
	}
	
	/**
	 * <p>功能：将日期时间格式化</p>
	 *
	 * @param String date 
	 * @return String date 
	 */
	public static String formatDate ( String date ) {
		// input example : "17/1-3 3:1:14"
		// output example : "2017-01-03 03:01:14"
		return date.replaceAll("([ /:-])(\\d)([ /:-])", "$1" + "0" +  "$2" + "$3")
				.replaceAll("([ /:-])(\\d)([ /:-])", "$1" + "0" +  "$2" + "$3")
				.replaceAll("([ /:-])(\\d)([ /:-])", "$1" + "0" +  "$2" + "$3")
				.replaceAll("([ /:-])(\\d)$", "$1" + "0" +  "$2")
				.replaceAll("[/]", "-")
				.replaceAll("^(\\d{2,2})([ /:-])", "20" + "$1" +  "$2");
	}
}
