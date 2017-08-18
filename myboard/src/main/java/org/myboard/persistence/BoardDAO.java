package org.myboard.persistence;

import java.util.List;

import org.myboard.domain.BoardVO;

public interface BoardDAO {
	
	public List<BoardVO> list(BoardVO vo);
	public void write(BoardVO vo);
	public BoardVO view(int bno);
	public void delete(BoardVO vo);
	
	public int cnt();
}
