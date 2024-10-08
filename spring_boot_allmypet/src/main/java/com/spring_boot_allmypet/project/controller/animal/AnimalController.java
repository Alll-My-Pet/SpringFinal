package com.spring_boot_allmypet.project.controller.animal;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring_boot_allmypet.project.model.animal.AnimalCtgVO;
import com.spring_boot_allmypet.project.model.animal.BulletinBoardVO;
import com.spring_boot_allmypet.project.model.animal.MyTipBoardVO;
import com.spring_boot_allmypet.project.model.gallery.GalleryVO;
import com.spring_boot_allmypet.project.service.animal.AnimalService;
import com.spring_boot_allmypet.project.service.animal.BulletinService;
import com.spring_boot_allmypet.project.service.animal.MyTipService;
import com.spring_boot_allmypet.project.service.gallery.GalleryService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AnimalController {
	@Autowired
	private AnimalService animalService;

	@Autowired
	private BulletinService bulletinService;

	@Autowired
	private MyTipService mytipService;
	
	@Autowired
    private GalleryService galleryService;

	// 동물별 커뮤니티 메인페이지
	@RequestMapping("/animal_home/{petCtgNo}")
	public String animalMain(@PathVariable String petCtgNo, Model model) {
		System.out.println("aa: " + petCtgNo);

		// petCtgNo에 해당하는 카테고리 리스트 조회
		ArrayList<AnimalCtgVO> categories = animalService.ctgListPet(petCtgNo);

		// 리스트에서 첫 번째 항목의 petCtgName을 모델에 추가
		if (!categories.isEmpty()) {
			model.addAttribute("petCtgName", categories.get(0).getPetCtgName());
		} else {
			model.addAttribute("petCtgName", "카테고리없음.");
		}

		// petCtgNo에 해당하는 게시글 목록 조회
		ArrayList<BulletinBoardVO> bulletinList = bulletinService.showBulletin(petCtgNo);
		model.addAttribute("bulletinList", bulletinList);

		// petCtgNo에 해당하는 양육팁 게시글 목록 조회
		ArrayList<MyTipBoardVO> myTipList = mytipService.getTipList(petCtgNo);
		model.addAttribute("myTipList", myTipList);
		
		
		
		  List<GalleryVO> galleryImg = galleryService.getPostsByPetCtgNo(petCtgNo);
		  System.out.println("Animal Controller출력: " + petCtgNo);
		  model.addAttribute("galleryImg", galleryImg);
		 
		 

		return "animal/animal_index";
	}


	// *************************** 양육팁 게시판 ***************************
	// 동물별 양육팁 게시판
	@RequestMapping("/animal_home/{petCtgNo}/tip")
	public String tipBoard(@PathVariable String petCtgNo, Model model) {

		System.out.println("현재 동물 카테고리: " + petCtgNo);

		// petCtgNo에 해당하는 카테고리 리스트 조회
		ArrayList<AnimalCtgVO> categories = animalService.ctgListPet(petCtgNo);

		// 리스트에서 첫 번째 항목의 petCtgName을 모델에 추가
		if (!categories.isEmpty()) {
			model.addAttribute("petCtgName", categories.get(0).getPetCtgName());
		} else {
			model.addAttribute("petCtgName", "카테고리없음.");
		}

		// petCtgNo에 해당하는 양육팁 게시글 목록 조회
		ArrayList<MyTipBoardVO> myTipList = mytipService.getTipList(petCtgNo);
		model.addAttribute("myTipList", myTipList);

		// petCtgNo에 해당하는 상위 3개의 좋아요 수 기준 양육팁 게시글 목록 조회
		ArrayList<MyTipBoardVO> topLikedTips = mytipService.getTop3List(petCtgNo);
		model.addAttribute("topLikedTips", topLikedTips);

		return "animal/tipBoard";
	}

	// 양육 팁 상세게시글
	@RequestMapping("/tip/{petCtgNo}/detailTipBoard/{postNo}")
	public String detailTipBoard(@PathVariable String petCtgNo, @PathVariable int postNo, Model model) {
		// 서비스에게 상품번호 전달하고, 해당 상품 데이터 받아오기
		MyTipBoardVO board = mytipService.detailViewBoard(postNo);
		// petCtgNo에 해당하는 카테고리 리스트 조회
		ArrayList<AnimalCtgVO> categories = animalService.ctgListPet(petCtgNo);

		// 리스트에서 첫 번째 항목의 petCtgName을 모델에 추가
		if (!categories.isEmpty()) {
			model.addAttribute("petCtgName", categories.get(0).getPetCtgName());
		} else {
			model.addAttribute("petCtgName", "카테고리없음.");
		}
		// 뷰 페이지에 출력하기 위해 Model 설정
		model.addAttribute("board", board);

		return "animal/tipBoard_detail";
	}

	// 양육팁 글 작성 폼
	@RequestMapping("/animal_home/{petCtgNo}/tipBoard_form")
	public String boardTipWrite(@PathVariable String petCtgNo, HttpSession session, Model model) {

		// petCtgNo에 해당하는 카테고리 리스트 조회
		ArrayList<AnimalCtgVO> categories = animalService.ctgListPet(petCtgNo);

		// 리스트에서 첫 번째 항목의 petCtgName을 모델에 추가
		if (!categories.isEmpty()) {
			model.addAttribute("petCtgName", categories.get(0).getPetCtgName());
		} else {
			model.addAttribute("petCtgName", "카테고리없음.");
		}

		String userId = (String) session.getAttribute("mid");

		// 사용자 정보가 있으면, 필요한 데이터를 모델에 추가
		model.addAttribute("userId", userId);

		return "animal/tipBoard_form";
	}

	// 양육팁 글 등록
	@RequestMapping("/animal_home/{petCtgNo}/inserTip")
	public String inserTip(@PathVariable String petCtgNo, Model model, MyTipBoardVO vo, HttpSession session) {
		// petCtgNo에 해당하는 카테고리 리스트 조회
		ArrayList<AnimalCtgVO> categories = animalService.ctgListPet(petCtgNo);

		// 리스트에서 첫 번째 항목의 petCtgName을 모델에 추가
		if (!categories.isEmpty()) {
			model.addAttribute("petCtgName", categories.get(0).getPetCtgName());
		} else {
			model.addAttribute("petCtgName", "카테고리없음.");
		}

		// 세션에서 로그인한 사용자 아이디 가져오기
		String logInUser = (String) session.getAttribute("mid");

		// 사용자 정보 세팅
		vo.setMemId(logInUser);

		MultipartFile postImg = vo.getPostImg();
		// 이미지 파일 처리
		if (postImg != null && !postImg.isEmpty()) {

			System.out.println("업로드된 파일 이름: " + postImg.getOriginalFilename());
			System.out.println("파일 크기: " + postImg.getSize());

			String contentType = postImg.getContentType();
			List<String> validTypes = Arrays.asList("image/jpeg", "image/png", "image/gif");
			if (!validTypes.contains(contentType)) {
				model.addAttribute("error", "유효하지 않은 파일 형식입니다.");
				return "redirect:/animal_home/" + petCtgNo + "/insertBoard";
			}

			if (postImg.getSize() > 50 * 1024 * 1024) {
				model.addAttribute("error", "파일 크기가 50MB를 초과합니다.");
				return "redirect:/animal_home/" + petCtgNo + "/insertBoard";
			}

			try {
				byte[] imageBytes = postImg.getBytes();
				System.out.println("이미지 바이트 크기: " + imageBytes.length);
				vo.setPostImgBytes(imageBytes);
			} catch (IOException e) {
				System.out.println("파일 읽기 실패: " + e.getMessage());
				e.printStackTrace();
			}
		} else {
			System.out.println("업로드된 파일이 없습니다.");
		}
		System.out.println("이미지 바이트 출력:" + vo.getPostImgBytes());
		mytipService.insertPost(vo);

		return "redirect:/animal_home/{petCtgNo}/tip";
	}

	// *************************** 전체게시판 ***************************
	// 동물별 전체게시판
	@RequestMapping("/animal_home/{petCtgNo}/bulletin")
	public String bulletinBoard(@PathVariable String petCtgNo, Model model) {
		// petCtgNo에 해당하는 카테고리 리스트 조회
		ArrayList<AnimalCtgVO> categories = animalService.ctgListPet(petCtgNo);

		// 리스트에서 첫 번째 항목의 petCtgName을 모델에 추가
		if (!categories.isEmpty()) {
			model.addAttribute("petCtgName", categories.get(0).getPetCtgName());
		} else {
			model.addAttribute("petCtgName", "카테고리없음.");
		}

		// petCtgNo에 해당하는 게시글 목록 조회
		ArrayList<BulletinBoardVO> bulletinList = bulletinService.showBulletin(petCtgNo);
		model.addAttribute("bulletinList", bulletinList);

		// 실시간 인기글
		ArrayList<BulletinBoardVO> hotList = bulletinService.hotList(petCtgNo);
		System.out.println("hotList: " + hotList);
		model.addAttribute("hotList", hotList);

		return "animal/bulletinBoard";
	}

	@RequestMapping(value = "/animal_home/bulletin/filtered")
	public String getBulletinList(@RequestParam HashMap<String, Object> map, Model model) {
		// petCtgNo에 해당하는 전체 게시글 목록
		// 조회 return
		System.out.println("petCtgNo: " + map.get("petCtgNo"));
		System.out.println("isFiltered: " + map.get("isFiltered"));
		System.out.println("headerNo: " + map.get("headerNo"));

		/*
		 * ArrayList<BulletinBoardVO> bulletinList =
		 * bulletinService.getBulletinList(map); model.addAttribute("bulletinList",
		 * bulletinList);
		 */

		// 필터링 기능 추가 / 필터링에서 구분 -> 전체 게시글 반환
		ArrayList<BulletinBoardVO> bulletinList = null;
		if (map.get("headerNo").toString().equals("")) {
			bulletinList = bulletinService.showBulletin(map.get("petCtgNo").toString());
		} else {
			bulletinList = bulletinService.getBulletinList(map);
		}
		model.addAttribute("bulletinList", bulletinList);

		return "animal/filteringResult";
	}

	// 전체게시판 상세 조회

	@RequestMapping("/bulletin/{petCtgNo}/detailViewBoard/{postNo}")
	public String detailViewBoard(@PathVariable String petCtgNo, @PathVariable int postNo, Model model) {
		// 서비스에게 상품번호 전달하고, 해당 상품 데이터 받아오기
		BulletinBoardVO board = bulletinService.detailViewBoard(postNo);
		// petCtgNo에 해당하는 카테고리 리스트 조회
		ArrayList<AnimalCtgVO> categories = animalService.ctgListPet(petCtgNo);

		// 리스트에서 첫 번째 항목의 petCtgName을 모델에 추가
		if (!categories.isEmpty()) {
			model.addAttribute("petCtgName", categories.get(0).getPetCtgName());
		} else {
			model.addAttribute("petCtgName", "카테고리없음.");
		}
		// 뷰 페이지에 출력하기 위해 Model 설정
		model.addAttribute("board", board);

		return "animal/bulletin_detail";
	}

	// 좋아요 업데이트
	@PostMapping("/bulletin/like")
	@ResponseBody
	public ResponseEntity<String> updateLike(@RequestBody Map<String, Integer> request) {
		int postNo = request.get("postNo");
		int postLike = request.get("postLike");

		bulletinService.updateLikeCount(postNo, postLike);

		return ResponseEntity.ok("좋아요 수 업데이트 완료");
	}

	// 전체게시판 글 작성 폼 열기

	@RequestMapping("/animal_home/{petCtgNo}/bulletin_form")
	public String boardWrite(@PathVariable String petCtgNo, HttpSession session, Model model) {

		// petCtgNo에 해당하는 카테고리 리스트 조회
		ArrayList<AnimalCtgVO> categories = animalService.ctgListPet(petCtgNo);

		// 리스트에서 첫 번째 항목의 petCtgName을 모델에 추가
		if (!categories.isEmpty()) {
			model.addAttribute("petCtgName", categories.get(0).getPetCtgName());
		} else {
			model.addAttribute("petCtgName", "카테고리없음.");
		}

		String userId = (String) session.getAttribute("mid");

		// 사용자 정보가 있으면, 필요한 데이터를 모델에 추가
		model.addAttribute("userId", userId);

		return "animal/bulletin_form";
	}

	// 전체게시판 글 등록
	@RequestMapping("/animal_home/{petCtgNo}/insertBoard")
	public String insertBoard(@PathVariable String petCtgNo, Model model, BulletinBoardVO vo, HttpSession session) {
		// petCtgNo에 해당하는 카테고리 리스트 조회
		ArrayList<AnimalCtgVO> categories = animalService.ctgListPet(petCtgNo);

		// 리스트에서 첫 번째 항목의 petCtgName을 모델에 추가
		if (!categories.isEmpty()) {
			model.addAttribute("petCtgName", categories.get(0).getPetCtgName());
		} else {
			model.addAttribute("petCtgName", "카테고리없음.");
		}

		// 세션에서 로그인한 사용자 아이디 가져오기
		String logInUser = (String) session.getAttribute("mid");

		// 사용자 정보 세팅
		vo.setMemId(logInUser);

		// 이미지 파일 처리
		/*
		 * if (!postImg.isEmpty()) { try { // 파일을 바이트 배열로 변환 byte[] imageBytes =
		 * postImg.getBytes(); vo.setPostImg(imageBytes); // BulletinBoardVO에 이미지 데이터 추가
		 * } catch (IOException e) { System.out.println("파일 읽기 실패: " + e.getMessage());
		 * e.printStackTrace(); } } else { System.out.println("업로드된 파일이 없습니다."); }
		 */
		MultipartFile postImg = vo.getPostImg();
		// 이미지 파일 처리
		if (postImg != null && !postImg.isEmpty()) {

			System.out.println("업로드된 파일 이름: " + postImg.getOriginalFilename());
			System.out.println("파일 크기: " + postImg.getSize());

			String contentType = postImg.getContentType();
			List<String> validTypes = Arrays.asList("image/jpeg", "image/png", "image/gif");
			if (!validTypes.contains(contentType)) {
				model.addAttribute("error", "유효하지 않은 파일 형식입니다.");
				return "redirect:/animal_home/" + petCtgNo + "/insertBoard";
			}

			if (postImg.getSize() > 50 * 1024 * 1024) {
				model.addAttribute("error", "파일 크기가 50MB를 초과합니다.");
				return "redirect:/animal_home/" + petCtgNo + "/insertBoard";
			}

			try {
				byte[] imageBytes = postImg.getBytes();
				System.out.println("이미지 바이트 크기: " + imageBytes.length);
				vo.setPostImgBytes(imageBytes);
			} catch (IOException e) {
				System.out.println("파일 읽기 실패: " + e.getMessage());
				e.printStackTrace();
			}
		} else {
			System.out.println("업로드된 파일이 없습니다.");
		}
		System.out.println("이미지 바이트 출력:" + vo.getPostImgBytes());
		bulletinService.insertPost(vo);

		return "redirect:/animal_home/{petCtgNo}/bulletin";
	}

	// ********************************베스트 팁****************************************
	@RequestMapping("/board/bestTipBoard")
	public String TipBoard(Model model) {
		// 강아지 베스트 양육팁
		ArrayList<MyTipBoardVO> dogTips = mytipService.bestTips("1");
		model.addAttribute("dogTips", dogTips);
		// 고양이 베스트 양육팁
		ArrayList<MyTipBoardVO> catTips = mytipService.bestTips("2");
		model.addAttribute("catTips", catTips);
		// 기타포유류 베스트 양육팁
		ArrayList<MyTipBoardVO> otherTips = mytipService.bestTips("3");
		model.addAttribute("otherTips", otherTips);
		// 파충류/양서류 베스트 양육팁
		ArrayList<MyTipBoardVO> repTips = mytipService.bestTips("4");
		model.addAttribute("repTips", repTips);
		// 어류 베스트 양육팁
		ArrayList<MyTipBoardVO> fishTips = mytipService.bestTips("5");
		model.addAttribute("fishTips", fishTips);
		// 조류 베스트 양육팁
		ArrayList<MyTipBoardVO> birdTips = mytipService.bestTips("6");
		model.addAttribute("birdTips", birdTips);
		// 설치류 베스트 양육팁
		ArrayList<MyTipBoardVO> rodTips = mytipService.bestTips("7");
		model.addAttribute("rodTips", rodTips);
		// 절지류/곤충류 베스트 양육팁
		ArrayList<MyTipBoardVO> insectTips = mytipService.bestTips("8");
		model.addAttribute("insectTips", insectTips);

		return "board/bestTipBoard";
	}

	@RequestMapping("/board/bestTipDetail")
	public String TipDetail() {
		return "board/bestTipDetail";
	}

}
