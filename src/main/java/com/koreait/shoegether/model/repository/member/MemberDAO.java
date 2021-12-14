package com.koreait.shoegether.model.repository.member;

import java.util.List;

import com.koreait.shoegether.domain.Admin;
import com.koreait.shoegether.domain.Member;

public interface MemberDAO {
	public Member login(Member member); //로그인 
	public void regist(Member member);//관리자 등록 
	public void update(Member member);//관리자 수정
	public void delete(Member member); //아이디, 패스워드가 모두 일치할때 탈퇴시켜야 하기 때문...
	public List selectAll();
}
