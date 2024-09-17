package com.spring_boot_allmypet.project.service.admin;

import com.spring_boot_allmypet.project.model.market.ProductVO;

public interface IAdminService {
	/*상품 번호 체크*/
	public String prdNoCheck(String prdNo);
	/*상품 등록*/
	public void prdInsert(ProductVO vo);
}
