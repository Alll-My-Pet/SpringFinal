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
		ArrayList<BoardVO> noticeList = boardService.viewNotice();
		model.addAttribute("noticeList", noticeList);

		ArrayList<BoardVO> freeBoardList = boardService.index_freeBoard();
		model.addAttribute("freeBoardList", freeBoardList);

		// 자유게시판 실시간 인기글
		ArrayList<BoardVO> free_hotList = boardService.free_hotList();
		/* System.out.println(free_hotList); */
		model.addAttribute("free_hotList", free_hotList);
		
		return "index";
	}

	@RequestMapping("/member/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

}
