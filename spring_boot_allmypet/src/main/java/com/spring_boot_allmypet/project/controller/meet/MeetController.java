package com.spring_boot_allmypet.project.controller.meet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class MeetController {

	//모임 홈
	@RequestMapping("/meet")
	public String market_home(HttpSession session) {
		return "meet/meetBoard";
	}
		
    
}