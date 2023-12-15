package com.project.entities;

public class BookDemo {

	private int id;
	private String name;
	private String email;
	private String standard;
	private String subject;
	
	public BookDemo(int id, String name, String email, String standard, String subject) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.standard = standard;
		this.subject = subject;
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

	public String getStandard() {
		return standard;
	}

	public void setStandard(String standard) {
		this.standard = standard;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	
}
