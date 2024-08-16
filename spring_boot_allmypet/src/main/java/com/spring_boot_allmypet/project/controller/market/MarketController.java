package com.spring_boot_allmypet.project.controller.market;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_boot_allmypet.project.model.market.CartVO;
import com.spring_boot_allmypet.project.model.market.MemberVO;
import com.spring_boot_allmypet.project.model.market.ProductVO;
import com.spring_boot_allmypet.project.service.market.CartService;
import com.spring_boot_allmypet.project.service.market.OrderService;
import com.spring_boot_allmypet.project.service.market.ProductService;

import jakarta.servlet.http.HttpSession;


@Controller
public class MarketController {
	@Autowired
	CartService cartService;
	
	@Autowired
	ProductService prdService;

	@Autowired
	OrderService orderService;
	
	
	//마켓홈
	@RequestMapping("/market/home")
	public String market_home() {
		return "/market/Home";
	}
	
	//상품 페이지
	@RequestMapping("/market/product")
	public String product(Model model) {
		ArrayList<ProductVO> prdList = prdService.listAllProduct();
		
		model.addAttribute("prdList", prdList);
		
		return "/market/product";
	}
	
	//굿즈 페이지
	@RequestMapping("/market/goods")
	public String goods(Model model) {
		ArrayList<ProductVO> prdList = prdService.listAllProduct();
		
		model.addAttribute("prdList", prdList);
		
		return "/market/goods";
	}
	
	
	// 상품 상세
	@RequestMapping("/market/product/detail/{prdNo}")
	public String product_detail(@PathVariable String prdNo, Model model) {
	    System.out.println("prdNo = " + prdNo);
	    ProductVO prd = prdService.detailViewProduct(prdNo);
	    model.addAttribute("prd", prd);
	    return "/market/product_detail";
	}

	// 장바구니 추가
	@RequestMapping("/market/product/insertCart")
	public String insertCart(CartVO vo, HttpSession session) {
	    // 로그인 성공 시 세션 sid 값 설정한 것을 가져와서 사용
	    String memId = "abcd";
	    vo.setMemId(memId); // 세션에서 가져온 memId를 설정

	    // (1) 동일 상품이 존재하는 지 확인 (회원id, 상품번호 전달) : 동일 상품 개수 반환
	    //int count = cartService.checkPrdInCart(vo.getPrdNo(), memId);
	    
		/*
		 * if (count == 0) { // (2) 동일 상품이 존재하지 않으면 장바구니에 추가 cartService.insertCart(vo);
		 * } else { // (3) 동일 상품이 존재하면 주문수량만 변경 cartService.updateQtyInCart(vo); }
		 */
	    cartService.insertCart(vo);
	    
	    // 장바구니에 저장/수정한 후 장바구니 목록 출력 요청 포워딩
	    return "redirect:/market/cart";
	}
	
	//굿즈 상세
	@RequestMapping("/market/goods/detail")
	public String goods_detail() {
		return "/market/goods_detail";
	}
	
	// 장바구니
	@RequestMapping("/market/cart/{prdNo}")
	public String cart(@PathVariable String prdNo, Model model,  HttpSession session) {
		//String memId = (String) session.getAttribute("sid"); // 로그인 헀을 때 사용
		String memId = "abcd";
		
		System.out.println("prdNo = " + prdNo);
	    ProductVO prd = prdService.detailViewProduct(prdNo);
	    model.addAttribute("prd", prd);
	    
		ArrayList<CartVO> cartList = cartService.cartList(memId);
		model.addAttribute("cartList", cartList);
		
		
		return "market/cart";
	}
	
	//주문/결제
	@RequestMapping("/market/order/{prdNo}")
	//public String order(@PathVariable String prdNo, Model model, HttpSession session) {
	public String orderForm(Model model, HttpSession session) {
		//String memId = (String) session.getAttribute("sid");
		String memId="abcd";
		String prdNo="1";
		
		System.out.println("prdNo = " +  prdNo);
		
		 MemberVO memVo = orderService.getMemberInfo(memId); 
		 ProductVO prdVo = orderService.getProductInfo(prdNo);
		  
		 model.addAttribute("memVo", memVo); 
		 model.addAttribute("prdVo", prdVo);
		
		return "/market/order";
	}
	
	//주문완료
	@RequestMapping("/market/order/complete")
	public String order_complete() {
		return "/market/order_complete";
	}
	
	//주문내역
	@RequestMapping("/market/order/history")
	public String order_history() {
		return "/market/order_history";
	}
	
	
	//굿즈 제작
	@RequestMapping("/market/goods/produce")
	public String goods_produce() {
		return "/market/goods_produce";
	}
	
}
