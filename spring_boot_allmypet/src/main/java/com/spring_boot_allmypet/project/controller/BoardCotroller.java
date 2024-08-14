package com.spring_boot_allmypet.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardCotroller {

	@RequestMapping("/MainBoard")
	public String MainBoard() {
		return "/Board/MainBoard";
	}
	
	@RequestMapping("/Protect")
	public String Protect() {
		return "/Board/PetProtectBoard";
	}
	
	@RequestMapping("/FreeBoard")
	public String FreeBoard() {
		return "/Board/FreeBoard";
	}
	
	@RequestMapping("/PromoteBoard")
	public String PromoteBoard() {
		return "/Board/PetPromoteBoard";
	}
	
	@RequestMapping("/NoticeBoard")
	public String NoticeBoard() {
		return "/Board/NoticeBoard";
	}

}
