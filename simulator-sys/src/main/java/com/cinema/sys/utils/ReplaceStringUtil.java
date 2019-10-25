package com.cinema.sys.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;

/**
 * Field的字符创帮助类
 * 
 * @author NOLY DAKE
 * 
 */
public class ReplaceStringUtil {
	/**
	 * 替换高亮标签为空格
	 * @param string
	 * @return
	 */
    public static String replaceHighlighterString(String string) {
        return string.replace("<span class=\"Highlighter\">", "").replace("</span>", "");
    }
    /**
     * 截取限定长度中包含高亮标签的摘要内容
     * @param length
     * @param str
     * @return
     */
    public static String replaceSummary(int length, String str) {
        String ss = "";
        if (str != null) {
            Pattern pattern = Pattern.compile("<span class=\"Highlighter\">");
            int index1 = str.indexOf("<span class=\"Highlighter\">");
            int index2 = str.indexOf("</span>");
            // str中不存在高亮标签
            if (index1 < 1) {
                // 解析的str长度大于如120,截取str0-120，小于120,则截取0,str长度
                if (str.length() > length) {

                    ss = str.substring(0, length);
                } else {
                    ss = str.substring(0, str.length());
                }
                return ss;
            } else {
                String string = str.substring(index1, index2 + 7);
                String string1 = "";
                String string2 = "";
                String string3 = "";
                String string4 = "";
                if (index1 > length / 2) {
                    string1 = str.substring(0, index1);
                } else {
                    int nextLenght = (length / 2 - index1) + index2 + length / 2;
                    string1 = str.substring(0, index1);
                    if (str.length() - index2 > nextLenght) {
                        string2 = str.substring(index2 + 7, nextLenght);
                    } else {
                        string2 = str.substring(index2 + 7, str.length());
                    }
                    Matcher matcher = pattern.matcher(string2);
                    int index3 = string2.lastIndexOf("<s");
                    if (matcher.find() == true) {
                        string3 = string2.substring(0, index3);
                    } else {
                        if (index3 < 1) {
                            string4 = string2;
                        }
                    }
                }
                ss = string1 + string + string3 + string4;
            }
        }
        return ss;
    }
    /**
     * 截取限定长度中包含高亮标签的内容
     * @param str
     * @param length
     * @return
     */
    public static String splitHtmlString(String str, int length) {
    	
    	if(StringUtils.isBlank(str))
    		return str;

		int off = 0;

		String hightStart = "<span class=\"Highlighter\">";

		String hightEnd = "</span>";

		int count = 0;

		while (true) {
			
			if (str.indexOf(hightStart, off) != -1&&
					 str.startsWith(hightStart, off)) {
				off = str.indexOf(hightEnd, off) + hightEnd.length() ;
			} else {
				off++;
			}

			count++;

			if (count >= length || off >= str.length()) {
				break;
			}
		}

		if (off == str.length()) {
			return str.substring(0, off);
		} else {
			return str.substring(0, off) + "...";
		}
	}

}
