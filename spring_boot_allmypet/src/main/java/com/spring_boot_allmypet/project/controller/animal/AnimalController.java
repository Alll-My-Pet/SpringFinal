package com.spring_boot_allmypet.project.controller.animal;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_boot_allmypet.project.model.animal.AnimalCtgVO;
import com.spring_boot_allmypet.project.model.animal.BulletinBoardVO;
import com.spring_boot_allmypet.project.model.animal.MyTipBoardVO;
import com.spring_boot_allmypet.project.service.animal.AnimalService;
import com.spring_boot_allmypet.project.service.animal.BulletinService;
import com.spring_boot_allmypet.project.service.animal.MyTipService;

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
		ArrayList<BulletinBoardVO> bulletinList = bulletinService.getBulletinList(petCtgNo);
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

		// petCtgNo에 해당하는 전체 게시글 목록 조회
		ArrayList<BulletinBoardVO> bulletinList = bulletinService.getBulletinList(petCtgNo);
		model.addAttribute("bulletinList", bulletinList);

		return "animal/bulletinBoard";
	}

}
