package com.koreait.shoegether.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.shoegether.domain.Member;
import com.koreait.shoegether.model.repository.member.MemberDAO;
@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public Member login(Member member) {
		return memberDAO.login(member);
	}


	@Override
	public void regist(Member member) {
		memberDAO.regist(member);
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
