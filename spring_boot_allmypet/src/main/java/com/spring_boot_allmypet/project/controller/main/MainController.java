package com.spring_boot_allmypet.project.controller.main;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_boot_allmypet.project.model.BoardVO;
import com.spring_boot_allmypet.project.service.BoardService;

import jakarta.servlet.http.HttpSession;

@Controller
public class MainController {
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/")
	public String index(Model model) {
		// petCtgNo에 해당하는 양육팁 게시글 목록 조회
		ArrayList<BoardVO> noticeList = boardService.viewNotice();
		model.addAttribute("noticeList", noticeList);
		return "index";
	}

	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

}
