package org.graz.domain;

import java.io.Serializable;

public class Paging implements Serializable{
	private int startBoardNo;
	private int endBoardNo;
	private String searchType;
	private String searchKeyword;
	
	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public Paging(int startBoardNo, int endBoardNo){
		this.startBoardNo = startBoardNo;
		this.endBoardNo = endBoardNo;
	}
	
	public Paging(){
	}

	public int getStartBoardNo() {
		return startBoardNo;
	}

	public void setStartBoardNo(int startBoardNo) {
		this.startBoardNo = startBoardNo;
	}

	public int getEndBoardNo() {
		return endBoardNo;
	}

	public void setEndBoardNo(int endBoardNo) {
		this.endBoardNo = endBoardNo;
	}
	
}
