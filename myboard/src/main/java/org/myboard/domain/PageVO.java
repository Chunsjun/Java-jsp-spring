package org.myboard.domain;

public class PageVO {
	private int startNum;
	private int listSize;
	
	public PageVO(){
	}
	
	public PageVO(int startNum, int listSize){
		this.startNum = startNum;
		this.listSize = listSize;
	}

	public int getStartNum() {
		return startNum;
	}

	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}

	public int getListCount() {
		return listSize;
	}

	public void setListCount(int listSize) {
		this.listSize = listSize;
	}
	
}
