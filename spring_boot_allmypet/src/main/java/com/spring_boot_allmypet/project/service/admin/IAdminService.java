package com.spring_boot_allmypet.project.service.admin;

import com.spring_boot_allmypet.project.model.market.ProductVO;

public interface IAdminService {
	/*상품 번호 체크*/
	public String prdNoCheck(String prdNo);
	/*상품 등록*/
	public void prdInsert(ProductVO vo);
	/*상품 정보 출력*/
	public ProductVO prdInfoLoad(String prdNo);
	/*상품 수정*/
	public void prdModify(ProductVO vo);
	/*상품 삭제*/
	public void prdDelete(String prdNo);
}
