package com.koreait.shoegether.model.repository.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koreait.shoegether.domain.SubCategory;

@Repository
public class MybatisSubCategoryDAO implements SubCategoryDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List selectById(int topcategory_id) {
		return sqlSessionTemplate.selectList("SubCategory.selectAllById", topcategory_id);
	}

	@Override
	public SubCategory select(int subcategory_id) {
		return sqlSessionTemplate.selectOne("SubCategory.select", subcategory_id);
	}

}
