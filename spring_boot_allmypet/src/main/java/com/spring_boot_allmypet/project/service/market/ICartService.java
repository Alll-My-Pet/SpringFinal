package com.spring_boot_allmypet.project.service.market;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot_allmypet.project.model.market.CartVO;
import com.spring_boot_allmypet.project.model.market.MemberVO;
import com.spring_boot_allmypet.project.model.market.OrderInfoVO;

public interface ICartService {
	public void insertCart(CartVO vo);	// 장바구니에 추가
//	public int checkPrdInCart(String prdNo, String memId);	// 동일 상품 존재 여부 확인 (반환값 : 동일 상품 개수)
	public void updateQtyInCart(CartVO vo);	// 동일 상품이 존재하면 수량만 변경
	public ArrayList<CartVO> cartList(String memId);	// 장바구니 조회 : 현재 회원의 장바구니 목록 반환
	public void deleteCart(ArrayList<String> chkArr);	// 장바구니에서 상품 삭제
	
	// 주문 처리 작업에 필요한 메소드 추가
	public MemberVO getMemberInfo(String memId);	// 주문서에 출력할 회원 정보 알아오기
	public void updateCart(CartVO vo);	// 장바구니 수정 
	public void insertOrderInfo(OrderInfoVO ordInfoVo);	// 주문 정보 저장
	public void insertOrderProduct(HashMap<String, Object> map);	// 주문 상품 정보 저장
	public void deleteCartAfterOrder(String memId);	// 주문 후 장바구니 내용 비우기(삭제)
}
