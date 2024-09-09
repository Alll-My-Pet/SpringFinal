package com.spring_boot_allmypet.project.controller.animal;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring_boot_allmypet.project.model.animal.AnimalCtgVO;
import com.spring_boot_allmypet.project.model.animal.BulletinBoardVO;
import com.spring_boot_allmypet.project.model.animal.MyTipBoardVO;
import com.spring_boot_allmypet.project.service.animal.AnimalService;
import com.spring_boot_allmypet.project.service.animal.BulletinService;
import com.spring_boot_allmypet.project.service.animal.MyTipService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AnimalController {
	@Autowired
	private AnimalService animalService;

	@Autowired
	private BulletinService bulletinService;

	@Autowired
	private MyTipService mytipService;

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

		return "animal/animal_index";
	}

	// 반려동물 작명소
	@RequestMapping("/petname")
	public String petNameGen() {
		return "animal/petname_form";
	}

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

	@RequestMapping("/bulletin/detailViewBoard/{postNo}")
	public String detailViewBoard(@PathVariable int postNo, Model model) {
		// 서비스에게 상품번호 전달하고, 해당 상품 데이터 받아오기
		BulletinBoardVO board = bulletinService.detailViewBoard(postNo);

		// 뷰 페이지에 출력하기 위해 Model 설정
		model.addAttribute("board", board);

		return "animal/bulletin_detail";
	}

	// 전체게시판 글 작성 폼 열기

	@RequestMapping("/animal/bulletin_form")
	public String boardWrite(HttpSession session, Model model) { // 세션에서 사용자 정보 가져오기
		String userId = (String) session.getAttribute("mid");

		// 사용자 정보가 있으면, 필요한 데이터를 모델에 추가
		model.addAttribute("userId", userId);

		return "animal/bulletin_form";
	}

	/*
	 * @RequestMapping("/animal/bulletin_form") public String boardWrite() {
	 * 
	 * return "animal/bulletin_form"; }
	 */
}
