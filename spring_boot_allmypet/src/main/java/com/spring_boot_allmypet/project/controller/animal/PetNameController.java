package com.spring_boot_allmypet.project.controller.animal;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot_allmypet.project.model.animal.PetNameVO;
import com.spring_boot_allmypet.project.service.animal.PetNameService;

@Controller
@RequestMapping("/api")
public class PetNameController {
	@Autowired
	private PetNameService petNameService;
	
	// 반려동물 작명소
	@RequestMapping("/petname")
	public String petNameGen() {
		return "animal/petname_form";
	}
	
    // 색깔 그룹 조회 API
    @GetMapping("/colors")
    @ResponseBody // JSON 응답을 원할 경우에만 필요
    public String getColorGroup(@RequestParam String specificColor) {
        return petNameService.getColorGroup(specificColor);
    }

    // 이름 후보 조회 API
    @GetMapping("/petnames")
    @ResponseBody // JSON 응답을 원할 경우에만 필요
    public List<PetNameVO> getPetNames(@RequestParam String colorGroup, @RequestParam String petGender) {
        return petNameService.getPetNames(colorGroup, petGender);
    }
}
