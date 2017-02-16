package org.graz.domain;

import java.io.Serializable;

public class Paging implements Serializable{
	private static final long serialVersionUID = 872779774172689012L;
	
	private int itemStartNo;
	private int itemEndNo;
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

	public Paging(int itemStartNo, int itemEndNo){
		this.itemStartNo = itemStartNo;
		this.itemEndNo = itemEndNo;
	}
	
	public Paging(){
	}

	public int getItemStartNo() {
		return itemStartNo;
	}

	public void setItemStartNo(int itemStartNo) {
		this.itemStartNo = itemStartNo;
	}

	public int getItemEndNo() {
		return itemEndNo;
	}

	public void setItemEndNo(int endBoardNo) {
		this.itemEndNo = endBoardNo;
	}
	
}
