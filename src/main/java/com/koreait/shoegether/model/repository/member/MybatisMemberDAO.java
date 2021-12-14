package com.koreait.shoegether.model.repository.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.shoegether.domain.Admin;
import com.koreait.shoegether.domain.Member;

@Repository
public class MybatisMemberDAO implements MemberDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public Member login(Member member) {
		Member obj=sqlSessionTemplate.selectOne("Member.login", member);
		return obj;
	}

	@Override
	public void regist(Member member) {
		int result = sqlSessionTemplate.insert("Member.insert",member);
		
	}

	@Override
	public void update(Member member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Member member) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

}
