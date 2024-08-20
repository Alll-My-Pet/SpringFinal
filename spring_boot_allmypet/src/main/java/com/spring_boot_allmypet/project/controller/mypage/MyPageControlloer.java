package com.spring_boot_allmypet.project.controller.mypage;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring_boot_allmypet.project.model.member.MemberVO;
import com.spring_boot_allmypet.project.model.member.PetVO;
import com.spring_boot_allmypet.project.service.mypage.MypageService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MyPageControlloer {
	@Autowired
	MypageService mypageService;
	
	@RequestMapping("/mypage")
	public String mpMain(HttpSession session,Model model) {
		String memId = (String) session.getAttribute("mid");
		MemberVO memVO = mypageService.memInfoView(memId);
		ArrayList<PetVO> petVoList = mypageService.myPetList(memId);
		
		model.addAttribute("memVO", memVO);
		model.addAttribute("petList",petVoList);
		
		return "mypage/myPageMain";
	}
	
	/*내정보 수정 업데이트*/
	@RequestMapping("/mypage/update")
	public String mpUdate(HttpSession session,MemberVO memVO, @RequestParam("profileImage") String profileImage) {
	    memVO.setMemId((String) session.getAttribute("mid"));
	    memVO.setProfile_image(profileImage);
	    mypageService.updateMyInfo(memVO);
	    return "redirect:/mypage";
	}


	
	@RequestMapping("/mypage/point_detail")
	public String mpPointDeatil() {
		return "mypage/pointsDetails";
	}
	
	/* 내정보 호출*/
	@RequestMapping("/mypage/edit_info")
	public String mpEditInfo(HttpSession session,Model model) {
		String memId = (String) session.getAttribute("mid");
		MemberVO memVO = mypageService.memInfoView(memId);
		ArrayList<PetVO> petVoList = mypageService.myPetList(memId);
        SimpleDateFormat birthFormat = new SimpleDateFormat("yyyy-MM-dd");
        String[] birth = birthFormat.format(memVO.getMemBirth()).split("-");
        
        

        model.addAttribute("memVO", memVO); 
        model.addAttribute("year",birth[0]);
        model.addAttribute("month",birth[1]);
        model.addAttribute("day",birth[2]);
        model.addAttribute("petList",petVoList);
        
		return "mypage/editInfo";
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
	
	@RequestMapping("/mypage/my_emoji/made")
	public String madeEmoji() {
		return "mypage/commEmojiIMade";
	}
	
	@RequestMapping("/mypage/my_emoji/have")
	public String haveEmoji() {
		return "mypage/commEmojiIHave";
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
