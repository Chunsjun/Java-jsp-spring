package org.graz.domain;

import java.io.Serializable;
import java.sql.Date;

public class Board extends Paging implements Serializable {
	private int boardNo;
	private int boardWriterNo;
	private String title;
	private String content;
	private String writer;
	private Date date;
	private int view;
	private int reviewCount;
	private int fileStatus;

	public Board(int boardNo, int boardWriterNo, String title, String content, String writer, Date date, int view, int reviewCount, int fileStatus) {
		this.boardNo = boardNo;
		this.boardWriterNo = boardWriterNo;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.date = date;
		this.view = view;
		this.reviewCount = reviewCount;
		this.fileStatus = fileStatus;
	}

	public Board() {
	}
	
	public int getBoardWriterNo() {
		return boardWriterNo;
	}

	public void setBoardWriterNo(int boardWriterNo) {
		this.boardWriterNo = boardWriterNo;
	}

	public int getFileStatus() {
		return fileStatus;
	}

	public void setFileStatus(int fileStatus) {
		this.fileStatus = fileStatus;
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
