package com.koreait.shoegether.model.service;

import java.util.List;

import com.koreait.shoegether.domain.Comments;

public interface CommentsServcie {
	public void insert(Comments comments);
	public void update(Comments comments);
	public void delete(Comments comments);
	public List commentsList(int board_id);
}
