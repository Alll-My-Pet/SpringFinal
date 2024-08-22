package com.spring_boot_allmypet.project.service.market;


import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.dao.market.IOrderDAO;
import com.spring_boot_allmypet.project.model.market.CartVO;
import com.spring_boot_allmypet.project.model.market.MemberVO;
import com.spring_boot_allmypet.project.model.market.OrderInfoVO;
import com.spring_boot_allmypet.project.model.market.OrderProductVO;
import com.spring_boot_allmypet.project.model.market.ProductVO;

@Service
public class OrderService implements IOrderService {
	@Autowired
	@Qualifier("IOrderDAO")
	IOrderDAO dao;
	
	@Autowired
	ProductService prdService;

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
	
	@Override
	public List<CartVO> getCartListByMemId(String memId) {
	    return dao.getCartListByMemId(memId);
	}
	
    @Override
    public OrderInfoVO getLastOrderInfo(String memId) {
        // DAO를 통해 memId의 최근 주문 정보를 가져옴
        return dao.getLastOrderInfo(memId);
    }

    @Override
    public List<OrderInfoVO> getOrderHistory(String memId) {
        // DAO를 통해 memId의 모든 주문 내역을 가져옴
        return dao.getOrderHistory(memId);
    }
    
    public void insertOrderProduct(OrderProductVO orderProduct) {
    	dao.insertOrderProduct(orderProduct);
    }

    public int getLastOrderNoByMemId(String memId) {
        return dao.getLastOrderNoByMemId(memId);
    }
    
    public List<OrderProductVO> getOrderProductsByOrderNo(int ordNo) {
        List<OrderProductVO> products = dao.getOrderProductsByOrderNo(ordNo);
        
        // 각 product의 prdNo를 통해 ProductVO에서 정보 가져오기
        for (OrderProductVO product : products) {
            ProductVO productDetails = prdService.detailViewProduct(product.getPrdNo());
            product.setProductDetails(productDetails);  // productDetails에 ProductVO 정보 세팅
        }
        
        return products;
    }
    
    public List<OrderInfoVO> getOrderHistoryByPeriod(String memId, LocalDate startDate) {
        return dao.getOrderHistoryByPeriod(memId, startDate);
    }
}
