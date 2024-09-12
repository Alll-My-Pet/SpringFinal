package com.spring_boot_allmypet.project.controller.market;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring_boot_allmypet.project.service.market.ProductService;
import com.spring_boot_allmypet.project.service.mypage.MypageService;

import jakarta.servlet.http.HttpSession;

import com.spring_boot_allmypet.project.service.market.OrderService;
import com.spring_boot_allmypet.project.model.market.OrderInfoVO;
import com.spring_boot_allmypet.project.model.market.OrderProductVO;
import com.spring_boot_allmypet.project.model.market.CartVO;
import com.spring_boot_allmypet.project.model.market.MemberVO;
import com.spring_boot_allmypet.project.model.market.OrderCancelVO;
import com.spring_boot_allmypet.project.model.market.ProductVO;
import com.spring_boot_allmypet.project.model.market.ReviewVO;
import com.spring_boot_allmypet.project.model.member.MemberPointVO;
import com.spring_boot_allmypet.project.service.market.CartService;


@Controller
public class MarketController {
	@Autowired
	CartService cartService;
	
	@Autowired
	ProductService prdService;

	@Autowired
	OrderService orderService;
	
	@Autowired
	MypageService mypageService;
	
	//마켓홈
	@RequestMapping("/market/home")
	public String market_home(HttpSession session) {
		return "market/Home";
	}
	
	  // 상품 페이지 (prdCtg 1~4)
    @RequestMapping("/market/product")
    public String product(@RequestParam(value = "petCtgNo", required = false) String petCtgNo,
                          @RequestParam(value = "prdCtgNo", required = false) String prdCtgNo,
                          Model model) {
        ArrayList<ProductVO> prdList;
        prdList = prdService.listProductsByCtg(petCtgNo, prdCtgNo, 1, 4);
        
        model.addAttribute("prdList", prdList);
        return "market/product";
    }

    // 굿즈 페이지 (prdCtg 5~8)
    @RequestMapping("/market/goods")
    public String goods(@RequestParam(value = "petCtgNo", required = false) String petCtgNo,
                        @RequestParam(value = "prdCtgNo", required = false) String prdCtgNo,
                        Model model) {
        ArrayList<ProductVO> prdList = prdService.listProductsByCtg(petCtgNo, prdCtgNo, 5, 8);
        model.addAttribute("prdList", prdList);
        return "market/goods";
    }
	
	// 상품 상세
    @RequestMapping("/market/product/detail/{prdNo}")
    public String productDetail(@PathVariable String prdNo, Model model, HttpSession session) {
        String memId = (String) session.getAttribute("mid");
        System.out.println("Session memId = " + memId); // 디버그 용도
            
        System.out.println("prdNo = " + prdNo);
        
        MemberVO memVo = orderService.getMemberInfo(memId); 
        ProductVO prd = prdService.detailViewProduct(prdNo);
        List<ReviewVO> reviews = prdService.getReviewsByProductNo(prdNo); // 리뷰 목록 조회
        
        model.addAttribute("memVo", memVo); 
        model.addAttribute("prd", prd);
        model.addAttribute("reviews", reviews); // 리뷰 목록 추가
        
        return "market/product_detail";
    }
    
    
	// 장바구니 추가
	@RequestMapping("/market/product/insertCart")
	public String insertCart(CartVO vo, HttpSession session, Model model) {
		String memId = (String) session.getAttribute("mid");
		//String memId = "abcd";  // 실제로는 session에서 가져와야 합니다.
	    vo.setMemId(memId);
	    MemberVO memVo = orderService.getMemberInfo(memId);
	    model.addAttribute("memVo", memVo);
	    
	    // (1) 동일 상품이 존재하는 지 확인
	    int count = cartService.checkPrdInCart(vo.getPrdNo(), memId);

	    if (count == 0) { 
	        cartService.insertCart(vo);  // 장바구니에 추가
	    } else { 
	        cartService.updateQtyInCart(vo);  // 수량만 업데이트
	    }

	    return "redirect:/market/cart";  // 장바구니 페이지로 리다이렉트
	}
	
