package com.koreait.shoegether.model.repository.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.shoegether.domain.Product;
import com.koreait.shoegether.exception.DMLException;

@Repository
public class MybatisProductDAO implements ProductDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("Product.selectAll");
	}
	
	@Override
	public Product selectOne(int product_id) {
		return sqlSessionTemplate.selectOne("Product.selectOne", product_id);
	}

	@Override
	public List selectAllBySub(int subcategory_id) {
		return sqlSessionTemplate.selectList("Product.selectAllBySub", subcategory_id);
	}


	@Override
	public void insert(Product product) throws DMLException{
		int result = sqlSessionTemplate.insert("Product.insert", product);
		if(result==0) {
			throw new DMLException("상품 등록 실패");
		}
	}

	@Override
	public void update(Product product) throws DMLException{
		int result = sqlSessionTemplate.update("Product.update", product);
		if(result==0) {
			throw new DMLException("상품 수정 실패");
		}
	}
	
	@Override
	public void delete(int product) throws DMLException{
		int result = sqlSessionTemplate.update("Product.delete", product);
		if(result==0) {
			throw new DMLException("상품 삭제 실패");
		}
	}


	
}
