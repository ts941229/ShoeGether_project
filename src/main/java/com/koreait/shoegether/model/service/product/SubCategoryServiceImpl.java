package com.koreait.shoegether.model.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.shoegether.domain.SubCategory;
import com.koreait.shoegether.model.repository.product.SubCategoryDAO;

@Service
public class SubCategoryServiceImpl implements SubCategoryService{

	@Autowired
	private SubCategoryDAO subCategoryDAO;
	
	@Override
	public List selectAllById(int topcategory_id) {
		return subCategoryDAO.selectById(topcategory_id);
	}

	@Override
	public SubCategory select(int subcategory_id) {
		return subCategoryDAO.select(subcategory_id);
	}

}