	@RequestMapping(value = "/market/cart/delete", method = RequestMethod.POST)
	@ResponseBody
	public String deleteCart(@RequestBody ArrayList<String> chkArr) {
	    if (chkArr != null && !chkArr.isEmpty()) {
	        cartService.deleteCart(chkArr);
	        return "success";
	    }
	    return "fail";
	}
	
	//굿즈 상세-굿즈 만들기 기능 구현되면 추가해서 사용
	@RequestMapping("/market/goods/detail")
	public String goods_detail() {
		return "market/goods_detail";
	}
	
	// 장바구니
	@RequestMapping("/market/cart")
	public String cart(Model model,  HttpSession session) {
		String memId = (String) session.getAttribute("mid"); // 세션에서 로그인된 사용자 ID를 가져옴
	    if (memId == null) {
	        // 로그인이 안 되어 있을 경우, 로그인 페이지로 리다이렉트하거나 에러 처리
	        return "redirect:/login"; //
	    }
		
		
	    
		ArrayList<CartVO> cartList = cartService.cartList(memId);
		
		for (CartVO cart : cartList) {
	        ProductVO product = prdService.detailViewProduct(cart.getPrdNo());
	        cart.setProduct(product); // CartVO에 ProductVO 설정
	    }
		
		model.addAttribute("cartList", cartList);
		
		
		return "market/cart";
	}
	
	//즉시구매
	@RequestMapping(value = "/market/product/instantOrder", method = RequestMethod.POST)
	public String instantOrder(@RequestParam("prdNo") String prdNo, 
	                           @RequestParam("cartQty") int cartQty, 
	                           Model model, HttpSession session) {
	    String memId = (String) session.getAttribute("mid");
	    
	    List<MemberPointVO> point = orderService.getPointInfo(memId);
		
	    model.addAttribute("point", point);
	    
	    // 회원 정보 가져오기
	    MemberVO memVo = orderService.getMemberInfo(memId);
	    
	    // 상품 정보 가져오기
	    ProductVO prd = prdService.detailViewProduct(prdNo);
	    
	    // 수량을 설정한 후 주문 페이지로 데이터 전달
	    model.addAttribute("memVo", memVo);
	    model.addAttribute("prd", prd);
	    model.addAttribute("cartQty", cartQty); // 주문 수량 전달
	    
	    return "market/order_sub"; // 즉시 구매용 주문 페이지로 이동
	}
	
	//주문/결제
	@RequestMapping("/market/order/")
	//public String order(@PathVariable String prdNo, Model model, HttpSession session) {
	public String orderForm(Model model, HttpSession session) {
		String memId = (String) session.getAttribute("mid");
		//String memId="abcd";
		
		List<MemberPointVO> point = orderService.getPointInfo(memId);
		
	    model.addAttribute("point", point);

		
		MemberVO memVo = orderService.getMemberInfo(memId); 
		  
		ArrayList<CartVO> cartList = cartService.cartList(memId);
		
		for (CartVO cart : cartList) {
	        ProductVO product = prdService.detailViewProduct(cart.getPrdNo());
	        cart.setProduct(product); // CartVO에 ProductVO 설정
	    }
		
		model.addAttribute("cartList", cartList);
		model.addAttribute("memVo", memVo); 
		
		return "market/order";
	}
	
