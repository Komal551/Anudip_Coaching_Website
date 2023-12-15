package com.project.entities;

public class Comment {
	
	private String name;
	private String email;
	private String url;
	private String message;
	
	
	public Comment(String name, String email, String url, String message) {
		super();
		this.name = name;
		this.email = email;
		this.url = url;
		this.message = message;
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


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getMessage() {
		return message;
	}


	public void setMessage(String message) {
		this.message = message;
	}
	
	
	

}
