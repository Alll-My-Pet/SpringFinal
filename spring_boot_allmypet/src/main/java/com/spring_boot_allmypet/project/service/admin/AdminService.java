package com.spring_boot_allmypet.project.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.dao.admin.IAdminDAO;
import com.spring_boot_allmypet.project.model.market.ProductVO;

@Service
public class AdminService implements IAdminService {
	@Autowired
	@Qualifier("IAdminDAO")
	IAdminDAO dao;
	
	/*상품 번호 체크*/
	@Override
	public String prdNoCheck(String prdNo) {
		return dao.prdNoCheck(prdNo);
	}
	/*상품등록*/
	@Override
	public void prdInsert(ProductVO vo) {
		dao.prdInsert(vo);
	}
	/*상품 정보 출력*/
	@Override
	public ProductVO prdInfoLoad(String prdNo) {
		return dao.prdInfoLoad(prdNo);
	}
	/*상품 수정*/
	@Override
	public void prdModify(ProductVO vo) {
		dao.prdModify(vo);
	}
	@Override
	public void prdDelete(String prdNo) {
		dao.prdDelete(prdNo);
	}
}
