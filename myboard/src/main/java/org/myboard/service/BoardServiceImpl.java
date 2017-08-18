package org.myboard.service;

import java.util.List;

import javax.annotation.Resource;

import org.myboard.domain.BoardVO;
import org.myboard.persistence.BoardDAO;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Resource
	private BoardDAO dao;

	@Override
	public List<BoardVO> list(BoardVO vo) {
		return dao.list(vo);
	}

	@Override
	public void write(BoardVO vo) {
		dao.write(vo);
	}

	@Override
	public BoardVO view(int bno) {
		return dao.view(bno);
	}

	@Override
	public void delete(BoardVO vo) {
		dao.delete(vo);
	}

	@Override
	public int cnt() {
		return dao.cnt();
	}
}
