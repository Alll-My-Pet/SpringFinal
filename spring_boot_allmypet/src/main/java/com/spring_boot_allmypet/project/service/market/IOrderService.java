package com.spring_boot_allmypet.project.service.market;

import java.util.List;

import com.spring_boot_allmypet.project.model.market.CartVO;
import com.spring_boot_allmypet.project.model.market.MemberVO;
import com.spring_boot_allmypet.project.model.market.OrderInfoVO;
import com.spring_boot_allmypet.project.model.market.ProductVO;
import com.spring_boot_allmypet.project.model.member.MemberPointVO;

public interface IOrderService {
	public MemberVO getMemberInfo(String memId);
	public ProductVO getProductInfo(String prdNo);
	public void insertOrderInfo(OrderInfoVO ordInfoVo);
	public List<CartVO> getCartListByMemId(String memId);
	
    // 최근 주문 정보를 가져오는 메서드
	public OrderInfoVO getLastOrderInfo(String memId);

    // 사용자의 모든 주문 내역을 가져오는 메서드
	public List<OrderInfoVO> getOrderHistory(String memId);
	
	public List<MemberPointVO> getPointInfo(String memId);
    public void insertPointChange(MemberPointVO point);
	
}
