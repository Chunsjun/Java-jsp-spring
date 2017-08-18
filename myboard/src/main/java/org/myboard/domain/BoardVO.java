package org.myboard.domain;

import java.sql.Date;

public class BoardVO extends PageVO{
	private int bno;
	private String title;
	private String content;
	private String writer;
	private Date date;
	private int viewcnt;
	private String bpw;

	public BoardVO() {
	}

	public BoardVO(int bno, String title, String content, String writer, Date date, int viewcnt, String bpw) {
		this.bno = bno;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.date = date;
		this.viewcnt = viewcnt;
		this.bpw = bpw;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
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

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public String getBpw() {
		return bpw;
	}

	public void setBpw(String bpw) {
		this.bpw = bpw;
	}

}
