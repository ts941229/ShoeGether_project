package com.koreait.shoegether.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.shoegether.domain.Comments;
import com.koreait.shoegether.exception.DMLException;
import com.koreait.shoegether.model.repository.comments.CommentsDAO;

@Service
public class CommentsServiceImpl implements CommentsServcie{
	@Autowired
	private CommentsDAO commentsDAO;
	
	public void insert(Comments comments) throws DMLException{
		commentsDAO.insert(comments);
	}

	public void update(Comments comments) {
		
	}

	public void delete(Comments comments) {
		
	}

	public List commentsList(int board_id) {
		return commentsDAO.commentsList(board_id);
	}

}
