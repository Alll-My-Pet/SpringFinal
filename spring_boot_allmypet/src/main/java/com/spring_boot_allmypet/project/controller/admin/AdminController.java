package com.spring_boot_allmypet.project.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring_boot_allmypet.project.model.market.ProductVO;
import com.spring_boot_allmypet.project.service.admin.AdminService;

@Controller
public class AdminController {
	@Autowired
	AdminService adminService;
	/*상품 추가 페이지*/
	@RequestMapping("/admin/product_insert_view")
	public String prdInsertView() {
		return "admin/prdInsertView";
	}
	
	/*상품 수정 페이지*/
	@RequestMapping("/admin/product_modify_view")
	public String prdModifyView() {
		return "admin/prdModifyView";
	}
			
	/*상품 추가*/
	@RequestMapping("/admin/prdInsert")
	public String prdInsert(ProductVO productVO,
			 				@RequestParam("prdImg") String prdImgFileName,
			 				@RequestParam("infoImg") String infoImgFileName) {
		productVO.setPrdImg(prdImgFileName);
	    productVO.setPrdDescript(infoImgFileName);
	    adminService.prdInsert(productVO);
	    return "redirect:/admin/product_insert_view"; 
	}
	/*상품 수정*/
	@RequestMapping("/admin/prdModify")
	public String prdModify(ProductVO productVO,
			@RequestParam("prdImg") String prdImgFileName,
			@RequestParam("infoImg") String infoImgFileName) {
		productVO.setPrdImg(prdImgFileName);
		productVO.setPrdDescript(infoImgFileName);
		adminService.prdModify(productVO);
		return "redirect:/admin/product_modify_view"; 
	}


}
