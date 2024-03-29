package com.smhrd.model;

public class DocumentVO {
	
	private String userId;
	private String postTitle;
	private String dataContent;
	private String writeDate;
	private String fileName;
	private int fileIdx;
	
	public DocumentVO() {
		
	};
	
	public DocumentVO(String userId, String postTitle, String dataContent, String writeDate, String fileName,
			int fileIdx) {
		this.userId = userId;
		this.postTitle = postTitle;
		this.dataContent = dataContent;
		this.writeDate = writeDate;
		this.fileName = fileName;
		this.fileIdx = fileIdx;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getDataContent() {
		return dataContent;
	}
	public void setDataContent(String dataContent) {
		this.dataContent = dataContent;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getFileIdx() {
		return fileIdx;
	}
	public void setFileIdx(int fileIdx) {
		this.fileIdx = fileIdx;
	}
	
	
	

}
