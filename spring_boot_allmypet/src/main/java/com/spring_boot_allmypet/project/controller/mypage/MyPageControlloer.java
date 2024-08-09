package com.spring_boot_allmypet.project.controller.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageControlloer {
	@RequestMapping("/mypage")
	public String mpMain() {
		return "mypage/myPageMain";
	}
	
	/*마이페이지_커뮤니티*/
	
	@RequestMapping("/mypage/bookmark_post")
	public String bookMarkPost() {
		return "mypage/commBookmarkPost";
	}
	
	@RequestMapping("/mypage/bookmark_gallery")
	public String bookMarkGallery() {
		return "mypage/commBookmarkGallery";
	}
	
	@RequestMapping("/mypage/my_post_commnet")
	public String myPostCommnet() {
		return "mypage/commMyPostComment";
	}
	
	@RequestMapping("/mypage/my_emoji")
	public String myEmoji() {
		return "mypage/commMyEmoji";
	}
	
	@RequestMapping("/mypage/my_block_list")
	public String myBlockList() {
		return "mypage/commBlockList";
	}
	
	/*마이페이지_마켓*/
	
	@RequestMapping("/mypage/my_order_lists")
	public String orderList() {
		return "mypage/marketOrderList";
	}
	
	@RequestMapping("/mypage/my_goods_lists")
	public String goodsList() {
		return "mypage/marketGoodsList";
	}
	
	@RequestMapping("/mypage/my_coupon_lists")
	public String couponList() {
		return "mypage/marketCouponList";
	}
	
	/*마이페이지_브리더*/
	
	@RequestMapping("/mypage/breeder_regist")
	public String breederRegistration() {
		return "mypage/breederRegistration";
	}
	
	@RequestMapping("/mypage/inquiry_lists")
	public String inquiryLists() {
		return "mypage/breederInquiryList";
	}
}
