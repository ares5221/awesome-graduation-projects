package com.wy.tool;

import java.util.Calendar;

public class GetSystemTime {

	private Calendar now = Calendar.getInstance();
	private int year = now.get(Calendar.YEAR);
	private int month = now.get(Calendar.MONTH) + 1;
	private int day = now.get(Calendar.DAY_OF_MONTH);
	public String getToday() {
		String today = this.year + "-" + this.month + "-" + this.day;
		return today;
	}

	public String getYearMonth() {
		String today = this.year + "-" + this.month ;
		return today;
	}

}
