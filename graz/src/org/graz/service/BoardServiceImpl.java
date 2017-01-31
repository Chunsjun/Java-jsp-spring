package org.graz.service;

import java.util.List;

import javax.annotation.Resource;

import org.graz.domain.Board;
import org.graz.persistence.BoardMapper;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{

	@Resource
	private BoardMapper boardMapper;
	
	@Override
	public List<Board> list(Board board) {
		return this.boardMapper.select(board);
	}

	@Override
	public void write(Board board) {
		this.boardMapper.insert(board);
	}

	@Override
	public Board view(int boardNo) {
		return this.boardMapper.view(boardNo);
	}

	@Override
	public void update(Board board) {
		this.boardMapper.update(board);
	}

	@Override
	public void delete(Board board) {
		this.boardMapper.delete(board);
	}

	@Override
	public int count() {
		return this.boardMapper.count();
	}

	@Override
	public void viewUp(int boardNo) {
		this.boardMapper.viewUp(boardNo);
	}

}
