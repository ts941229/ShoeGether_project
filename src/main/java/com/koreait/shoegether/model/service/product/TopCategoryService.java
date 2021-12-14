package com.koreait.shoegether.model.service.product;

import java.util.List;

import com.koreait.shoegether.domain.TopCategory;

public interface TopCategoryService {
	public List selectAll();
	public TopCategory select(int topcategory_id);
	public List selectChild();
}
