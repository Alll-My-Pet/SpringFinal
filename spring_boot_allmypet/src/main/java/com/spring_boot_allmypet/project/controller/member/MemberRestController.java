package com.spring_boot_allmypet.project.controller.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring_boot_allmypet.project.service.member.MemberService;

import jakarta.servlet.http.HttpSession;

@RestController
public class MemberRestController {
	@Autowired
	MemberService memService;
	
	@RequestMapping("/member/loggingIn")
	public String login(@RequestParam HashMap<String, Object>param,
				HttpSession session) {
		int mem_position = memService.memPosition((String)param.get("memId"));
		String result = memService.loginCheck(param); 
		
		if(result.equals("success")) {
			session.setAttribute("mid", param.get("memId"));
			session.setAttribute("mpos", mem_position);	
		}
		
		return result;
	}
	
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
	public String NNCheck(@RequestParam("memNickName") String memNickName) {
		String memNickName_result=memService.memNNCheck(memNickName);
		String result="fail";
		
		if(memNickName_result == null) {
			result ="success";
		}
		
		return result;
	}
	
	@RequestMapping(value ="/member/findId", method = RequestMethod.POST)
	 public String findId(@RequestParam HashMap<String, Object> param) {
        String memId = memService.findId(param);
        return memId;
    }
	
	@RequestMapping(value ="/member/findPwd", method = RequestMethod.POST)
	 public String findPwd(@RequestParam HashMap<String, Object> param) {
       String memPwd = memService.findPwd(param);
       return memPwd;
   }
}