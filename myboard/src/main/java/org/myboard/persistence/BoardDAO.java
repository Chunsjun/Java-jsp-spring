package org.myboard.persistence;

import java.util.List;

import org.myboard.domain.BoardVO;
import org.myboard.domain.FileVO;
import org.myboard.domain.ReviewVO;

public interface BoardDAO {
	
	/*�Խ��� ����*/
	public List<BoardVO> list(BoardVO vo);
	public void write(BoardVO vo);
	public BoardVO view(int bno);
	public void delete(BoardVO vo);
	public void update(BoardVO vo);
	public int cnt(BoardVO vo);
	
	/*��� ����*/
	public void rWrite(ReviewVO vo);
	public List<ReviewVO> rList(int bno);
	public void cWrite(ReviewVO vo);
	public List<ReviewVO> cList(int bno);
	public void rcDelete(int rno);
	
	/*���� ����*/
	public void fileUpload(FileVO vo);
	public FileVO fileLoad(FileVO vo);
}
