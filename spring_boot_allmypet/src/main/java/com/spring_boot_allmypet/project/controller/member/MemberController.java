package com.spring_boot_allmypet.project.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
<<<<<<< HEAD
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring_boot_allmypet.project.model.member.MemVO;
import com.spring_boot_allmypet.project.service.member.IMemService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
	
	@Autowired
	private IMemService memService;
=======
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_boot_allmypet.project.model.member.MemberVO;
import com.spring_boot_allmypet.project.service.member.MemberService;

@Controller
<<<<<<<< HEAD:spring_boot_allmypet/src/main/java/com/spring_boot_allmypet/project/controller/TestController.java
public class TestController {
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}

}
========
public class MemberController {
	@Autowired
	MemberService memService;
	
	@RequestMapping("/login")
	public String login() {
		return "member/login";
	}
>>>>>>> develop
	
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
	
<<<<<<< HEAD
	@RequestMapping("/changePW")
	public String changePW() {
		return "member/changePW";
	}

}
=======
	@RequestMapping("/test")
	public String test() {
		return "member/test";
	}
	
	@RequestMapping("/test2")
	public String test2() {
		return "member/test2";
	}
	
	@RequestMapping("/test3")
	public String test3() {
		return "member/test3";
	}
	
	/* 회원가입 */
	@RequestMapping("/member/insertmem")
	public String insertMember(MemberVO vo) {
		memService.insertMember(vo);
		return "redirect:/login";
	}
}
>>>>>>>> develop:spring_boot_allmypet/src/main/java/com/spring_boot_allmypet/project/controller/member/MemberController.java
>>>>>>> develop
