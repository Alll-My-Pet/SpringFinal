package com.spring_boot_allmypet.project.dao.market;

import com.spring_boot_allmypet.project.model.market.MemberVO;
import com.spring_boot_allmypet.project.model.market.OrderCancelVO;
import com.spring_boot_allmypet.project.model.market.OrderInfoVO;
import com.spring_boot_allmypet.project.model.market.OrderProductVO;
import com.spring_boot_allmypet.project.model.market.ProductVO;
import com.spring_boot_allmypet.project.model.market.ReviewVO;
import com.spring_boot_allmypet.project.model.member.MemberPointVO;
import com.spring_boot_allmypet.project.model.market.CartVO;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

public interface IOrderDAO {
	public ProductVO getProductInfo(String prdNo);
	public void insertOrderInfo(OrderInfoVO ordInfoVo);
	public MemberVO getMemberInfo(String memId);
	public List<CartVO> getCartListByMemId(String memId);
	
    // 최근 주문 정보를 가져오는 메서드
    OrderInfoVO getLastOrderInfo(String memId);

    // 사용자의 모든 주문 내역을 가져오는 메서드
    List<OrderInfoVO> getOrderHistory(String memId);
    
    public void insertOrderProduct(OrderProductVO orderProduct);
    public int getLastOrderNoByMemId(String memId);
	public List<OrderProductVO> getOrderProductsByOrderNo(int ordNo);
	public List<OrderInfoVO> getOrderHistoryByPeriod(String memId, LocalDate startDate);
	public OrderProductVO getOrderProductForCancel(int ordNo, String prdNo);
	public void insertOrderCancel(OrderCancelVO orderCancel);
	
    public int getPointInfo(String memId);
    public void insertPointChange(MemberPointVO point);
    public void deleteUserCoupon(Map<String, Object> params);
	public void deleteOrderInfo(int ordNo);
	public void deleteOrderProduct(int ordNo);
	public List<OrderCancelVO> getOrderCancel(String memId);
	public OrderInfoVO getOrderInfo(int ordNo);
    public void insertReview(ReviewVO review);
}
