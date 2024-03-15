package com.smhrd.model;

public class MemberVO {
	private String userName;
	private String userId;
	private String pw;
	private String userImg;
	private String address;
	private String email;

	public MemberVO() {
	}

	public MemberVO(String userName, String userId, String pw, String userImg, String address, String email) {
		this.userName = userName;
		this.userId = userId;
		this.pw = pw;
		this.userImg = userImg;
		this.address = address;
		this.email = email;
	}

	public String getUserImg() {
		return this.userImg;
	}

	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getuserId() {
		return this.userId;
	}

	public void setuserId(String userId) {
		this.userId = userId;
	}

	public String getPw() {
		return this.pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getaddress() {
		return this.address;
	}

	public void setaddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}