package com.koreait.shoegether.model.repository.comments;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.shoegether.domain.Comments;
import com.koreait.shoegether.exception.DMLException;

@Repository
public class MybatisCommentsDAO implements CommentsDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public void insert(Comments comments) throws DMLException{
		int result=sqlSessionTemplate.insert("Comments.insert", comments);
		if(result==0) {
			throw new DMLException("게시물 등록 실패");
		}
	}

	public void update(Comments comments) {
		
	}

	public void delete(Comments comments) {
		
	}

	public List commentsList(int board_id) {
		return sqlSessionTemplate.selectList("Comments.commentsList", board_id);
	}

}
