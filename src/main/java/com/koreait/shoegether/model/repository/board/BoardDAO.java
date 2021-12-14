package com.koreait.shoegether.model.repository.board;

import java.util.List;

import com.koreait.shoegether.domain.Board;


public interface BoardDAO {
	public List selectAll();
	public Board select(int board_id);
	public void insert(Board board);
	public void update(Board board);
	public void delete(int board_id);
}
