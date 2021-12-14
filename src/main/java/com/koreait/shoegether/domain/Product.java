package com.koreait.shoegether.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Product {
	private int product_id;
	private int subcategory_id;
	private String name;
	private int price;
	private String detail;
	private String prod_img;
	private SubCategory subCategory; //join
	
	MultipartFile photo;
	
}
