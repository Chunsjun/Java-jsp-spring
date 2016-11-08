package org.bytal.domain;

import java.io.Serializable;

public class Login implements Serializable{
	private String memberNo;
	private String password;
	
	public Login(){
	}
	
	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Login(String memberNo, String password){
		this.memberNo = memberNo;
		this.password = password;
	}
}
