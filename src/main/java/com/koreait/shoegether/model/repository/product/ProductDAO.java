package com.koreait.shoegether.model.repository.product;

import java.util.List;

import com.koreait.shoegether.domain.Product;


public interface ProductDAO {
	public List selectAll();
	public Product selectOne(int product_id);
	public List selectAllBySub(int subcategory_id);
	public void insert(Product product);
	public void update(Product product);
	public void delete(int product);
}
