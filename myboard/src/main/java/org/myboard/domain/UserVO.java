package org.myboard.domain;

import java.util.Date;

public class UserVO {
	private int uno;
	private String id;
	private String pw;
	private String name;
	private String email;
	private Date date;
	private int status;
	
	public UserVO(){
	}
	
	public UserVO(int uno, String id, String pw, String name, String email, Date date, int status){
		this.uno = uno;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.date = date;
		this.status = status;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
