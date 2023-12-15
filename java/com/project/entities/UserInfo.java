package com.project.entities;

import java.sql.Timestamp;

public class UserInfo {


	private int id;
	private String name;
	private String email;
	private String password;
	private String confirmPassword;
	private String profile;
	private Timestamp dateTime;
	
	public UserInfo(int id, String name, String email, String password, String confirmPassword) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.password = password;
		this.confirmPassword = confirmPassword;
	
	}
	

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}


	public String getProfile() {
		return profile;
	}


	public void setProfile(String profile) {
		this.profile = profile;
	}


	public Timestamp getDateTime() {
		return dateTime;
	}


	public void setDateTime(Timestamp dateTime) {
		this.dateTime = dateTime;
	}


}
