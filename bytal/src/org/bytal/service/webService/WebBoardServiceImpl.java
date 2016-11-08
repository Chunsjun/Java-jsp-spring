package org.bytal.service.webService;

import java.util.List;

import javax.annotation.Resource;

import org.bytal.domain.Board;

import org.bytal.persistence.WebBoardMapper;
import org.springframework.stereotype.Service;

@Service
public class WebBoardServiceImpl implements WebBoardService{
	@Resource
	private WebBoardMapper webBoardMapper;

	@Override
	public List<Board> find(Board board) {
		// TODO Auto-generated method stub
		return this.webBoardMapper.list(board);
	}

	@Override
	public Board view(Board board) {
		// TODO Auto-generated method stub
		return this.webBoardMapper.select(board);
	}

	@Override
	public void add(Board board) {
		// TODO Auto-generated method stub
		this.webBoardMapper.insert(board);
	}

	@Override
	public void edit(Board board) {
		// TODO Auto-generated method stub
		this.webBoardMapper.update(board);
	}

	@Override
	public void remove(Board board) {
		// TODO Auto-generated method stub
		this.webBoardMapper.delete(board);
	}

	@Override
	public int count(Board board) {
		// TODO Auto-generated method stub
		return this.webBoardMapper.count(board);
	}

}
