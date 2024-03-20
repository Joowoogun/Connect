package com.smhrd.model;

public class ContestVO {
	// 공모전 식별자 
    private int conIdx;

    // 공모전 이름 
    private String conName;

    // 공모전 내용 
    private String conContent;

    // 공모전 주최자 
    private String conHost;

    // 공모전 카테고리 
    private String conCategory;

    // 공모전 홈피주소 
    private String conHomepage;

    // 공모전 시작날짜 
    private String conStartDate;

    // 공모전 마감날짜 
    private String conEndDate;


	// 공모전 마감시간 
    private String conEndTime;

    
    public ContestVO(int conIdx, String conName, String conContent, String conHost, String conCategory,
			String conHomepage, String conStartDate, String conEndDate, String conEndTime, String conSpec,
			String conRewardType, String conReward) {
		super();
		this.conIdx = conIdx;
		this.conName = conName;
		this.conContent = conContent;
		this.conHost = conHost;
		this.conCategory = conCategory;
		this.conHomepage = conHomepage;
		this.conStartDate = conStartDate;
		this.conEndDate = conEndDate;
		this.conEndTime = conEndTime;
		this.conSpec = conSpec;
		this.conRewardType = conRewardType;
		this.conReward = conReward;
	}
    
    
    public ContestVO() {
	}
    
    
    
    
    public int getConIdx() {
		return conIdx;
	}

	public void setConIdx(int conIdx) {
		this.conIdx = conIdx;
	}

	public String getConName() {
		return conName;
	}

	public void setConName(String conName) {
		this.conName = conName;
	}

	public String getConContent() {
		return conContent;
	}

	public void setConContent(String conContent) {
		this.conContent = conContent;
	}

	public String getConHost() {
		return conHost;
	}

	public void setConHost(String conHost) {
		this.conHost = conHost;
	}

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

	public String getConEndTime() {
		return conEndTime;
	}

	public void setConEndTime(String conEndTime) {
		this.conEndTime = conEndTime;
	}

	public String getConSpec() {
		return conSpec;
	}

	public void setConSpec(String conSpec) {
		this.conSpec = conSpec;
	}

	public String getConRewardType() {
		return conRewardType;
	}

	public void setConRewardType(String conRewardType) {
		this.conRewardType = conRewardType;
	}

	public String getConReward() {
		return conReward;
	}

	public void setConReward(String conReward) {
		this.conReward = conReward;
	}

	// 공모전 신청자격 
    private String conSpec;

    // 공모전 보상종류 
    private String conRewardType;

    // 공모전 보상금 
    private String conReward;
}