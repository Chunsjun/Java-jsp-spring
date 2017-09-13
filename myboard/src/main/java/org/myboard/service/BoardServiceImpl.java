package org.myboard.service;

import java.util.List;

import javax.annotation.Resource;

import org.myboard.domain.BoardVO;
import org.myboard.domain.FileVO;
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
	
	@Override
	public void cWrite(ReviewVO vo) {
		dao.cWrite(vo);
	}

	@Override
	public List<ReviewVO> cList(int bno) {
		return dao.cList(bno);
	}

	@Override
	public void rcDelete(int rno) {
		dao.rcDelete(rno);
	}

	/*파일 전용*/
	@Override
	public void fileUpload(FileVO vo) {
		dao.fileUpload(vo);
	}

	@Override
	public FileVO fileLoad(FileVO vo) {
		return dao.fileLoad(vo);
	}

}
