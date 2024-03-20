package com.smhrd.model;

public class TodolistVO {
   private int conIdx;
   private String userId;
   private String todoTitle;
   private String content;
   private String do_Status;
   private String do_startDate;
   private String do_startTime;
   private String do_endDate;
   private String do_endTime;
   private String profileId;
   private String todoChangeTitle;
   private int todoIdx;

   

public TodolistVO() {
   }

   public TodolistVO(int todoIdx, int conIdx, String userId, String profileId, String todoTitle, String content, String do_Status,
         String do_startDate, String do_endDate, String todoChangeTitle) {
      this.todoIdx = todoIdx;
      this.conIdx = conIdx;
      this.userId = userId;
      this.todoTitle = todoTitle;
      this.content = content;
      this.do_Status = do_Status;
      this.do_startDate = do_startDate;
      this.do_endDate = do_endDate;
      this.profileId = profileId;
      this.todoChangeTitle = todoChangeTitle;
   }
   
   public TodolistVO(String userId, String todoTitle, String todoChangeTitle) {
	this.userId = userId;
	this.todoTitle = todoTitle;
	this.todoChangeTitle = todoChangeTitle;
}

public String getProfileId() {
		return profileId;
	}

	public void setProfileId(String profileId) {
		this.profileId = profileId;
	}

	public String getTodoChangeTitle() {
		return todoChangeTitle;
	}

	public void setTodoChangeTitle(String todoChangeTitle) {
		this.todoChangeTitle = todoChangeTitle;
	}

   public int getTodoIdx() {
      return todoIdx;
   }
   

   public String getprofileId() {
      return profileId;
   }

   public void setprofileId(String profileId) {
      this.profileId = profileId;
   }

   public void setTodoIdx(int todoIdx) {
      this.todoIdx = todoIdx;
   }

   public int getConIdx() {
      return this.conIdx;
   }

   public void setConIdx(int conIdx) {
      this.conIdx = conIdx;
   }

   public String getUserId() {
      return this.userId;
   }

   public void setUserId(String userId) {
      this.userId = userId;
   }

   public String getTodoTitle() {
      return this.todoTitle;
   }

   public void setTodoTitle(String todoTitle) {
      this.todoTitle = todoTitle;
   }

   public String getContent() {
      return this.content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   public String getDo_Status() {
      return this.do_Status;
   }

   public void setDo_Status(String do_Status) {
      this.do_Status = do_Status;
   }

   public String getDo_startDate() {
      return this.do_startDate;
   }

   public void setDo_startDate(String do_startDate) {
      this.do_startDate = do_startDate;
   }

   public String getDo_endDate() {
      return this.do_endDate;
   }

   public void setDo_endDate(String do_endDate) {
      this.do_endDate = do_endDate;
   }

   public String getDo_startTime() {
      return this.do_startTime;
   }

   public void setDo_startTime(String do_startTime) {
      this.do_startTime = do_startTime;
   }

   public String getDo_endTime() {
      return this.do_endTime;
   }

   public void setDo_endTime(String do_endTime) {
      this.do_endTime = do_endTime;
   }
}