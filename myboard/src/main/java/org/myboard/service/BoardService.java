package org.myboard.service;

import java.util.List;

import org.myboard.domain.BoardVO;

public interface BoardService {
	
	public List<BoardVO> list(BoardVO vo);
	public void write(BoardVO vo);
	public BoardVO view(int bno);
	public void delete(BoardVO vo);
	
	public int cnt();
}
