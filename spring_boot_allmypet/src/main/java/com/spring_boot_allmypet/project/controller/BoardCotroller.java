package com.spring_boot_allmypet.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_boot_allmypet.project.model.BoardVO;
import com.spring_boot_allmypet.project.service.BoardService;

@Controller
public class BoardCotroller {

	@Autowired
	BoardService boardService;
	
	@RequestMapping("/MainBoard")
	public String MainBoard(Model model) {
		ArrayList<BoardVO> boardList = boardService.listAllBoard();
		model.addAttribute("boardList", boardList);
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
