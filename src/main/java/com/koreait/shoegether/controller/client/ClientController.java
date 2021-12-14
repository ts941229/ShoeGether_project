package com.koreait.shoegether.controller.client;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.koreait.shoegether.domain.Board;
import com.koreait.shoegether.domain.Comments;
import com.koreait.shoegether.domain.Member;
import com.koreait.shoegether.domain.Product;
import com.koreait.shoegether.model.repository.product.TopCategoryDAO;
import com.koreait.shoegether.model.service.BoardService;
import com.koreait.shoegether.model.service.CommentsServcie;
import com.koreait.shoegether.model.service.MemberService;
import com.koreait.shoegether.model.service.product.ProductService;
import com.koreait.shoegether.model.service.product.TopCategoryService;

@Controller
public class ClientController {
	
	@Autowired
	private TopCategoryService topCategoryService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CommentsServcie commentsService;
	
	
	//메인페이지 요청
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String getMain() {
		return "client/main/index";
	}
	
	//shop요청
	@RequestMapping(value = "/shop", method = RequestMethod.GET)
	public String getShop(Model model) {
		List topList = topCategoryService.selectChild();
		List productList = productService.selectAll();
		model.addAttribute("topList", topList);
		model.addAttribute("productList", productList);
		return "client/shop/shop";
	}
	
	//shopList요청 BySubCategory
	@GetMapping("/shop/list")
	public String shopList(int subcategory_id, Model model) {
		List topList = topCategoryService.selectChild();
		List productList = productService.selectAllBySub(subcategory_id);
		model.addAttribute("topList", topList);
		model.addAttribute("productList", productList);
		return "client/shop/shop_list";
	}
	
	//cart요청
	@GetMapping("shop/cart")
	public String getCart(int product_id, Model model) {
		Product product = productService.selectOne(product_id);
		model.addAttribute("product", product);
		
		return "client/shop/shop_cart";
	}
	
	/*
	 * //community요청
	 * @RequestMapping(value = "/community", method = RequestMethod.GET) public
	 * String getCommunity() { return "client/community/community"; }
	 */
	
	/*--------------------------------------------------------------------------*/
	
	//about요청
	@RequestMapping(value = "/about3", method = RequestMethod.GET)
	public String getabout3() {
		return "client/about/about3";
	}

	// about요청
	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String getAbout() {
		return "client/about/about";
	}
		
	// logout요청
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String getOut(HttpSession session) {
		session.invalidate();
		/* return "redirect:/client/about"; */
		return "client/main/index";
	}

	// community요청
	@GetMapping("/community")
	public String getCommunity(Model model, HttpServletRequest request) {
		String gor = "client/community/community";
		List<Board> boardList = boardService.selectAll();
		System.out.println("사이즈 : " + boardList.size());
		if(request.getSession().getAttribute("member")==null) {
			System.out.println("비어있어요");
			gor = "client/community/noLogin";
		}
		model.addAttribute("boardList", boardList);
		return gor;
	}

	// detail요청
	@GetMapping("/community/detail")
	public String getDetail(Model model, int board_id, HttpServletRequest request) {
		int board_num = Integer.parseInt(request.getParameter("board_id"));
		List list = commentsService.commentsList(board_num);
		Board board = boardService.select(board_id);
		model.addAttribute("board", board);
		model.addAttribute("commentsList", list);

		return "client/community/detail";
	}

	// detail요청
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String setComments(Model model, HttpServletRequest request, Comments comments) {
		comments.setBoard_id(Integer.parseInt(request.getParameter("board_id")));
		comments.setWriter(request.getParameter("writer"));
		comments.setContent(request.getParameter("content"));
		commentsService.insert(comments);

		 String referer = request.getHeader("Referer");
		 return "redirect:"+ referer;
	}
		
	@RequestMapping(value = "/registMemberForm", method = RequestMethod.POST)
	public String registMemberForm(Model model, HttpServletRequest request, Member member) {
		member.setHost_id(request.getParameter("host_id"));
		member.setPassword(request.getParameter("password"));
		member.setName(request.getParameter("name"));
		member.setAuth(request.getParameter("auth"));
		memberService.regist(member);
		System.out.println("등록 완료");
		return "client/main/index";
	}
		
		
	/* registMemberForm */

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Member member, HttpServletRequest request, HttpSession session) {
		// 3단계: 일 시키기
		Member obj = memberService.login(member);

		// 4단계: 저장
		session = request.getSession();
		session.setAttribute("member", obj);// request가 아닌 세션에 저장함
		return "/client/main/index"; // 어드민 메인페이지 명
	}


	  @RequestMapping(path = "/community/write", method = RequestMethod.GET) 
	  public String writeBoard() {
		  return "client/community/write";
	  }
	  
	  @RequestMapping(path = "/registMember", method = RequestMethod.GET) 
	  public String registMember() {
		  return "client/about/registMember";
	  }
	 
		
  
	@RequestMapping(value = "/writeboard", method = RequestMethod.POST)
	public String setBoard(Model model, HttpServletRequest request, Board board) {
		System.out.println("호출!!!!!!!!!!!!!!!!!!!!!!!!!");
		board.setTitle(request.getParameter("title"));
		board.setWriter(request.getParameter("writer"));
		board.setContent(request.getParameter("content"));
		boardService.insert(board);

		return "redirect:/client/community";
	}
}
