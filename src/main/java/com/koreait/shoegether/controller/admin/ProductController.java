package com.koreait.shoegether.controller.admin;

import java.net.http.HttpRequest;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.koreait.shoegether.domain.Product;
import com.koreait.shoegether.exception.DMLException;
import com.koreait.shoegether.exception.FileDeleteException;
import com.koreait.shoegether.exception.UploadException;
import com.koreait.shoegether.model.common.file.FileManager;
import com.koreait.shoegether.model.service.product.ProductService;
import com.koreait.shoegether.model.service.product.TopCategoryService;

@Controller
public class ProductController {
	
	@Autowired
	private TopCategoryService topCategoryService;

	@Autowired
	private ProductService productService;
	
	@Autowired
	private FileManager fileManager;
	
	//상품등록 폼 요청
	@RequestMapping(value = "/product/registform", method = RequestMethod.GET)
	public String productRegistForm(Model model, HttpServletRequest request) {
		List topList = topCategoryService.selectAll();
		
		model.addAttribute("topList", topList);
		
		return "admin/product/product_regist";
	}
	
	//상품등록 요청
	@PostMapping("/product/regist")
	public String productRegist(Product product, HttpServletRequest request) {

		MultipartFile photo = product.getPhoto();
		//System.out.println("photo : "+photo);
		//System.out.println("상품 이름 : "+product.getName());
		ServletContext context = request.getServletContext();
		long time = System.currentTimeMillis();
		
		String filename = time+"."+fileManager.getExt(photo.getOriginalFilename());
		
		fileManager.saveFile(context, filename, photo);
		product.setProd_img(filename);
		productService.regist(product);
		
		return "redirect:/admin/product/list";
	}
	
	//상품목록 요청 (모든 상품 가져오기)
	@RequestMapping(value = "/product/list", method = RequestMethod.GET)
	public String productList(Model model, HttpServletRequest request) {
		List<Product> productList = productService.selectAll();
		model.addAttribute("productList", productList);
		for(Product product: productList) {
			
			//System.out.println("프로덕트 이름 : "+product.getName());
			//System.out.println("서브카테고리 이름 : "+product.getSubCategory().getSub_name());
			//System.out.println("탑카테고리 이름 : "+product.getSubCategory().getTopCategory().getTop_name());
		}
		return "admin/product/product_list";
	}
	
	//상품수정폼 요청
	@GetMapping("/product/updateform")
	public ModelAndView productUpdateForm(HttpServletRequest request, int product_id) {
		Product product = productService.selectOne(product_id);
		List topList = topCategoryService.selectAll();
		
		ModelAndView mav = new ModelAndView("admin/product/product_update");
		mav.addObject("product", product);
		mav.addObject("topList", topList);
		
		return mav;
	}
	
	//상품수정 요청
	@PostMapping("product/update")
	public String productUpdate(HttpServletRequest request, Product product) {
		
		//기존 상품 가져오기 (파일 삭제를 위해)
		Product pastProduct = productService.selectOne(product.getProduct_id());
		
		ServletContext context = request.getServletContext();
		
		
		System.out.println("상품 이름 : "+pastProduct.getProd_img());
		
		fileManager.deleteFile(context, pastProduct.getProd_img());
		
		//파일 새로 추가
		MultipartFile photo = product.getPhoto();
		long time = System.currentTimeMillis();
		String filename = time+"."+fileManager.getExt(photo.getOriginalFilename());
		fileManager.saveFile(context, filename, photo);
		product.setProd_img(filename);
		
		productService.update(product);
		
		return "redirect:/admin/product/list";
	}
	
	//상품삭제 요청
	@GetMapping("product/delete")
	public String productDelete(HttpServletRequest request, int product_id) {
		
		fileManager.deleteFile(request.getServletContext(), productService.selectOne(product_id).getProd_img());
		System.out.println("파일 삭제 성공");
		productService.delete(product_id);
		System.out.println("레코드 삭제 성공");
		
		return "redirect:/admin/product/list";
	}
	
	
	@ExceptionHandler(DMLException.class)
	public String handleException(DMLException e, Model model) {
		model.addAttribute("e", e);
		return "error/result";
	}
	@ExceptionHandler(UploadException.class)
	public String handleException(UploadException e, Model model) {
		model.addAttribute("e", e);
		return "error/result";
	}
	@ExceptionHandler(FileDeleteException.class)
	public String handleException(FileDeleteException e, Model model) {
		model.addAttribute("e", e);
		return "error/result";
	}
}
