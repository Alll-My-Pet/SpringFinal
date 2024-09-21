package com.spring_boot_allmypet.project.controller.animal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/api")
public class PetNameController {

	// 반려동물 작명소
	@RequestMapping("/petname")
	public String petNameGen() {
		return "animal/petname_form";
	}
}
