package com.hotel.app;

public class Member {
	private String username;
	private String loginid;
	private String passcode;
	private String mobile;
	
	public Member() {
	}
	public Member(String name, String loginid, String passcode, String mobile) {
		this.username = name;
		this.loginid = loginid;
		this.passcode = passcode;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getLoginid() {
		return loginid;
	}
	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}
	public String getPasscode() {
		return passcode;
	}
	public void setPasscode(String passcode) {
		this.passcode = passcode;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	
	
	
	
}
