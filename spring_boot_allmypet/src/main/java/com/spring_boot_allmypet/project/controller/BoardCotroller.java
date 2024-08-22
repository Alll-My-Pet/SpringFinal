package com.spring_boot_allmypet.project.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot_allmypet.project.model.BoardPagingVO;
import com.spring_boot_allmypet.project.model.BoardVO;
import com.spring_boot_allmypet.project.service.BoardService;

@Controller
public class BoardCotroller {

	@Autowired
	BoardService boardService;
	
	
	/*
	 * @RequestMapping("/MainBoard") public String MainBoard(Model model) {
	 * ArrayList<BoardVO> boardList = boardService.listAllBoard();
	 * model.addAttribute("boardList", boardList); return "/Board/MainBoard"; }
	 */
	
	@RequestMapping("/board/listAllBoard")
	public String  listAllProduct(@RequestParam(required=false, defaultValue="1") int pageNo,
				                                Model model) {
		
		BoardPagingVO pageVo = new BoardPagingVO(pageNo, 10, boardService.getBoardCount());
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNo", (pageVo.getStartNo()-1));
		map.put("endNo", pageVo.getEndNo());
		
		System.out.println(pageVo.getStartNo());
		System.out.println(pageVo.getEndNo());
		
		ArrayList<BoardVO> boardList = boardService.listAllBoard(map);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageVo", pageVo);
		
		return "board/mainBoard";
	}
	
	
	@RequestMapping("/Board/Protect")
	public String Protect() {
		return "board/petProtectBoard";
	}
	
	@RequestMapping("/Board/FreeBoard")
	public String FreeBoard() {
		return "board/freeBoard";
	}
	
	@RequestMapping("/Board/PromoteBoard")
	public String PromoteBoard() {
		return "board/petPromoteBoard";
	}
	
	@RequestMapping("/Board/NoticeBoard")
	public String NoticeBoard() {
		return "board/noticeBoard";
	}
	
	@RequestMapping("/Board/FreeBoardDetail")
	public String FreeBoardDetail() {
		return "board/freeBoardDetail";
	}
	
	@RequestMapping("/Board/MainDetail")
	public String MainDetail() {
		return "board/mainDetail";
	}
	
	@RequestMapping("/Board/TipBoard")
	public String TipBoard() {
		return "board/bestTipBoard";
	}
	
	@RequestMapping("/Board/TipDetail")
	public String TipDetail() {
		return "board/bestTipDetail";
	}
	
	
	
	
	// 게시글 검색
	@ResponseBody
	@RequestMapping("/board/boardSearch") 
	public ArrayList<BoardVO> boardSearch(@RequestParam HashMap<String, Object> param) {
	  ArrayList<BoardVO> boardList = boardService.boardSearch(param);
	   return boardList;
	}
	
	
	
	
	// 상세 조회
	   @RequestMapping("/board/detailViewBoard/{postNo}")
	   public String detailViewBoard(@PathVariable int postNo, Model model) {
	     // 서비스에게 상품번호 전달하고, 해당 상품 데이터 받아오기
	     BoardVO board = boardService.detailViewBoard(postNo);
	     
	     // 뷰 페이지에 출력하기 위해 Model 설정
	     model.addAttribute("board", board);
	     
	     return "board/mainDetail";
	   }
	   

}
