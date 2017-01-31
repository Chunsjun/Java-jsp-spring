package org.graz.domain;

import java.io.Serializable;

public class User implements Serializable{
	private int userNo;
	private String id;
	private String name;
	private String password;
	private String email;
	private String pNumber;
	private int status;
	
	public User(){
	}
	
	public User(int userNo, String id, String name, String password, String email, String pNumber, int status){
		this.userNo = userNo;
		this.id = id;
		this.name = name;
		this.password = password;
		this.email = email;
		this.pNumber = pNumber;
		this.status = status;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getpNumber() {
		return pNumber;
	}

	public void setpNumber(String pNumber) {
		this.pNumber = pNumber;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
