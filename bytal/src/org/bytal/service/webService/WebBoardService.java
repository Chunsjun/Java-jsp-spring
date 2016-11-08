package org.bytal.service.webService;

import java.util.List;

import org.bytal.domain.Board;

public interface WebBoardService {
	public List<Board> find(Board board);
	public Board view(Board board);
	public void add(Board board);
	public void edit(Board board);
	public void remove(Board board);
	public int count(Board board);
}
