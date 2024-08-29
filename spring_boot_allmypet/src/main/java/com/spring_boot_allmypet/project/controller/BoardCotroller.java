package com.spring_boot_allmypet.project.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot_allmypet.project.model.BoardPagingVO;
import com.spring_boot_allmypet.project.model.BoardVO;
import com.spring_boot_allmypet.project.service.BoardService;

import jakarta.servlet.http.HttpSession;

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
    public String listAllBoard(@RequestParam(required=false, defaultValue="1") int pageNo,
                               Model model) {

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
	
	
	@RequestMapping("/board/protect")
	public String Protect() {
		return "board/petProtectBoard";
	}
	
	@RequestMapping("/board/freeBoard")
	public String FreeBoard() {
		return "board/mainBoard";
	}
	
	@RequestMapping("/board/promoteBoard")
	public String PromoteBoard() {
		return "board/petPromoteBoard";
	}
	
	@RequestMapping("/board/noticeBoard")
	public String NoticeBoard() {
		return "board/noticeBoard";
	}
	
	@RequestMapping("/board/freeBoardDetail")
	public String FreeBoardDetail() {
		return "board/freeBoardDetail";
	}
	
	@RequestMapping("/board/mainDetail")
	public String MainDetail() {
		return "board/mainDetail";
	}
	
	@RequestMapping("/board/bestTipBoard")
	public String TipBoard() {
		return "board/bestTipBoard";
	}
	
	@RequestMapping("/board/bestTipDetail")
	public String TipDetail() {
		return "board/bestTipDetail";
	}
	
	@RequestMapping("/board/freeDetail")
	public String freeDetail() {
		return "board/freeDetail";
	}
	
	@RequestMapping("/board/promoteWrite")
	public String promoteWrite() {
		return "board/promoteWrite";
	}
	
	@RequestMapping("/board/protectDetail")
	public String protectDetail() {
		return "board/protectDetail";
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
	
	
	
	
	// 상세 조회
	   @RequestMapping("/board/detailViewBoard/{postNo}")
	   public String detailViewBoard(@PathVariable int postNo, Model model) {
	     // 서비스에게 상품번호 전달하고, 해당 상품 데이터 받아오기
	     BoardVO board = boardService.detailViewBoard(postNo);
	     
	     // 뷰 페이지에 출력하기 위해 Model 설정
	     model.addAttribute("board", board);
	     
	     return "board/mainDetail";
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
