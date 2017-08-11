package com.spring.main.beans;

public class ProfileDTO {
	private String user_id;
	private String oldfile;
	private String newfile;
	private String user_email;
	private String user_phone;
	private String user_name;
	private String follow_num;
	private String follower_num;
	private String gender;
	private String address;
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getOldfile() {
		return oldfile;
	}
	public void setOldfile(String oldfile) {
		this.oldfile = oldfile;
	}
	public String getNewfile() {
		return newfile;
	}
	public void setNewfile(String newfile) {
		this.newfile = newfile;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getFollow_num() {
		return follow_num;
	}
	public void setFollow_num(String follow_num) {
		this.follow_num = follow_num;
	}

	public String getFollower_num() {
		return follower_num;
	}
	public void setFollower_num(String follower_num) {
		this.follower_num = follower_num;
	}
	public String getUser_info() {
		return user_info;
	}
	public void setUser_info(String user_info) {
		this.user_info = user_info;
	}
	private String user_info;
}
