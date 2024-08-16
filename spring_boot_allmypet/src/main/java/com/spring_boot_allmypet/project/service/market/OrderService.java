package com.spring_boot_allmypet.project.service.market;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.dao.market.IOrderDAO;
import com.spring_boot_allmypet.project.model.market.MemberVO;
import com.spring_boot_allmypet.project.model.market.OrderInfoVO;
import com.spring_boot_allmypet.project.model.market.ProductVO;

@Service
public class OrderService implements IOrderService {
	@Autowired
	@Qualifier("IOrderDAO")
	IOrderDAO dao;

	@Override
	public MemberVO getMemberInfo(String memId) {
		return dao.getMemberInfo(memId);
	}
	
	@Override
	public ProductVO getProductInfo(String prdNo) {
		return dao.getProductInfo(prdNo);
	}
	
	@Override
	public void insertOrderInfo(OrderInfoVO ordInfoVo) {
		dao.insertOrderInfo(ordInfoVo);
	}

}
