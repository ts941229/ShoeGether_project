package com.koreait.shoegether.model.service.product;

import java.util.List;

import com.koreait.shoegether.domain.Product;


public interface ProductService {
	public List selectAll();
	public Product selectOne(int product_id);
	public List selectAllBySub(int subcategory_id);
	public void regist(Product product);
	public void update(Product product);
	public void delete(int product);
}
