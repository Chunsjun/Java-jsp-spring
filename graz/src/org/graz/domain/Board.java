package org.graz.domain;

import java.io.Serializable;
import java.sql.Date;

public class Board extends Paging implements Serializable {
	private int boardNo;
	private String title;
	private String content;
	private String writer;
	private Date date;
	private int view;
	private int reviewCount;

	public Board(int boardNo, String title, String content, String writer, Date date, int view, int reviewCount) {
		this.boardNo = boardNo;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.date = date;
		this.view = view;
		this.reviewCount = reviewCount;
	}

	public Board() {
	}
	
	public int getReviewCount() {
		return reviewCount;
	}
	
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
}