	// 주문 정보 전달
	@RequestMapping(value = "/market/order/complete", method = RequestMethod.POST)
	public String orderComplete(OrderInfoVO orderInfo, HttpSession session,
	                            @RequestParam("prdNo") List<String> prdNos,
	                            @RequestParam("ordQty") List<Integer> ordQtys,
	                            @RequestParam(value = "points", required = false, defaultValue = "0") int points,
	                            @RequestParam(value = "couponId", required = false) Integer couponId) { // 추가된 couponId 파라미터
	    String memId = (String) session.getAttribute("mid");
	    orderInfo.setMemId(memId);

	    // 기본 주문 정보 설정
	    orderInfo.setOrdDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
	    orderInfo.setOrdState(false); // 초기 상태 설정

	    // 1. order_info 저장
	    orderService.insertOrderInfo(orderInfo);

	    // 2. order_product 저장
	    int ordNo = orderService.getLastOrderNoByMemId(memId); // 방금 저장된 주문 번호 가져오기
	    for (int i = 0; i < prdNos.size(); i++) {
	        OrderProductVO orderProduct = new OrderProductVO();
	        orderProduct.setOrdNo(ordNo);
	        orderProduct.setPrdNo(prdNos.get(i));
	        orderProduct.setOrdQty(ordQtys.get(i));

	        orderService.insertOrderProduct(orderProduct);
	    }
	    
	    // 3. 주문된 품목을 장바구니에서 삭제
	    for (String prdNo : prdNos) {
	        cartService.deleteCartItem(memId, prdNo);
	    }

	    // 4. 포인트 사용 처리
	    if (points > 0) {
	        List<MemberPointVO> pointList = orderService.getPointInfo(memId);
	        int totalPoints = pointList.stream().mapToInt(MemberPointVO::getPoint_change).sum();

	        if (points <= totalPoints) {
	            MemberPointVO pointChange = new MemberPointVO();
	            pointChange.setMemId(memId);
	            pointChange.setPoint_change(-points);
	            pointChange.setReason("상품 구매");
	            orderService.insertPointChange(pointChange);
	        } else {
	            return "redirect:/market/order?error=invalid_points";
	        }
	    }

	    // 5. 쿠폰 사용 처리
	    if (couponId != null) {
	        orderService.deleteUserCoupon(memId, couponId); // 쿠폰 삭제
	    }

	    return "redirect:/market/order_summary";  // 주문 요약 페이지로 리다이렉트
	}

	
	//즉시구매완료_주문전달
	@RequestMapping(value = "/market/order/completeInstantOrder", method = RequestMethod.POST)
	public String completeInstantOrder(OrderInfoVO orderInfo, HttpSession session,
							            @RequestParam("prdNo") List<String> prdNos,
							            @RequestParam("ordQty") List<Integer> ordQtys,
							            @RequestParam(value = "points", required = false, defaultValue = "0") int points,
							            @RequestParam(value = "couponId", required = false) Integer couponId) { // 추가된 couponId 파라미터
			String memId = (String) session.getAttribute("mid");
			orderInfo.setMemId(memId);
			
			// 기본 주문 정보 설정
			orderInfo.setOrdDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
			orderInfo.setOrdState(false); // 초기 상태 설정
			
			// 1. order_info 저장
			orderService.insertOrderInfo(orderInfo);
			
			// 2. order_product 저장
			int ordNo = orderService.getLastOrderNoByMemId(memId); // 방금 저장된 주문 번호 가져오기
			for (int i = 0; i < prdNos.size(); i++) {
			OrderProductVO orderProduct = new OrderProductVO();
			orderProduct.setOrdNo(ordNo);
			orderProduct.setPrdNo(prdNos.get(i));
			orderProduct.setOrdQty(ordQtys.get(i));
			
			orderService.insertOrderProduct(orderProduct);
			}
			
			// 3. 주문된 품목을 장바구니에서 삭제
			for (String prdNo : prdNos) {
			cartService.deleteCartItem(memId, prdNo);
			}
			
			// 4. 포인트 사용 처리
			if (points > 0) {
			List<MemberPointVO> pointList = orderService.getPointInfo(memId);
			int totalPoints = pointList.stream().mapToInt(MemberPointVO::getPoint_change).sum();
			
			if (points <= totalPoints) {
			MemberPointVO pointChange = new MemberPointVO();
			pointChange.setMemId(memId);
			pointChange.setPoint_change(-points);
			pointChange.setReason("상품 구매");
			orderService.insertPointChange(pointChange);
			} else {
			return "redirect:/market/order?error=invalid_points";
			}
			}
			
			// 5. 쿠폰 사용 처리
			if (couponId != null) {
			orderService.deleteUserCoupon(memId, couponId); // 쿠폰 삭제
			}
			
			return "redirect:/market/order_summary";  // 주문 요약 페이지로 리다이렉트
	}
	
