package org.graz.persistence;

import java.util.List;

import org.graz.domain.Board;
import org.graz.domain.Review;

public interface BoardMapper {
	public List<Board> select(Board board);
	public void insert(Board board);
	public Board view(int boardNo);
	public void update(Board board);
	public void delete(Board board);
	
	public int count();
	public void viewUp(int boardNo);
	
	public void review(Review review);
	public List<Review> viewReview(int boardNo);
	public int reviewCount(int boardNo);
	public void deleteReview(int reviewNo);
}
