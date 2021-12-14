package com.koreait.shoegether.model.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.shoegether.domain.TopCategory;
import com.koreait.shoegether.model.repository.product.TopCategoryDAO;

@Service
public class TopCategoryServiceImpl implements TopCategoryService{
	
	@Autowired
	private TopCategoryDAO topCategoryDAO;
	
	@Override
	public List selectAll() {
		return topCategoryDAO.selectAll();
	}

	@Override
	public TopCategory select(int topcategory_id) {
		return topCategoryDAO.select(topcategory_id);
	}

	@Override
	public List selectChild() {
		return topCategoryDAO.selectChild();
	}

}
