package com.koreait.shoegether.model.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.shoegether.domain.Admin;
import com.koreait.shoegether.exception.AdminNullException;
import com.koreait.shoegether.model.repository.admin.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public Admin select(Admin admin) throws AdminNullException{
		return adminDAO.select(admin);
	}

}
