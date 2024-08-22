package com.spring_boot_allmypet.project.service.market;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.dao.market.ICartDAO;
import com.spring_boot_allmypet.project.model.market.CartVO;
import com.spring_boot_allmypet.project.model.market.MemberVO;
import com.spring_boot_allmypet.project.model.market.OrderInfoVO;

@Service
public class CartService implements ICartService {
	@Autowired
	@Qualifier("ICartDAO")
	ICartDAO dao;
	
	@Override
	public void insertCart(CartVO vo) {
		dao.insertCart(vo);
	}

	/*
	 * @Override public int checkPrdInCart(String prdNo, String memId) { // 장바구니에 동일
	 * 상품이 존재하는지 여부 확인 // 존재하면 mapper로부터 동일 상품 개수 반환 받아서 컨트롤러에게 반환 // mapper에게는
	 * 매개변수가 2개인 경우에는 HashMap으로 전달해야 하기 때문에 // prdNo와 memId를 HashMap에 넣음
	 * HashMap<String, Object> map = new HashMap<String, Object>(); map.put("prdNo",
	 * prdNo); map.put("memId", memId);
	 * 
	 * return dao.checkPrdInCart(map); }
	 */

	@Override
	public void updateQtyInCart(CartVO vo) {
		dao.updateQtyInCart(vo);
	}

	@Override
	public ArrayList<CartVO> cartList(String memId) {		
		return dao.cartList(memId);
	}

	@Override
	public void deleteCart(ArrayList<String> chkArr) {
		dao.deleteCart(chkArr);
	}
	
	@Override
	public void deleteCartAfterOrder(String memId) {
		// TODO Auto-generated method stub
		
	}
	
	/*
	 * @Override public MemberVO getMemberInfo(String memId) { return
	 * dao.getMemberInfo(memId); }
	 */	
	@Override
	public void insertOrderInfo(OrderInfoVO ordInfoVo) {
		// (1) 주문 정보 저장 (order_info 테이블에 저장)
		dao.insertOrderInfo(ordInfoVo);
		
		// (2) 주문 상품 내용 저장 (order_product 테이블에 저장
		// mapper에서 cart 테이블에서 order_product 테이블로 저장
		// cart에서 가져오기 위해 memId와 주문번호(ordNo) 필요
		// memId와 ordNofmf HashMap에 넣어서 mapper에게 전달
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ordNo", ordInfoVo.getOrdNo());
		map.put("memId", ordInfoVo.getMemId());
		dao.insertOrderProduct(map); // mapper에게 전달
		
		// (3) 주문 완료 후 장바구니 비우기 : memId 전달 
		dao.deleteCartAfterOrder(ordInfoVo.getMemId());
	}
	
	@Override
	public void insertOrderProduct(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void updateCart(CartVO vo) {
		dao.updateCart(vo);		
	}

	@Override
	public MemberVO getMemberInfo(String memId) {
		// TODO Auto-generated method stub
		return null;
	}



}
