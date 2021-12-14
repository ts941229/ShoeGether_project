package com.koreait.shoegether.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koreait.shoegether.domain.SubCategory;
import com.koreait.shoegether.model.service.product.SubCategoryService;

@Controller
public class CategoryController {
	
	@Autowired
	private SubCategoryService subCategoryService;
	
	@GetMapping("/category/topdetail")
	@ResponseBody
	public List<SubCategory> getTopDetail(int topcategory_id, HttpServletRequest request) {
		List subList = subCategoryService.selectAllById(topcategory_id);
		
		return subList;
	}
}
