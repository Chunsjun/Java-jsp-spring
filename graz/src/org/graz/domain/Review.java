package org.graz.domain;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Review implements Serializable{
	private int boardNo;
	private int reviewNo;
	private String reviewWriter;
	private String reviewContent;
	private Date reviewDate;
	
	public Review(){
	}
	
	public Review(int boardNo, int reviewNo, String reviewWriter, String reviewContent, Date reviewDate){
		this.boardNo = boardNo;
		this.reviewNo = reviewNo;
		this.reviewWriter = reviewWriter;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate){
		this.reviewDate = reviewDate;
	}
}
