package com.spring_boot_allmypet.project.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring_boot_allmypet.project.model.BoardPagingVO;
import com.spring_boot_allmypet.project.model.BoardVO;
import com.spring_boot_allmypet.project.model.FreeVO;
import com.spring_boot_allmypet.project.model.PromoteVO;
import com.spring_boot_allmypet.project.model.ProtectVO;
import com.spring_boot_allmypet.project.service.BoardService;
import com.spring_boot_allmypet.project.service.FreeService;
import com.spring_boot_allmypet.project.service.PromoteService;
import com.spring_boot_allmypet.project.service.ProtectService;
import com.spring_boot_allmypet.project.service.member.MemberService;

import jakarta.servlet.http.HttpSession;

@Controller
public class BoardCotroller {

	@Autowired
	BoardService boardService;
	@Autowired
	FreeService freeService;
	@Autowired
	ProtectService protectService;
	@Autowired
	PromoteService promoteService;
	@Autowired
	MemberService memberService;

	// ********************************전체게시판****************************************

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

	// 상세 조회
	@RequestMapping("/board/detailViewBoard/{postNo}")
	public String detailViewBoard(@PathVariable int postNo, Model model) {
		// 서비스에게 상품번호 전달하고, 해당 상품 데이터 받아오기
		BoardVO board = boardService.detailViewBoard(postNo);

		// 뷰 페이지에 출력하기 위해 Model 설정
		model.addAttribute("board", board);

		return "board/mainDetail";
	}

	// 게시글 검색