	//주문완료
	@RequestMapping("/market/order_summary")
	public String orderComplete(Model model, HttpSession session) {
	    String memId = (String) session.getAttribute("mid");
		//String memId = "abcd";
		
	    // memId로 가장 최근의 주문 정보 가져오기
	    OrderInfoVO ordVo = orderService.getLastOrderInfo(memId);

	    // 데이터 모델에 담기
	    model.addAttribute("ordVo", ordVo);

	    return "market/order_complete";
	}
	
	//주문내역
	@RequestMapping("/market/order/history")
	public String orderHistory(@RequestParam(value = "filter", required = false) String filter, Model model, HttpSession session) {
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

	    return "market/order_history";
	}
	
	
	//굿즈 제작
	@RequestMapping("/market/goods/produce")
	public String goods_produce() {
		return "market/goods_produce";
	}
	
	// 주문 취소 페이지로 이동
	@RequestMapping("/market/cancel/{ordNo}")
	public String orderCancel(@PathVariable int ordNo, Model model, HttpSession session) {
		String memId = (String) session.getAttribute("mid");

	    // 1. 해당 주문 정보 조회
	    OrderInfoVO ordInfo = orderService.getOrderInfo(ordNo);

	    // 2. 해당 주문 상품 정보 조회
	    List<OrderProductVO> orderProducts = orderService.getOrderProductsByOrderNo(ordNo);

	    // 3. 각 상품의 추가적인 정보 조회
	    for (OrderProductVO orderProduct : orderProducts) {
	        ProductVO product = orderService.getProductInfo(orderProduct.getPrdNo());
	        orderProduct.setProductDetails(product);
	    }

	    // 4. 모델에 조회한 주문 정보 및 상품 정보를 담기
	    model.addAttribute("ordInfo", ordInfo);
	    model.addAttribute("orderProducts", orderProducts);
	    model.addAttribute("ordNo", ordNo); // 주문 번호도 JSP로 전달

	    // 5. 취소된 주문 정보를 보여줄 페이지로 이동
	    return "market/order_cancel";
	}
	
	//주문취소 반영
	@RequestMapping(value = "/orderCancelSubmit", method = RequestMethod.POST)
	public String orderCancelSubmit(OrderCancelVO orderCancel, Model model, HttpSession session) {
	    String memId = (String) session.getAttribute("mid");
	    orderCancel.setMemId(memId);
	    
	    orderCancel.setOrdDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
	    
	    
	    // 1. order_cancel 테이블에 취소 데이터 추가
	    orderService.insertOrderCancel(orderCancel);
	    
	    // 2. order_info 테이블에서 해당 주문 삭제
	    orderService.deleteOrderInfo(orderCancel.getOrdNo());
	    
	    
	    // 3. 취소 완료 후 페이지로 이동
	    model.addAttribute("message", "주문이 취소되었습니다.");
	    return "redirect:/market/cancelComplete"; // 취소 완료 페이지로 리다이렉트
	}
	
	// 주문 취소 완료
	@RequestMapping("/market/cancelComplete")
	public String orderCancelComplete(Model model, HttpSession session) {
	    String memId = (String) session.getAttribute("mid");
	    List<OrderCancelVO> orderList;

	    orderList = orderService.getOrderCancel(memId);
	    
	    // 각 주문에 대한 상품 정보를 추가로 가져옴
	    for (OrderCancelVO order : orderList) {
	        List<OrderProductVO> products = orderService.getOrderProductsByOrderNo(order.getOrdNo());
	        for (OrderProductVO product : products) {
	            ProductVO productDetails = prdService.detailViewProduct(product.getPrdNo());
	            product.setProductDetails(productDetails);
	        }
	        order.setOrderProducts(products);
	    }

	    model.addAttribute("orderList", orderList);
	    return "market/order_cancel_complete";
	}
	
	//쿠폰 UI
	@RequestMapping("/market/couponUI")
	public String couponList(HttpSession session,Model model) {
		String memId = (String) session.getAttribute("mid");
		List<Map<String, Object>> coupon_list = mypageService.myCouponList(memId);
		model.addAttribute("coupon_list",coupon_list);
		return "market/couponUI";
	}
	
	
}