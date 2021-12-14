package com.koreait.shoegether.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.shoegether.domain.Board;
import com.koreait.shoegether.exception.DMLException;
import com.koreait.shoegether.model.repository.board.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public List selectAll() {
		return boardDAO.selectAll();
	}

	@Override
	public Board select(int board_id) {
		return boardDAO.select(board_id);
	}

	@Override
	public void insert(Board board) throws DMLException{
		boardDAO.insert(board);
	}

	@Override
	public void update(Board board) throws DMLException{
		boardDAO.update(board);
	}

	@Override
	public void delete(int board_id) throws DMLException{
		boardDAO.delete(board_id);
	}

}