	@ResponseBody
	@RequestMapping("/board/boardSearch")
	public ArrayList<BoardVO> boardSearch(@RequestParam HashMap<String, String> param) {
		ArrayList<BoardVO> boardList = boardService.boardSearch(param);
		return boardList;
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

	// ********************************자유게시판****************************************
	@RequestMapping("/board/freeBoard")
	public String freeBoard(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) {

		// 페이징
		BoardPagingVO pageVo = new BoardPagingVO(pageNo, 10, boardService.paging());

		HashMap<String, Integer> map = new HashMap<>();
		map.put("startNo", (pageVo.getStartNo() - 1));
		map.put("endNo", pageVo.getEndNo());
		model.addAttribute("pageVo", pageVo);

		// 자유게시판 목록 보여줌
		ArrayList<BoardVO> freeBoardList = boardService.viewFreeboard(map);
		model.addAttribute("freeBoardList", freeBoardList);

		// 자유게시판 실시간 인기글
		ArrayList<BoardVO> free_hotList = boardService.free_hotList();
		System.out.println(free_hotList);
		model.addAttribute("free_hotList", free_hotList);

		return "board/freeBoard";
	}

	// 상세 페이지
	@RequestMapping("/board/FreeDetailView/{postNo}")
	public String FreeDetailView(@PathVariable int postNo, Model model) {
		// 서비스에게 상품번호 전달하고, 해당 상품 데이터 받아오기
		FreeVO Fboard = freeService.FreeDetailView(postNo);

		// 뷰 페이지에 출력하기 위해 Model 설정
		model.addAttribute("Fboard", Fboard);

		return "board/freeDetail";
	}

	// 검색
	@ResponseBody
	@RequestMapping("/board/FreeSearch")
	public ArrayList<FreeVO> FreeSearch(@RequestParam HashMap<String, String> param) {
		ArrayList<FreeVO> FreeboardList = freeService.FreeSearch(param);
		return FreeboardList;
	}

	// ********************************동물보호****************************************
	@RequestMapping("/board/ProtectBoardList")
	public String ProtectBoardList(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) {

		BoardPagingVO pageVo = new BoardPagingVO(pageNo, 10, protectService.ProtectPaging());

		HashMap<String, Integer> map = new HashMap<>();
		map.put("startNo", (pageVo.getStartNo() - 1));
		map.put("endNo", pageVo.getEndNo());

		ArrayList<ProtectVO> ProtectList = protectService.ProtectBoardList(map);
		model.addAttribute("ProtectList", ProtectList);
		
		ArrayList<ProtectVO> ReportList = protectService.ProtectReportList(map);
		model.addAttribute("ReportList", ReportList);
		
		model.addAttribute("pageVo", pageVo);

		return "board/petProtectBoard";
	}

		// 상세 페이지
		@RequestMapping("/board/ProtectDetailView/{postNo}")
		public String ProtectDetailView(@PathVariable int postNo, Model model,HttpSession session) {
			// 서비스에게 상품번호 전달하고, 해당 상품 데이터 받아오기
			ProtectVO protect = protectService.ProtectDetailView(postNo);
			String logInUser = (String) session.getAttribute("mid");

			// 뷰 페이지에 출력하기 위해 Model 설정
			model.addAttribute("protect", protect);
			model.addAttribute("logInUser", logInUser);

			return "board/protectDetail";
		}
		
		// 게시글 작성 폼 열기
		@RequestMapping("/board/protectWrite")
		public String protectWrite(HttpSession session, Model model) {
			// 세션에서 사용자 정보 가져오기
			String userId = (String) session.getAttribute("mid");

			// 사용자 정보가 있으면, 필요한 데이터를 모델에 추가
			model.addAttribute("userId", userId);

			return "board/protectWrite";
		}

		// 글 등록
		@RequestMapping("/ProtectInsert")
		public String ProtectInsert(ProtectVO vo, HttpSession session) {
			// 세션에서 로그인한 사용자 아이디 가져오기
			String logInUser = (String) session.getAttribute("mid");

			// 사용자 아이디 설정
			vo.setMemId(logInUser);

			protectService.ProtectInsert(vo);

			return "redirect:board/ProtectBoardList";
		}
		
		
		// 게시글 수정 화면 열기
		  @RequestMapping("/board/protectUpdateForm/{postNo}")
		  public String protectUpdateForm(@PathVariable int postNo, Model model) {
			  
			ProtectVO protectBoard = protectService.ProtectDetailView(postNo);
		    model.addAttribute("protectBoard", protectBoard);  
		    
		    return "board/protectUpdateView"; // 폼에 데이터 출력
		  }
		  
		  	// 수정된 정보 저장
		  @ResponseBody
		  @RequestMapping("/board/ProtectUpdate")
		  public String ProtectUpdate(ProtectVO vo, @RequestParam String memPwd, HttpSession session) {
		      String logInUser = (String) session.getAttribute("mid");

		      if (logInUser == null) {
		          return "fail"; // 로그인 되어 있지 않으면 실패 반환
		      }

		      // HashMap을 생성하여 loginCheck 메서드 호출
		      HashMap<String, Object> map = new HashMap<>();
		      map.put("memId", logInUser);
		      map.put("memPwd", memPwd);

		      String result = memberService.loginCheck(map);

		      if ("success".equals(result)) {
		          vo.setMemId(logInUser); // 게시글 작성자 ID 설정
		          protectService.ProtectUpdate(vo); // 게시글 수정 서비스 호출
		      }
		      
		      return result; 
		  }
		  
		  //삭제
		  @RequestMapping("/board/deleteProtect/{postNo}")
		  public String ProtectDelete(@PathVariable int postNo) {
		    protectService.ProtectDelete(postNo);  
		    return "redirect:/board/ProtectBoardList";
		  }
		  
		  @RequestMapping("/board/protectReport")
			public String protectReport() {
				return "board/protectReportWrite";
			}
		  
		  
		  // 신고하기 글
		  @PostMapping("/reportInsert")
		  public String reportInsert(@ModelAttribute ProtectVO vo ,
									@RequestParam("postImgFile") MultipartFile postImgFile,
		                              HttpSession session) throws IOException {
			  
			  
		      // 세션에서 로그인한 사용자 아이디 가져오기
		      String logInUser = (String) session.getAttribute("mid");

		      // 사용자 아이디 설정
				
				 vo.setMemId(logInUser);
				 
				 // 파일 업로드 처리 
				 if (!postImgFile.isEmpty()) { // 파일 저장 경로 설정 (시스템에 맞게 변경 필요) String
				 String uploadDir = "D:/finalWorkSpace/final/SpringFinal/uploads/";
				 
				 // 고유한 파일 이름 생성 
				 String originalFilename = postImgFile.getOriginalFilename();
				 String newFilename = System.currentTimeMillis() + "_" + originalFilename;
				 
				 // 저장할 디렉토리 경로가 존재하지 않으면 생성 
				 Path uploadPath = Paths.get(uploadDir); 
				 if(!Files.exists(uploadPath)) { 
					 Files.createDirectories(uploadPath); 
				 	}
				 
				 // 파일을 저장 디렉토리에 저장 
				 Path filePath = uploadPath.resolve(newFilename);
				 Files.copy(postImgFile.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
				  
				 // VO 객체에 이미지 파일 이름 설정 
				 vo.setPostImg(newFilename); 
				 
		  }
				 
				 // 게시글 저장 서비스 호출
			        protectService.reportInsert(vo);

			        // 저장 후 갤러리 페이지로 리다이렉트
			        return "redirect:/board/ProtectBoardList";
}
		
				 

		   
		  

		  	// 검색
			@ResponseBody
			@RequestMapping("/board/ProtectSearch")
			public ArrayList<ProtectVO> ProtectSearch(@RequestParam HashMap<String, String> param) {
				ArrayList<ProtectVO> ProtectList = protectService.ProtectSearch(param);
				return ProtectList;
			}
		

	// ********************************동물분양
	// 홍보****************************************
	@RequestMapping("/board/PromoteBoardList")
	public String PromoteBoardList(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) {

		BoardPagingVO pageVo = new BoardPagingVO(pageNo, 8, promoteService.promoteCount());

		HashMap<String, Integer> map = new HashMap<>();
		map.put("startNo", (pageVo.getStartNo() - 1));
		map.put("endNo", pageVo.getEndNo());

		ArrayList<PromoteVO> Promote = promoteService.promoteList(map);
		model.addAttribute("Promote", Promote);
		model.addAttribute("pageVo", pageVo);
		
		ArrayList<BoardVO> noticeList = boardService.viewNotice();
		List<BoardVO> limitedNoticeList = noticeList.subList(0, Math.min(noticeList.size(), 2));
		model.addAttribute("noticeList", limitedNoticeList);

		return "board/petPromoteBoard";
	}

	// 상세 페이지
	@RequestMapping("/board/promoteDetailView/{postNo}")
	public String promoteDetailView(@PathVariable int postNo, Model model, HttpSession session) {
		// 서비스에게 상품번호 전달하고, 해당 상품 데이터 받아오기
		PromoteVO promoteBoard = promoteService.promoteDetailView(postNo);
		String logInUser = (String) session.getAttribute("mid");

		// 뷰 페이지에 출력하기 위해 Model 설정
		model.addAttribute("promoteBoard", promoteBoard);
		model.addAttribute("logInUser", logInUser);

		return "board/promoteDetail";
	}

	// 글 등록
	@RequestMapping("/insertPromote")
	public String insertPromote(@ModelAttribute PromoteVO vo, 
								@RequestParam("postImgFile") MultipartFile postImgFile,
								HttpSession session) throws IOException{
		// 세션에서 로그인한 사용자 아이디 가져오기
		String logInUser = (String) session.getAttribute("mid");

		// 사용자 아이디 설정
		vo.setMemId(logInUser);
		
		
		 // 파일 업로드 처리 
		 if (!postImgFile.isEmpty()) { // 파일 저장 경로 설정 (시스템에 맞게 변경 필요) String
		 String uploadDir = "D:/finalWorkSpace/final/SpringFinal/uploads/";
		 
		 // 고유한 파일 이름 생성 
		 String originalFilename = postImgFile.getOriginalFilename();
		 String newFilename = System.currentTimeMillis() + "_" + originalFilename;
		 
		 // 저장할 디렉토리 경로가 존재하지 않으면 생성 
		 Path uploadPath = Paths.get(uploadDir); 
		 if(!Files.exists(uploadPath)) { 
			 Files.createDirectories(uploadPath); 
		 	}
		 
		 // 파일을 저장 디렉토리에 저장 
		 Path filePath = uploadPath.resolve(newFilename);
		 Files.copy(postImgFile.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);
		  
		 // VO 객체에 이미지 파일 이름 설정 
		 vo.setPostImg(newFilename); 
		
		 }
		promoteService.insertPromote(vo);

		return "redirect:board/PromoteBoardList";
	}

	// 게시글 작성 폼 열기
	@RequestMapping("/board/promoteWrite")
	public String promoteWrite(HttpSession session, Model model) {
		// 세션에서 사용자 정보 가져오기
		String userId = (String) session.getAttribute("mid");

		// 사용자 정보가 있으면, 필요한 데이터를 모델에 추가
		model.addAttribute("userId", userId);

		return "board/promoteWrite";
	}

	// 게시글 수정 화면 열기
	@RequestMapping("/board/promoteUpdateForm/{postNo}")
	public String promoteUpdateForm(@PathVariable int postNo, Model model) {

		PromoteVO promoteBoard = promoteService.promoteDetailView(postNo);
		model.addAttribute("promoteBoard", promoteBoard);

		return "board/promoteUpdateView"; // 폼에 데이터 출력
	}

	// 수정된 데이터 받아서 DB에 저장
	@ResponseBody
	@RequestMapping("/board/updatePromote")
	public String updatePromote(PromoteVO vo, @RequestParam String memPwd, HttpSession session) {
		String logInUser = (String) session.getAttribute("mid");

		if (logInUser == null) {
			return "fail"; // 로그인 되어 있지 않으면 실패 반환
		}
		
		

		// HashMap을 생성하여 loginCheck 메서드 호출
		HashMap<String, Object> map = new HashMap<>();
		map.put("memId", logInUser);
		map.put("memPwd", memPwd);

		String result = memberService.loginCheck(map);

		if ("success".equals(result)) {
			vo.setMemId(logInUser); // 게시글 작성자 ID 설정
			promoteService.updatePromote(vo); // 게시글 수정 서비스 호출
		}

		return result;
	}

	// 상품번호 전달 받아서 서비스에게 전달 -> dao -> Mapper -> DB에서 삭제
	// 삭제 후 전체 상품 정보 조회 화면으로 이동 : 포워딩
	@RequestMapping("/board/deletePromote/{postNo}")
	public String deletePromote(@PathVariable String postNo) {
		promoteService.deletePromote(postNo);
		return "redirect:/board/PromoteBoardList";
	}

	// 검색
	@ResponseBody
	@RequestMapping("/board/promoteSearch")
	public ArrayList<PromoteVO> promoteSearch(@RequestParam HashMap<String, String> param) {
		ArrayList<PromoteVO> PSearch = promoteService.promoteSearch(param);
		return PSearch;
	}

	/*
	 * *********************************공지
	 * 게시판****************************************
	 */
	@RequestMapping("/board/noticeBoard")
	public String noticeBoard(Model model) {

		// petCtgNo에 해당하는 양육팁 게시글 목록 조회
		ArrayList<BoardVO> noticeList = boardService.viewNotice();
		model.addAttribute("noticeList", noticeList);

		return "board/noticeBoard";
	}

	// ********************************베스트 팁****************************************
	@RequestMapping("/board/bestTipBoard")
	public String TipBoard() {
		return "board/bestTipBoard";
	}

	@RequestMapping("/board/bestTipDetail")
	public String TipDetail() {
		return "board/bestTipDetail";
	}

}