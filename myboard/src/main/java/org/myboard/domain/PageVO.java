package org.myboard.domain;

public class PageVO {
	private int startNum;
	private int listSize;
	private String searchType;
	private String searchKeyword;
	
	public PageVO(){
	}
	
	public PageVO(int startNum, int listSize, String searchType, String searchKeyword){
		this.startNum = startNum;
		this.listSize = listSize;
		this.searchType = searchType;
		this.searchKeyword = searchKeyword;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

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
	
	
}
