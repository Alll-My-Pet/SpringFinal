package com.spring_boot_allmypet.project.controller.mypage;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring_boot_allmypet.project.model.member.MemberPointVO;
import com.spring_boot_allmypet.project.model.member.MemberVO;
import com.spring_boot_allmypet.project.model.member.PetVO;
import com.spring_boot_allmypet.project.model.mypage.BlockListVO;
import com.spring_boot_allmypet.project.model.mypage.BookMarkGVO;
import com.spring_boot_allmypet.project.model.mypage.BookMarkVO;
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


	/* 포인트 정보 상세 */
	@RequestMapping("/mypage/point_detail")
	public String mpPointDeatil(HttpSession session,Model model) {
		LocalDate currentDate = LocalDate.now();
	    int Year = currentDate.getYear();
	    int Month = currentDate.getMonthValue();
		String memId = (String) session.getAttribute("mid");
		MemberVO memVO = mypageService.memInfoView(memId);
		ArrayList<MemberPointVO> pointList_total=mypageService.myPointList_total(memId);
		ArrayList<MemberPointVO> pointList = mypageService.myPointList(memId, Year, Month);
		
		int positive = 0; 
	    int negative = 0;
	    for (MemberPointVO point : pointList) {
	        int change = point.getPoint_change();
	        if (change > 0) {
	        	positive += change; 
	        } else if (change < 0) {
	        	negative += change;
	        }
	    }
		
		model.addAttribute("memVO",memVO);
		model.addAttribute("pointList_total",pointList_total);
		model.addAttribute("pointList",pointList);
		model.addAttribute("Month",Month);
		model.addAttribute("positive",positive);
		model.addAttribute("negative",negative);
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
	
	/* 북마크 페이지 */
	@RequestMapping("/mypage/bookmark_post")
	public String bookMarkPost(HttpSession session,Model model) {
		String memId = (String) session.getAttribute("mid");
		ArrayList<BookMarkVO> bookMarkList = mypageService.bookMarkPostList(memId);
		
		model.addAttribute("bookMarkList",bookMarkList);
		return "mypage/commBookmarkPost";
	}
	
	/* 북마크 겔러리 */
	@RequestMapping("/mypage/bookmark_gallery")
	public String bookMarkGallery(HttpSession session,Model model) {
		String memId = (String) session.getAttribute("mid");
		ArrayList<BookMarkGVO> bookMarkList=mypageService.bookMarkGalleryList(memId);
		
		model.addAttribute("bookMarkList", bookMarkList);
		return "mypage/commBookmarkGallery";
	}
	/* 내가쓴 글/댓글 */
	@RequestMapping("/mypage/my_post_commnet")
	public String myPostCommnet(HttpSession session,Model model) {
		String memId = (String) session.getAttribute("mid");
		List<Map<String, Object>> postsComments = mypageService.myPosts_Comments(memId);
	    
		
	    for (Map<String, Object> postComment : postsComments) {
	        if (postComment.get("date") instanceof LocalDateTime) {
	            LocalDateTime localDateTime = (LocalDateTime) postComment.get("date");
	            postComment.put("date", Timestamp.valueOf(localDateTime));
	        }
	    }

	    model.addAttribute("postsComments", postsComments);
		
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
	
	/* 블락 리스트 */
	@RequestMapping("/mypage/my_block_list")
	public String myBlockList(HttpSession session,Model model) {
		String memId = (String) session.getAttribute("mid");
		ArrayList<BlockListVO> blockList=mypageService.blockList(memId);
		
		model.addAttribute("blockList", blockList);
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
