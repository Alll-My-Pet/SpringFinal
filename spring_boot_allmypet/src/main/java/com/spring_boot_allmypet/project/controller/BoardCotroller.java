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
import com.spring_boot_allmypet.project.model.animal.MyTipBoardVO;
import com.spring_boot_allmypet.project.model.FreeVO;
import com.spring_boot_allmypet.project.model.ProtectVO;
import com.spring_boot_allmypet.project.service.BoardService;
import com.spring_boot_allmypet.project.service.FreeService;
import com.spring_boot_allmypet.project.service.ProtectService;

import jakarta.servlet.http.HttpSession;

@Controller
public class BoardCotroller {

	@Autowired
	BoardService boardService;
	@Autowired
	FreeService freeService;
	@Autowired
	ProtectService protectService;

	/*
	 * @RequestMapping("/MainBoard") public String MainBoard(Model model) {
	 * ArrayList<BoardVO> boardList = boardService.listAllBoard();
	 * model.addAttribute("boardList", boardList); return "/Board/MainBoard"; }
	 */

	// 전체게시판
	@RequestMapping("/board/listAllBoard")
	public String listAllBoard(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) {

		BoardPagingVO pageVo = new BoardPagingVO(pageNo, 10, boardService.getBoardCount());

		HashMap<String, Integer> map = new HashMap<>();
		map.put("startNo", (pageVo.getStartNo() - 1));
		map.put("endNo", pageVo.getEndNo());

		ArrayList<BoardVO> boardList = boardService.listAllBoard(map);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageVo", pageVo);

		// 인기글 조회
		ArrayList<BoardVO> hotTopics = boardService.listHotTopics();
		model.addAttribute("hotTopics", hotTopics);

		return "board/mainBoard";
	}

	@RequestMapping("/board/mainDetail")
	public String MainDetail() {
		return "board/mainDetail";
	}

	// 자유게시판
	@RequestMapping("/board/FreeBoardList")
	public String FreeBoardList(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) {

		BoardPagingVO pageVo = new BoardPagingVO(pageNo, 10, freeService.FreePaging());

		HashMap<String, Integer> map = new HashMap<>();
		map.put("startNo", (pageVo.getStartNo() - 1));
		map.put("endNo", pageVo.getEndNo());

		ArrayList<FreeVO> FreeboardList = freeService.FreeBoardList(map);
		model.addAttribute("FreeboardList", FreeboardList);
		model.addAttribute("pageVo", pageVo);

		// 인기글 조회
		ArrayList<FreeVO> FreeHotTopics = freeService.FreeHotTopics();
		model.addAttribute("FreeHotTopics", FreeHotTopics);

		return "board/freeBoard";
	}

	@RequestMapping("/board/freeDetail")
	public String freeDetail() {
		return "board/freeDetail";
	}

	// 동물보호
	@RequestMapping("/board/ProtectBoardList")
	public String ProtectBoardList(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) {

		BoardPagingVO pageVo = new BoardPagingVO(pageNo, 10, protectService.ProtectPaging());

		HashMap<String, Integer> map = new HashMap<>();
		map.put("startNo", (pageVo.getStartNo() - 1));
		map.put("endNo", pageVo.getEndNo());

		ArrayList<ProtectVO> ProtectList = protectService.ProtectBoardList(map);
		model.addAttribute("ProtectList", ProtectList);
		model.addAttribute("pageVo", pageVo);

		return "board/petProtectBoard";
	}

	@RequestMapping("/board/protectDetail")
	public String protectDetail() {
		return "board/protectDetail";
	}

	// 분양홍보
	@RequestMapping("/board/promoteBoard")
	public String PromoteBoard() {
		return "board/petPromoteBoard";
	}

	@RequestMapping("/board/promoteWrite")
	public String promoteWrite() {
		return "board/promoteWrite";
	}

	/* 공지 게시판 */
	@RequestMapping("/board/noticeBoard")
	public String noticeBoard(Model model) {

		// petCtgNo에 해당하는 양육팁 게시글 목록 조회
		ArrayList<BoardVO> noticeList = boardService.viewNotice();
		model.addAttribute("noticeList", noticeList);

		return "board/noticeBoard";
	}

	// 베스트 팁
	@RequestMapping("/board/bestTipBoard")
	public String TipBoard() {
		return "board/bestTipBoard";
	}

	@RequestMapping("/board/bestTipDetail")
	public String TipDetail() {
		return "board/bestTipDetail";
	}

	/*
	 * @RequestMapping("/Board/MainBoardTextForm") public String MainBoardText() {
	 * return "board/mainBoardText"; }
	 */

	// 게시글 검색

	@ResponseBody
	@RequestMapping("/board/boardSearch")
	public ArrayList<BoardVO> boardSearch(@RequestParam HashMap<String, String> param) {
		ArrayList<BoardVO> boardList = boardService.boardSearch(param);
		return boardList;
	}

	@ResponseBody
	@RequestMapping("/board/FreeSearch")
	public ArrayList<FreeVO> FreeSearch(@RequestParam HashMap<String, String> param) {
		ArrayList<FreeVO> FreeboardList = freeService.FreeSearch(param);
		return FreeboardList;
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

	@RequestMapping("/board/FreeDetailView/{postNo}")
	public String FreeDetailView(@PathVariable int postNo, Model model) {
		// 서비스에게 상품번호 전달하고, 해당 상품 데이터 받아오기
		FreeVO Fboard = freeService.FreeDetailView(postNo);

		// 뷰 페이지에 출력하기 위해 Model 설정
		model.addAttribute("Fboard", Fboard);

		return "board/freeDetail";
	}

	// 글 등록
	@RequestMapping("/board/insertBoard")
	public String insertBoard(BoardVO vo, HttpSession session) {
		// 세션에서 로그인한 사용자 아이디 가져오기
		String logInUser = (String) session.getAttribute("mid");

		// BoardVO 객체에 사용자 아이디 설정
		vo.setMemId(logInUser);

		boardService.insertBoard(vo);

		return "redirect:board/listAllBoard";
	}

	// 게시글 작성 폼 열기
	@RequestMapping("/Board/MainBoardText")
	public String boardWrite(HttpSession session, Model model) {
		// 세션에서 사용자 정보 가져오기
		String userId = (String) session.getAttribute("mid");

		// 사용자 정보가 있으면, 필요한 데이터를 모델에 추가
		model.addAttribute("userId", userId);

		return "board/mainBoardText";
	}
}
