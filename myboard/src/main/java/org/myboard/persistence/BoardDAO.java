package org.myboard.persistence;

import java.util.List;

import org.myboard.domain.BoardVO;
import org.myboard.domain.ReviewVO;

public interface BoardDAO {
	
	/*게시판 전용*/
	public List<BoardVO> list(BoardVO vo);
	public void write(BoardVO vo);
	public BoardVO view(int bno);
	public void delete(BoardVO vo);
	public void update(BoardVO vo);
	public int cnt(BoardVO vo);
	
	/*답글 전용*/
	public void rWrite(ReviewVO vo);
	public List<ReviewVO> rList(int bno);
}
