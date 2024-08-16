package com.spring_boot_allmypet.project.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
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
	
	@RequestMapping("/changePW")
	public String changePW() {
		return "member/changePW";
	}

}
