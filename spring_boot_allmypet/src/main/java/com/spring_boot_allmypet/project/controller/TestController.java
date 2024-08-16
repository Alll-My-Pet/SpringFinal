package com.spring_boot_allmypet.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("/join")
	public String joinForm() {
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

}
