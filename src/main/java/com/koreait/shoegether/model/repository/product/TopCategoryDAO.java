package com.koreait.shoegether.model.repository.product;

import java.util.List;

import com.koreait.shoegether.domain.TopCategory;

public interface TopCategoryDAO {
	public List selectAll();
	public TopCategory select(int topcategory_id);
	public List selectChild();
}
