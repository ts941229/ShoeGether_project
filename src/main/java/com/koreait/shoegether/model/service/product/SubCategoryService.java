package com.koreait.shoegether.model.service.product;

import java.util.List;

import com.koreait.shoegether.domain.SubCategory;

public interface SubCategoryService {
	public List selectAllById(int topcategory_id);
	public SubCategory select(int subcategory_id);
}
