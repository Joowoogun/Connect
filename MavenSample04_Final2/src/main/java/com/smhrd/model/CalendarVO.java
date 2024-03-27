package com.smhrd.model;

public class CalendarVO {

	public String Title;
	public String Start;
	public String End;
	
	public CalendarVO() {
	}

	public CalendarVO(String title, String start, String end) {
		Title = title;
		Start = start;
		End = end;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public String getStart() {
		return Start;
	}

	public void setStart(String start) {
		Start = start;
	}

	public String getEnd() {
		return End;
	}

	public void setEnd(String end) {
		End = end;
	}
	
}
