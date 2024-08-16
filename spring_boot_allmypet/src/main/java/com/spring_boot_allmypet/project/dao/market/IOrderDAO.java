package com.spring_boot_allmypet.project.dao.market;

import com.spring_boot_allmypet.project.model.market.MemberVO;
import com.spring_boot_allmypet.project.model.market.OrderInfoVO;
import com.spring_boot_allmypet.project.model.market.ProductVO;

public interface IOrderDAO {
	public ProductVO getProductInfo(String prdNo);
	public void insertOrderInfo(OrderInfoVO ordInfoVo);
	public MemberVO getMemberInfo(String memId);
}
