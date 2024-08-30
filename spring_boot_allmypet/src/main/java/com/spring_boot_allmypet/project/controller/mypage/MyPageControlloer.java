package com.spring_boot_allmypet.project.controller.mypage;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring_boot_allmypet.project.model.market.OrderInfoVO;
import com.spring_boot_allmypet.project.model.market.OrderProductVO;
import com.spring_boot_allmypet.project.model.market.ProductVO;
import com.spring_boot_allmypet.project.model.member.MemberPointVO;
import com.spring_boot_allmypet.project.model.member.MemberVO;
import com.spring_boot_allmypet.project.model.member.PetVO;
import com.spring_boot_allmypet.project.model.mypage.BlockListVO;
import com.spring_boot_allmypet.project.model.mypage.BookMarkGVO;
import com.spring_boot_allmypet.project.model.mypage.BookMarkVO;
import com.spring_boot_allmypet.project.model.mypage.BreederInfoVO;
import com.spring_boot_allmypet.project.service.market.OrderService;
import com.spring_boot_allmypet.project.service.market.ProductService;
import com.spring_boot_allmypet.project.service.member.MemberService;
import com.spring_boot_allmypet.project.service.mypage.MypageService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MyPageControlloer {
	@Autowired
	MypageService mypageService;
	@Autowired
	MemberService memService;
	@Autowired
	OrderService orderService;
	@Autowired
	ProductService prdService;

	
	@RequestMapping("/mypage")
	public String mpMain(HttpSession session,Model model) {
		String memId = (String) session.getAttribute("mid");
		session.setAttribute("mpos", memService.memPosition(memId));	
		String mpos = String.valueOf(session.getAttribute("mpos")) ;
		MemberVO memVO = mypageService.memInfoView(memId);
		ArrayList<PetVO> petVoList = mypageService.myPetList(memId);
		
		model.addAttribute("memVO", memVO);
		model.addAttribute("petList",petVoList);
		model.addAttribute("mpos",mpos);
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
	/* 이모지 페이지 */
	@RequestMapping("/mypage/my_emoji")
	public String myEmoji(HttpSession session,Model model) {
		String memId = (String) session.getAttribute("mid");
		List<Map<String, Object>> emj_f = mypageService.emoji_favorites(memId);
		List<Map<String, Object>> emj_e = mypageService.emoji_my_edit(memId);
		List<Map<String, Object>> emj_p_list = mypageService.emoji_my_purch(memId);	
		
		for (Map<String, Object> emj_p : emj_p_list) {
		    if (emj_p.get("purchaseDate") instanceof LocalDateTime) {
		        LocalDateTime localDateTime = (LocalDateTime) emj_p.get("purchaseDate");
		        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		        String formattedDate = localDateTime.format(formatter);
		        emj_p.put("purchaseDate", formattedDate);
		    }
	    }
		
		model.addAttribute("emj_f_List",emj_f);
		model.addAttribute("emj_e_List",emj_e);
		model.addAttribute("emj_p_List",emj_p_list);
		
		return "mypage/commMyEmoji";
	}
	
	@RequestMapping("/mypage/my_emoji/made")
	public String madeEmoji(HttpSession session,Model model) {
		String memId = (String) session.getAttribute("mid");
		List<Map<String, Object>> emj_e = mypageService.emoji_my_edit(memId);
		model.addAttribute("emj_e_List",emj_e);
		return "mypage/commEmojiIMade";
	}
	
	@RequestMapping("/mypage/my_emoji/have")
	public String haveEmoji(HttpSession session,Model model) {
		String memId = (String) session.getAttribute("mid");
		List<Map<String, Object>> emj_p_list = mypageService.emoji_my_purch(memId);	
		model.addAttribute("emj_p_List",emj_p_list);
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
	public String orderList(@RequestParam(value = "filter", required = false) String filter, Model model, HttpSession session) {
		
	    String memId = (String) session.getAttribute("mid");
	    //String memId = "abcd";
	    List<OrderInfoVO> orderList;

	    // 현재 날짜
	    LocalDate now = LocalDate.now();

	    // 필터 조건에 따라 기간 계산
	    if ("6months".equals(filter)) {
	        orderList = orderService.getOrderHistoryByPeriod(memId, now.minusMonths(6));
	    } else if ("1year".equals(filter)) {
	        orderList = orderService.getOrderHistoryByPeriod(memId, now.minusYears(1));
	    } else if ("2years".equals(filter)) {
	        orderList = orderService.getOrderHistoryByPeriod(memId, now.minusYears(2));
	    } else {
	        orderList = orderService.getOrderHistory(memId); // 전체 주문 내역
	    }

	    // 각 주문에 대한 상품 정보를 추가로 가져옴
	    for (OrderInfoVO order : orderList) {
	        List<OrderProductVO> products = orderService.getOrderProductsByOrderNo(order.getOrdNo());
	        for (OrderProductVO product : products) {
	            ProductVO productDetails = prdService.detailViewProduct(product.getPrdNo());
	            product.setProductDetails(productDetails);
	        }
	        order.setOrderProducts(products);
	    }

	    model.addAttribute("orderList", orderList);
		return "mypage/marketOrderList";
	}
	
	@RequestMapping("/mypage/my_goods_lists")
	public String goodsList() {
		return "mypage/marketGoodsList";
	}
	/*쿠폰 리스트*/
	@RequestMapping("/mypage/my_coupon_lists")
	public String couponList(HttpSession session,Model model) {
		String memId = (String) session.getAttribute("mid");
		List<Map<String, Object>> coupon_list = mypageService.myCouponList(memId);
		model.addAttribute("coupon_list",coupon_list);
		return "mypage/marketCouponList";
	}
	
	/*마이페이지_브리더*/
	
	@RequestMapping("/mypage/breeder_regist")
	public String breederRegistration(HttpSession session,Model model) {
		String mpos = String.valueOf(session.getAttribute("mpos")) ;
		model.addAttribute("mpos",mpos);
		return "mypage/breederRegistration";
	}
	@RequestMapping("/mypage/breederInsert")
	public String breederInsert(HttpSession session,BreederInfoVO breederInfoVo) {
		String memId = (String) session.getAttribute("mid");
		breederInfoVo.setMemId(memId);
		mypageService.breederUpdate(breederInfoVo);
		mypageService.updateBreeder(memId);
		return "redirect:/mypage";
	}
	@RequestMapping("/mypage/breederUpdate")
	public String breederUpdate(HttpSession session,BreederInfoVO breederInfoVo) {
		String memId = (String) session.getAttribute("mid");
		breederInfoVo.setMemId(memId);
		mypageService.breederUpdate(breederInfoVo);
		return "redirect:/mypage";
	}
	
	@RequestMapping("/mypage/inquiry_lists")
	public String inquiryLists() {
		return "mypage/breederInquiryList";
	}
}
