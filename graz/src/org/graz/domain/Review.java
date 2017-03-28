package org.graz.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Review implements Serializable{
	private int boardNo;
	private int reviewNo;
	private String reviewWriter;
	private String reviewContent;
	private Date reviewDate;
	private int parent;
	private List<Review> comment;
	
	
	public Review(){
	}
	
	public Review(int boardNo, int reviewNo, String reviewWriter, String reviewContent, Date reviewDate, int parent, List<Review> comment){
		this.boardNo = boardNo;
		this.reviewNo = reviewNo;
		this.reviewWriter = reviewWriter;
		this.reviewContent = reviewContent;
		this.reviewDate = reviewDate;
		this.parent = parent;
		this.comment = comment;
	}

	public List<Review> getComment() {
		return comment;
	}

	public void setComment(List<Review> comment) {
		this.comment = comment;
	}

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
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
