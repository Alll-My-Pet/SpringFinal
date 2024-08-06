package com.spring_boot_allmypet.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MyPageControlloer {
	@RequestMapping("/mypage")
	public String mpMain() {
		return "mypage/myPageMain";
	}
}
