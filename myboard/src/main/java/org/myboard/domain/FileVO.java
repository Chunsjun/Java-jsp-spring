package org.myboard.domain;

import java.sql.Date;

public class FileVO{
	
	private int fno;
	private int bno;
	private String file_title;
	private String file_path;
	private Date file_date;
	
	public FileVO(){
	}
	public FileVO(int fno, int bno, String file_title, String file_path, Date file_date){
		this.fno = fno;
		this.bno = bno;
		this.file_title = file_title;
		this.file_path = file_path;
		this.file_date = file_date;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getFile_title() {
		return file_title;
	}
	public void setFile_title(String file_title) {
		this.file_title = file_title;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public Date getFile_date() {
		return file_date;
	}
	public void setFile_date(Date file_date) {
		this.file_date = file_date;
	}

}
