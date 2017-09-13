package org.myboard.domain;

import java.util.Date;
import java.util.List;

public class ReviewVO {
	private int rno;
	private int bno;
	private int uno;
	private String writer;
	private String content;
	private Date date;
	private int parent;
	private List<ReviewVO> comment;
	
	public ReviewVO(){
	}
	
	public ReviewVO(int rno, int bno, int uno, String writer, String content, Date date, int parent, List<ReviewVO> comment){
		this.rno = rno;
		this.bno = bno;
		this.uno = uno;
		this.writer = writer;
		this.content = content;
		this.date = date;
		this.parent = parent;
		this.comment = comment;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public List<ReviewVO> getComment() {
		return comment;
	}

	public void setComment(List<ReviewVO> comment) {
		this.comment = comment;
	}

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}
	
	
}
