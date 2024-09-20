package com.spring_boot_allmypet.project.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.spring_boot_allmypet.project.model.market.ProductVO;
import com.spring_boot_allmypet.project.service.admin.AdminService;

@RestController
public class AdminRestController {
	@Autowired
	AdminService adminService;
	
	@RequestMapping("/admin/prdNoCheck")
	public String idCheck(@RequestParam("prdNo") String prdNo) {
		String prdNo_result=adminService.prdNoCheck(prdNo);
		String result="fail";
		if(prdNo_result == null){ result ="success"; };
		return result;
	}
	/*상품 추가*/
	@RequestMapping("/admin/prdImg_insert")
    public Map<String, Object> uploadPrdImage(@RequestParam("prdImg") MultipartFile prdImg,
    							  @RequestParam("infoImg") MultipartFile infoImg) {
		Map<String, Object> result = new HashMap<>();
        if (!prdImg.isEmpty()) {
            try {
                //String uploadDir = "/usr/local/allmypet/member_images/";
                String uploadDir = "C:/test/";
                String fileName = System.currentTimeMillis() + "_" + prdImg.getOriginalFilename();
                File destFile = new File(uploadDir, fileName);
                
                // 디렉토리가 없으면 생성
                if (!destFile.getParentFile().exists()) {
                    destFile.getParentFile().mkdirs();
                }
                prdImg.transferTo(destFile);
                result.put("prdImg", fileName);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if (!infoImg.isEmpty()) {
            try {
                //String uploadDir = "/usr/local/allmypet/member_images/";
                String uploadDir = "C:/test/";
                String fileName = System.currentTimeMillis() + "_" + infoImg.getOriginalFilename();
                File destFile = new File(uploadDir, fileName);
                
                // 디렉토리가 없으면 생성
                if (!destFile.getParentFile().exists()) {
                    destFile.getParentFile().mkdirs();
                }
                infoImg.transferTo(destFile);
                result.put("infoImg", fileName);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        
        return result;
    }
	/*상품 정보 불러오기*/
	@RequestMapping("/admin/prdInfoLoad")
	public ProductVO prdInfoLoad(@RequestParam("prdNo") String prdNo) {
	    ProductVO prdInfo = adminService.prdInfoLoad(prdNo);
	    if (prdInfo == null) {
	        return null;  // 해당 상품 번호가 없으면 null 반환
	    }
	    return prdInfo;
	}
	/*상품 삭제*/
	@RequestMapping("/admin/prdDelete")
	public String prdDelete(@RequestParam("prdNo") String prdNo) {
		adminService.prdDelete(prdNo);
		return "success";
	}	

}
