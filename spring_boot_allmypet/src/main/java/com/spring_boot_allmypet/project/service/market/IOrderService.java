package com.spring_boot_allmypet.project.service.market;

import com.spring_boot_allmypet.project.model.market.MemberVO;
import com.spring_boot_allmypet.project.model.market.OrderInfoVO;
import com.spring_boot_allmypet.project.model.market.ProductVO;

public interface IOrderService {
	public MemberVO getMemberInfo(String memId);
	public ProductVO getProductInfo(String prdNo);
	public void insertOrderInfo(OrderInfoVO ordInfoVo);
}
