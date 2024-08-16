package com.spring_boot_allmypet.project.controller.animal;

import org.springframework.web.bind.annotation.RequestMapping;

public class AnimalController {
	// 동물별 커뮤니티 메인 페이지 열기
	@RequestMapping("/animal_home")
	public String animalMain() {
		return "animal/animal_index"; // 뷰 페이지 이름
	}
}
