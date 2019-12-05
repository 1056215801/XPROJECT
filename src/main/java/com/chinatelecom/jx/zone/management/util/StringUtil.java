package com.chinatelecom.jx.zone.management.util;


import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtil
{
  public static boolean checkNotNull(Object obj)
  {
    return ((obj != null) && (!("".equals(obj))) && (!("none".equals(obj))));
  }

  public static String helpSearchSql(String sql)
  {
    if (!(sql.contains("where")))
      sql = sql + " where ";
    else {
      sql = sql + " and ";
    }
    return sql;
  }

  public static String getArrayString(String[] array, char splitChar)
  {
    return getArrayString(array, splitChar, null);
  }

  public static String getArrayString(String[] array, char splitChar, String prefix)
  {
    if (array == null) {
      return null;
    }

    if (prefix == null) {
      prefix = "";
    }

    StringBuffer sb = new StringBuffer();

    for (int i = 0; i < array.length; ++i) {
      if (i > 0) {
        sb.append(splitChar);
      }

      sb.append(prefix);
      sb.append(array[i]);
    }

    return sb.toString();
  }

  public static List<String> getValuesList(String values, String splitStr)
  {
    if (values == null) {
      return null;
    }

    List list = new ArrayList();
    String[] valueArray = values.split(splitStr);

    for (String value : valueArray) {
      list.add(value);
    }

    return list;
  }

  public static String getNewUUID()
  {
    return UUID.randomUUID().toString().replaceAll("-", "");
  }
  public static String get32bit_UUID()
  {
    String s = UUID.randomUUID().toString(); 
	return s.substring(0,8)+s.substring(9,13)+s.substring(14,18)+s.substring(19,23)+s.substring(24) ;
  }
  /**
   * html转化为text
   * @param inputString
   * @return
   */
  public static String html2Text(String inputString) {
        String htmlStr = inputString; // 含html标签的字符串
        String textStr = "";
        Pattern p_script;
        Matcher m_script;
        Pattern p_style;
        Matcher m_style;
        Pattern p_html;
        Matcher m_html;
        try {
         String regEx_script = "<[\\s]*?script[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?script[\\s]*?>"; // 定义script的正则表达式{或<script>]*?>[\s\S]*?<\/script>
         String regEx_style = "<[\\s]*?style[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?style[\\s]*?>"; // 定义style的正则表达式{或<style>]*?>[\s\S]*?<\/style>
        // String regEx_html = "<[^>]+>"; // 定义HTML标签的正则表达式
         //String regEx_html ="</?[^/?(br)|(p)][^><]*>";// 定义HTML标签的正则表达式
         String regEx_html ="<([^>]*)>";// 定义HTML标签的正则表达式
         p_script = Pattern.compile(regEx_script, Pattern.CASE_INSENSITIVE);
         m_script = p_script.matcher(htmlStr);
         htmlStr = m_script.replaceAll(""); // 过滤script标签

         p_style = Pattern.compile(regEx_style, Pattern.CASE_INSENSITIVE);
         m_style = p_style.matcher(htmlStr);
         htmlStr = m_style.replaceAll(""); // 过滤style标签

         p_html = Pattern.compile(regEx_html, Pattern.CASE_INSENSITIVE);
         m_html = p_html.matcher(htmlStr);
         htmlStr = m_html.replaceAll(""); // 过滤html标签

         textStr = htmlStr;

        } catch (Exception e) {
            System.err.println("Html2Text: " + e.getMessage());
            textStr  = inputString;
        }
        return textStr;
      }
  
  /**
   * html转化为text
   * @param inputString
   * @return
   */
  public static String html2PlainText(String inputString) {
        String htmlStr = inputString; // 含html标签的字符串
        String textStr = "";
        Pattern p_script;
        Matcher m_script;
        Pattern p_style;
        Matcher m_style;
        Pattern p_html;
        Matcher m_html;
        try {
         String regEx_script = "<[\\s]*?script[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?script[\\s]*?>"; // 定义script的正则表达式{或<script>]*?>[\s\S]*?<\/script>
         String regEx_style = "<[\\s]*?style[^>]*?>[\\s\\S]*?<[\\s]*?\\/[\\s]*?style[\\s]*?>"; // 定义style的正则表达式{或<style>]*?>[\s\S]*?<\/style>
         String regEx_html = "<[^>]+>"; // 定义HTML标签的正则表达式
         p_script = Pattern.compile(regEx_script, Pattern.CASE_INSENSITIVE);
         m_script = p_script.matcher(htmlStr);
         htmlStr = m_script.replaceAll(""); // 过滤script标签

         p_style = Pattern.compile(regEx_style, Pattern.CASE_INSENSITIVE);
         m_style = p_style.matcher(htmlStr);
         htmlStr = m_style.replaceAll(""); // 过滤style标签

         p_html = Pattern.compile(regEx_html, Pattern.CASE_INSENSITIVE);
         m_html = p_html.matcher(htmlStr);
         htmlStr = m_html.replaceAll(""); // 过滤html标签

         textStr = htmlStr;
         
         textStr=textStr.replace("&nbsp;","");
         textStr=textStr.replaceAll("\\s*|\t|\r|\n","");//去除字符串中的空格,回车,换行符,制表符
        } catch (Exception e) {
            System.err.println("Html2Text: " + e.getMessage());
            textStr  = inputString;
        }
        return textStr;
      }
  
  public static String getStringNoBlank(String str) {    
      if(str!=null && !"".equals(str)) {    
          Pattern p = Pattern.compile("\\s*|\t|\r|\n");    
          Matcher m = p.matcher(str);    
          String strNoBlank = m.replaceAll("");    
          return strNoBlank;    
      }else {    
          return str;    
      }         
  }   
    public static void main(String[] args) {
		String str="&nbsp;&nbsp;&nbsp;<p> <img>dssdss</img></p> ";
	//	System.out.println(html2PlainText(str));
	}
  
    /** 
     * @方法名 translate 
     * @功能 简单的数字转中文 
     * @param a 
     *            原始数字 
     * @return 中文字符串 
     */  
    public static String translateToChinese(int a) {  
  
        String[] units = { "", "十", "百", "千", "万", "十", "百", "千", "亿" };  
        String[] nums = { "一", "二", "三", "四", "五", "六", "七", "八", "九", "十" };  
  
        String result = "";  
        if (a < 0) {  
            result = "负";  
            a = Math.abs(a);  
        }  
        String t = String.valueOf(a);  
        for (int i = t.length() - 1; i >= 0; i--) {  
            int r = (int) (a / Math.pow(10, i));  
            if (r % 10 != 0) {  
                String s = String.valueOf(r);  
                String l = s.substring(s.length() - 1, s.length());  
                result += nums[Integer.parseInt(l) - 1];  
                result += (units[i]);  
            } else {  
                if (!result.endsWith("零")) {  
                    result += "零";  
                }  
            }  
        }  
        String num = a + "";  
        /* 
         * 因为方法对10-20之间的数字支持不好，比如11返回一十一，不能满足需求 所以这里单独判断 
         */  
        if (a == 10) {  
            return "十";  
        } else if (a > 10 && a < 20) {  
            return result.substring(1);  
        } else if (num.endsWith("0")) {  
            result = result.substring(0, result.length() - 1);  
        }  
        return result;  
    }  
   
    public static boolean noSqlInject(String str){
		String inj_str = "'_and_exec_insert_select_delete_update_count_*_%_master_truncate_declare_;_or_-_+_,";
		String[] inj_stra  = inj_str.split("_");
		String[] strs=str.split(" ");
		for(int j=0;j<strs.length;j++){
		  for (int i=0 ; i < inj_stra.length ; i++ ){
			 if (strs[j].toLowerCase().equals(inj_stra[i])){
				return false;
			} 
		 }
		}
		return true;
	}
	
    /** 
     * @方法名 encodeChinese 
     * @功能 对url路径里包含中文的进行转码 
     * @param  url 
     * @return 转码后的字符串 
     */  
    public static String encodeChinese(String str) throws Exception{
    	String path=str;
    	if(StringUtil.checkNotNull(path)){
			char[] chr=path.toCharArray();
			StringBuilder sb=new StringBuilder("");
			for(int i=0;i<chr.length;i++) {//中文菜单名称转码
				if(CharUtil.isChinese(chr[i])){
					sb.append(URLEncoder.encode(chr[i]+"","utf-8"));
				}else{
					sb.append(chr[i]);
				}
			}
			path=sb.toString();
		}
    	return path ;
    }
}