package com.spring_boot_allmypet.project.controller.animal;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_boot_allmypet.project.model.animal.AnimalCtgVO;
import com.spring_boot_allmypet.project.model.animal.BulletinBoardVO;
import com.spring_boot_allmypet.project.service.animal.AnimalService;
import com.spring_boot_allmypet.project.service.animal.BulletinService;

@Controller
public class AnimalController {
	@Autowired
	private AnimalService animalService;
	
	@Autowired
    private BulletinService bulletinService;
	
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
        
		return "animal/animal_index";
	}
	
	
}
