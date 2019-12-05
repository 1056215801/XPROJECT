package com.chinatelecom.jx.zone.management.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * 日期处理的工具类
 * 
 * @author defence wang
 * 
 */
public class DateUtil {

	/**
	 * 转换Date格式成为"yyyyddmmHHMMSS"类型字符串
	 * 
	 * @param date
	 * @return yyyyddmmHHMMSS
	 */
	public static String formatDateToString(Date date) {
		String rtnStr = String.valueOf(date.getYear())
				+ String.valueOf(date.getMonth())
				+ String.valueOf(date.getDay())
				+ String.valueOf(date.getHours())
				+ String.valueOf(date.getMinutes())
				+ String.valueOf(date.getSeconds());
		return rtnStr;
	}

	/**
	 * 转换Date格式成为"yyyy-MM-dd HH:mm:ss"类型字符串
	 * 
	 * @param date
	 * @return yyyy-MM-dd HH:mm:ss
	 */
	public static String formatDateString(Date date) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return formatter.format(date);
	}

	/**
	 * 转换Date格式成为"yyyyddmm"类型字符串
	 * 
	 * @param date
	 * @return yyyyddmm
	 */
	public static String formatDateToYDMStr(Date date) {
		// Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		String dateString = formatter.format(date);
		return dateString;
	}

	/**
	 * 取得系统时间的短日期格式
	 * 
	 * @return 短日期字符串
	 */
	public static String getShortDate() {
		return getFormatDate("yyyy-MM-dd");
	}
	
	/**
	 * 取得系统时间的短日期格式[中文年月日]
	 * 
	 * @return 短日期字符串
	 */
	public static String getCnShortDate() {
		return getFormatDate("yyyy年MM月dd日");
	}
	
	/**
	 * 转换Date格式成为[中文年月日]类型字符串
	 * 
	 * @param date
	 * @return yyyyddmm
	 */
	public static String getCnShortDate(Date date) {
		// Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy年MM月dd日");
		String dateString = formatter.format(date);
		return dateString;
	}
	/**
	 * 得到特定格式的日期时间格式
	 * 
	 * @param formatStr
	 * @return
	 */
	public static String getFormatDate(String formatStr) {
		@SuppressWarnings("unused")
		DateFormat format = DateFormat.getDateInstance(DateFormat.SHORT);
		return new SimpleDateFormat(formatStr).format(new Date());
	}

	/**
	 * 取得系统时间的长日期格式
	 * 
	 * @return 长日期格式
	 */
	public static String getLongDate() {
		return getFormatDate("yyyy-MM-dd HH:mm:ss");
	}

	/**
	 * 将一个特定日期转换为短日期格式
	 * 
	 * @param date
	 *            时间
	 * @return 短日期字符串
	 */
	public static String parseDateToShort(Date date) {
		@SuppressWarnings("unused")
		DateFormat format = DateFormat.getDateInstance(DateFormat.SHORT);
		return new SimpleDateFormat("yyyy-MM-dd").format(date);
	}

	/**
	 * 根据当前日期返回以此命名的文件名称
	 * 
	 * @return 文件名称
	 */
	public static String getFileNameByDate() {
		@SuppressWarnings("unused")
		DateFormat format = DateFormat.getDateInstance(DateFormat.SHORT);
		return new SimpleDateFormat("yyyyMMdd-HHmmss")
				.format(new java.util.Date());
	}

	/**
	 * 获得当前季度
	 * 
	 * @return
	 */
	public static String getCurrSeason() {
		String month = getMonth();

		return DateUtil.getSeason(month);
	}

	/**
	 * 根据月份获得季度
	 * 
	 * @param month
	 * @return
	 */
	public static String getSeason(String month) {
		if (month.equals("01") || month.equals("02") || month.equals("03")) {
			return "1";
		} else if (month.equals("04") || month.equals("05")
				|| month.equals("06")) {
			return "2";
		} else if (month.equals("07") || month.equals("08")
				|| month.equals("09")) {
			return "3";
		} else
			return "4";
	}

	/**
	 * 获取当前是周几
	 * 
	 * @param args
	 * @return
	 */
	public static String getWeek() {
		Calendar cld = Calendar.getInstance();
		int week = cld.get(Calendar.DAY_OF_WEEK);
		switch (week) {
		case 1:
			return "日";
		case 2:
			return "一";
		case 3:
			return "二";
		case 4:
			return "三";
		case 5:
			return "四";
		case 6:
			return "五";
		case 7:
			return "六";
		}
		return null;
	}

	public static String getYear() {
		Calendar cld = Calendar.getInstance();
		return cld.get(Calendar.YEAR) + "";
	}

	public static String getMonth() {
		Calendar cld = Calendar.getInstance();
		return ((cld.get(Calendar.MONTH) + 1) < 10 ? "0"
				+ (cld.get(Calendar.MONTH) + 1) : (cld.get(Calendar.MONTH) + 1)
				+ "");
	}

	public static String getNextMonth() {
		Calendar cld = Calendar.getInstance();
		return ((cld.get(Calendar.MONTH) + 2) < 10 ? "0"
				+ (cld.get(Calendar.MONTH) + 2) : (cld.get(Calendar.MONTH) + 2)
				+ "");
	}

	public static String getDay() {
		Calendar cld = Calendar.getInstance();
		return (cld.get(Calendar.DATE) < 10 ? "0" + cld.get(Calendar.DATE)
				: cld.get(Calendar.DATE) + "");
	}

	public static String getMonthHead() {
		return getYear() + "-" + getMonth() + "-01";
	}

	public static String getCurrDate() {
		return getYear() + "-" + getMonth() + "-" + getDay();
	}
	
	public static String getCurrYearMonth() {
		return getYear() + "-" + getMonth();
	}

	public static String getNextDate() {
		Calendar cld = Calendar.getInstance();
		int iMonth = cld.get(Calendar.MONTH) + 2;
		int iYear = cld.get(Calendar.YEAR);
		int iDay = cld.get(Calendar.DATE);
		if (iMonth == 13) {
			iMonth = 1;
			iYear = iYear + 1;
		}
		if (iMonth == 2 && iDay > 28)
			iDay = 28;
		if (iDay == 31)
			iDay = 30;
		return iYear + "-" + (iMonth < 10 ? "0" + iMonth : iMonth) + "-"
				+ (iDay < 10 ? "0" + iDay : iDay);
	}

	// 字符串日期格式化为日期类型
	public static Date StringtoDate(String str) {
		Date date = null;
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		try {
			date = df.parse(str);
		} catch (ParseException e) {
			date = new Date();
		}
		return date;
	}

	// 字符串日期格式化为日期类型
	public static Date StringtoDateLong(String str) {
		Date date = null;
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		try {
			date = df.parse(str);
		} catch (ParseException e) {
			date = new Date();
		}
		return date;
	}

	public static Date getTodayDate() {
		String currDate = getCurrDate();
		return StringtoDate(currDate);
	}

	// 计算日期相隔天数
	public static long getDateMargin(Date beginDate, Date endDate) {
		long margin = 0;

		margin = endDate.getTime() - beginDate.getTime();

		margin = margin / (1000 * 60 * 60 * 24);

		return margin;
	}

	// 计算日期相隔分钟
	public static long getDateMarginMin(Date beginDate, Date endDate) {
		long margin = 0;

		margin = endDate.getTime() - beginDate.getTime();

		margin = margin / 1000;

		return margin;
	}

	// 计算相隔年数
	@SuppressWarnings("deprecation")
	public static long getDateMarginYear(Date beginDate, Date endDate) {
		long margin = 0;

		margin = endDate.getYear() - beginDate.getYear();

		return margin;
	}

	public static String getTodayStr() {
		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String nowDate = sf.format(date);
		return nowDate;
	}

	public static String getTomorrowByTodayStr(String today)
			throws ParseException {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		cal.setTime(sf.parse(today));
		cal.add(Calendar.DAY_OF_YEAR, +1);
		String nextDate_1 = sf.format(cal.getTime());
		return nextDate_1;
	}

	/**
	 * @param timestampString
	 * @return
	 */
	public static String TimeStamp2Date(String timestampString) {
		String date = "";
		try {
			Long timestamp = Long.parseLong(timestampString) * 1000;
			date = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.format(new java.util.Date(timestamp));

		} catch (Exception e) {
			date = "";
		}
		return date;
	}
}