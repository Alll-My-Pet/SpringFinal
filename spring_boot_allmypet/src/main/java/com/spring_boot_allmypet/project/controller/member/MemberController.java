package com.spring_boot_allmypet.project.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_boot_allmypet.project.model.member.MemberVO;
import com.spring_boot_allmypet.project.service.member.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memService;
	
	@RequestMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("/join")
	public String join() {
		return "member/join";
	}
	
	@RequestMapping("/forgotID")
	public String forgotID() {
		return "member/forgotID";
	}
	
	@RequestMapping("/forgotPW")
	public String forgotPW() {
		return "member/forgotPW";
	}
	
	@RequestMapping("/changePwd")
	public String changePW() {
		return "member/changePwd";
	}
	
	/* 회원가입 */
	@RequestMapping("/member/insertmem")
	public String insertMember(MemberVO vo) {
		memService.insertMember(vo);
		return "redirect:/login";
	}
	
}
