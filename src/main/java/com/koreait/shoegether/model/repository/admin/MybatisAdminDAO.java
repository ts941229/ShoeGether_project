package com.koreait.shoegether.model.repository.admin;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.shoegether.domain.Admin;
import com.koreait.shoegether.exception.AdminNullException;

@Repository
public class MybatisAdminDAO implements AdminDAO{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public Admin select(Admin admin) throws AdminNullException{
		Admin manager = sqlSessionTemplate.selectOne("Admin.select", admin);
		if(manager==null) {
			throw new AdminNullException("존재하지 않는 관리자 정보입니다.");
		}
		return manager;
	}

}
