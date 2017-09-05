package org.myboard.service;

import java.util.List;

import javax.annotation.Resource;

import org.myboard.domain.BoardVO;
import org.myboard.domain.ReviewVO;
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
	public int cnt(BoardVO vo) {
		return dao.cnt(vo);
	}

	@Override
	public void update(BoardVO vo) {
		dao.update(vo);
	}

	/*---------답글 전용----------*/
	
	@Override
	public void rWrite(ReviewVO vo) {
		dao.rWrite(vo);
	}

	@Override
	public List<ReviewVO> rList(int bno) {
		return dao.rList(bno);
	}
}
