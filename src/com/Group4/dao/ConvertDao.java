package com.Group4.dao;

import java.util.Calendar;
import java.util.GregorianCalendar;

/**
 * 
 * @author 第四小组成员（Long Qi; Chenan Wu; Feifan Xu; Haiyang Ding）
 *日历转换
 */

public class ConvertDao {
	private String[] weeks=new String[]{"星期日","星期一","星期二","星期三","星期四","星期五","星期六"};
	private int weekInt = 1;
	
	public String getWeek(String date) {
		System.out.println(date);
		GregorianCalendar gc=new GregorianCalendar();
		gc.setLenient(false);
		
		String temp[] = date.split("-");
		if (temp.length == 3) {
			gc.set(Integer.parseInt(temp[0]), Integer.parseInt(temp[1]) - 1, Integer.parseInt(temp[2]));
			weekInt = gc.get(Calendar.DAY_OF_WEEK);
		}
		System.out.println(weeks[weekInt - 1]);
		return weeks[weekInt - 1];
	}
	

}
