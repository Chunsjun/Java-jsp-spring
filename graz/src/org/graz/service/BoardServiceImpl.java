package org.graz.service;

import java.util.List;

import javax.annotation.Resource;

import org.graz.domain.Board;
import org.graz.domain.File;
import org.graz.domain.Review;
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

	@Override
	public void review(Review review) {
		this.boardMapper.review(review);
	}

	@Override
	public List<Review> viewReview(int boardNo) {
		return this.boardMapper.viewReview(boardNo);
	}

	@Override
	public int reviewCount(int boardNo) {
		return this.boardMapper.reviewCount(boardNo);
	}

	@Override
	public void deleteReview(int reviewNo) {
		this.boardMapper.deleteReview(reviewNo);
	}

	@Override
	public void fileWrite(File file) {
		this.boardMapper.fileWrite(file);
	}

	@Override
	public File fileLoad(int boardNo) {
		return this.boardMapper.fileLoad(boardNo);
	}

}
