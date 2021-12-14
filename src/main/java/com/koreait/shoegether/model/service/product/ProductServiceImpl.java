package com.koreait.shoegether.model.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.shoegether.domain.Product;
import com.koreait.shoegether.exception.DMLException;
import com.koreait.shoegether.model.repository.product.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDAO productDAO;
	
	public List selectAll() {
		return productDAO.selectAll();
	}
	
	@Override
	public Product selectOne(int product_id) {
		return productDAO.selectOne(product_id);
	}

	@Override
	public List selectAllBySub(int subcategory_id) {
		return productDAO.selectAllBySub(subcategory_id);
	}

	@Override
	public void regist(Product product) throws DMLException{
		productDAO.insert(product);
		
	}

	@Override
	public void update(Product product) throws DMLException{
		productDAO.update(product);
	}

	@Override
	public void delete(int product) throws DMLException{
		productDAO.delete(product);
	}


}
