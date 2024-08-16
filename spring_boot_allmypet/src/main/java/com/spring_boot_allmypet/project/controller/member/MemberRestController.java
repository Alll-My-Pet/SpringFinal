package com.spring_boot_allmypet.project.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring_boot_allmypet.project.service.member.MemberService;

@RestController
public class MemberRestController {
	@Autowired
	MemberService memService;
	
	@RequestMapping("/member/idCheck")
	public String idCheck(@RequestParam("memId") String memId) {
		String memId_result=memService.memIdCheck(memId);
		String result="fail";
		
		if(memId_result == null) {
			result ="success";
		}
		
		return result;
	}
	
	@RequestMapping("/member/nnCheck")
	public String NNCheck(@RequestParam("memNN") String memNN) {
		String memNN_result=memService.memNNCheck(memNN);
		String result="fail";
		
		if(memNN_result == null) {
			result ="success";
		}
		
		return result;
	}
	
}
