package org.myboard.domain;

import java.sql.Date;

public class UserVO {
	private int uno;
	private String id;
	private String pw;
	private String name;
	private String birth;
	private String email;
	private Date date;
	
	public UserVO(){
	}
	
	public UserVO(int uno, String id, String pw, String name, String birth, String email, Date date){
		this.uno = uno;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birth = birth;
		this.email = email;
		this.date = date;
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

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
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
	
}
