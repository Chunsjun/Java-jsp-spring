package org.myboard.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.myboard.domain.BoardVO;
import org.myboard.domain.ReviewVO;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO{

	@Inject
	private SqlSession session;
	private String namespace = "org.myboard.mapper.boardMapper";
	
	public List<BoardVO> list(BoardVO vo){
		return session.selectList(namespace+".list", vo);
	}

	@Override
	public void write(BoardVO vo) {
		session.insert(namespace+".write", vo);
	}

	@Override
	public BoardVO view(int bno) {
		session.update(namespace+".viewUp", bno);
		return session.selectOne(namespace+".view", bno);
	}

	@Override
	public void delete(BoardVO vo) {
		session.delete(namespace+".delete", vo);
	}

	@Override
	public int cnt(BoardVO vo) {
		return session.selectOne(namespace+".cnt", vo);
	}

	@Override
	public void update(BoardVO vo) {
		session.update(namespace+".update", vo);
	}

	/*---------답글 전용----------*/
	
	@Override
	public void rWrite(ReviewVO vo) {
		session.insert(namespace+".rWrite",vo);
	}

	@Override
	public List<ReviewVO> rList(int bno) {
		return session.selectList(namespace+".rList", bno);
	}
	
}
