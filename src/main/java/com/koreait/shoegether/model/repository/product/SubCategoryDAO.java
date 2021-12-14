package com.koreait.shoegether.model.repository.product;

import java.util.List;

import com.koreait.shoegether.domain.SubCategory;

public interface SubCategoryDAO {
	public List selectById(int topcategory_id);
	public SubCategory select(int subcategory_id);
}
