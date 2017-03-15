package org.graz.domain;

import java.io.Serializable;
import java.sql.Date;

public class File implements Serializable {
	private static final long serialVersionUID = -6666408514252507283L;
	
	private int fileNo;
	private int boardNo;
	private String fileTitle;
	private String filePath;
	private Date fileDate;
	
	public File(){
	}
	public File(int fileNo, int boardNo, String fileTitle, String filePath, Date fileDate){
		this.fileNo = fileNo;
		this.boardNo = boardNo;
		this.fileTitle = fileTitle;
		this.filePath = filePath;
		this.fileDate = fileDate;
	}
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getFileTitle() {
		return fileTitle;
	}
	public void setFileTitle(String fileTitle) {
		this.fileTitle = fileTitle;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public Date getFileDate() {
		return fileDate;
	}
	public void setFileDate(Date fileDate) {
		this.fileDate = fileDate;
	}
	

}
