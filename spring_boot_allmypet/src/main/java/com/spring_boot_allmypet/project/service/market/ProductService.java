package com.spring_boot_allmypet.project.service.market;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.dao.market.IProductDAO;
import com.spring_boot_allmypet.project.model.market.ProductVO;
import com.spring_boot_allmypet.project.model.market.ReviewVO;


@Service
public class ProductService implements IProductService {
	// DI 설정
	// MyBatis인 경우에는 @Autowired만 사용하지 않고 @Quarlifier와 같이 사용
	@Autowired
	@Qualifier("IProductDAO")
	IProductDAO dao;

	@Override
	public ArrayList<ProductVO> listAllProduct() {
		return dao.listAllProduct(); // DAO에게서 받은 결과값을 Controller에게 반환
	}

	@Override
	public void insertProduct(ProductVO vo) {
		dao.insertProduct(vo);
	}

	@Override
	public void updateProduct(ProductVO vo) {
		dao.updateProduct(vo);	
	}

	@Override
	public void deleteProduct(String prdNo) {
		dao.deleteProduct(prdNo);
	}

	@Override
	public ProductVO detailViewProduct(String prdNo) {		
		return dao.detailViewProduct(prdNo);
	}
	
	@Override
	public String prdNoCheck(String prdNo) {		
		return dao.prdNoCheck(prdNo);
	}

	@Override
	public ArrayList<ProductVO> productSearch(HashMap<String, Object> map) {		
		return dao.productSearch(map);
	}
	
	@Override
	public ArrayList<ProductVO> ctgListProduct(String ctgId) {		
		return dao.ctgListProduct(ctgId);
	}
	
	public ArrayList<ProductVO> listProductsByCtgRange(int startCtg, int endCtg) {
	    HashMap<String, Integer> ctgRange = new HashMap<>();
	    ctgRange.put("startCtg", startCtg);
	    ctgRange.put("endCtg", endCtg);
	    return dao.listProductsByCtgRange(ctgRange);
	}
	
	@Override
	public ArrayList<ProductVO> listProductsByCtg(String petCtgNo, List<String> prdCtgNoList, int startRange, int endRange) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("petCtgNo", petCtgNo);
	    params.put("prdCtgNoList", prdCtgNoList);
	    params.put("startRange", startRange);
	    params.put("endRange", endRange);

	    return dao.listProductsByCtg(params);
	}
	
	 @Override
    public List<ReviewVO> getReviewsByProductNo(String prdNo) {
        return dao.getReviewsByProductNo(prdNo);
    }
	 
	
	
}
