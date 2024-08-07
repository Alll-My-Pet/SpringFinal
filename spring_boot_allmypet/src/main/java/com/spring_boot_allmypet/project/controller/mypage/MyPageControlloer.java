package com.spring_boot_allmypet.project.controller.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageControlloer {
	@RequestMapping("/mypage")
	public String mpMain() {
		return "mypage/myPageMain";
	}
	
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
}
