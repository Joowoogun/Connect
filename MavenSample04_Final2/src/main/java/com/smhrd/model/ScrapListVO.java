package com.smhrd.model;

import java.sql.Date;

public class ScrapListVO {

	 // 스크랩 식별자 
    private int scrapIdx;

    private String conStartDate;
    
    private String conEndDate;
    
    private String conName;
    
    private String conHomepage;
    
    private String conCategory;
    
    
    
   

	public String getConCategory() {
		return conCategory;
	}


	public void setConCategory(String conCategory) {
		this.conCategory = conCategory;
	}


	public String getConHomepage() {
		return conHomepage;
	}


	public void setConHomepage(String conHomepage) {
		this.conHomepage = conHomepage;
	}
	// 회원 아이디 
    private String userId;

    // 공모전 식별자 
    private int conIdx;

    // 등록 일자 
    private String scrapDate;

    public ScrapListVO() {
	}
    
    
    public ScrapListVO(String userId, String conName, String conStartDate, String conEndDate) {
		this.userId = userId;
		this.conName = conName;
		this.conStartDate = conStartDate;
		this.conEndDate = conEndDate;
	}
    
    public ScrapListVO(int scrapIdx, String userId, int conIdx, String scrapDate, String applyYN) {
		this.scrapIdx = scrapIdx;
		this.userId = userId;
		this.conIdx = conIdx;
		this.scrapDate = scrapDate;
		this.applyYN = applyYN;
	}


	public ScrapListVO(String userId, int conIdx) {
		this.userId = userId;
		this.conIdx = conIdx;
	}


	public String getConStartDate() {
		return conStartDate;
	}


	public void setConStartDate(String conStartDate) {
		this.conStartDate = conStartDate;
	}


	public String getConEndDate() {
		return conEndDate;
	}


	public void setConEndDate(String conEndDate) {
		this.conEndDate = conEndDate;
	}


	public int getScrapIdx() {
		return scrapIdx;
	}

	public void setScrapIdx(int scrapIdx) {
		this.scrapIdx = scrapIdx;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getConIdx() {
		return conIdx;
	}

	public void setConIdx(int conIdx) {
		this.conIdx = conIdx;
	}

	public String getScrapDate() {
		return scrapDate;
	}

	public void setScrapDate(String scrapDate) {
		this.scrapDate = scrapDate;
	}

	public String getApplyYN() {
		return applyYN;
	}

	public void setApplyYN(String applyYN) {
		this.applyYN = applyYN;
	}

	 public String getConName() {
			return conName;
		}


		public void setConName(String conName) {
			this.conName = conName;
		}
	// 공모전 응모여부 
    private String applyYN;
}
