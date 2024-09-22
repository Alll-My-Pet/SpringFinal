package com.spring_boot_allmypet.project.controller.meet;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring_boot_allmypet.project.model.meet.MeetVO;
import com.spring_boot_allmypet.project.service.meet.MeetService;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpSession;

@Controller
public class MeetController {

	@Autowired
    private MeetService meetService;

	@GetMapping("/meet")
	public String getMeetList(Model model,
            @RequestParam(value = "addressRegion", required = false) String addressRegion,
            @RequestParam(value = "addressDo", required = false) String addressDo,
            @RequestParam(value = "addressSiGunGu", required = false) String addressSiGunGu,
            @RequestParam(value = "petCtgNo", required = false) String petCtgNo,
            @RequestParam(value = "meetType", required = false) String meetType,
            @RequestParam(value = "searchKeyword", required = false) String searchKeyword,
            @RequestParam(value = "page", defaultValue = "1") int page) {

		Map<String, Object> filters = new HashMap<>();
		filters.put("addressRegion", addressRegion);
		filters.put("addressDo", addressDo);
		filters.put("addressSiGunGu", addressSiGunGu);
		filters.put("petCtgNo", petCtgNo);
		filters.put("meetType", meetType != null ? meetType.split(",") : null); // split 처리
		filters.put("searchKeyword", searchKeyword);
		
		// 페이지네이션 처리
		int meetPerPage = 10;
		filters.put("offset", (page - 1) * meetPerPage);
		filters.put("meetPerPage", meetPerPage);
		
		int totalMeetCount = meetService.getMeetCount(filters);
		int totalPages = (int) Math.ceil((double) totalMeetCount / meetPerPage);
		List<MeetVO> meetList = meetService.getMeetList(filters);
		
		model.addAttribute("meetList", meetList);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("filters", filters); // 필터 추가
		
		return "meet/meetBoard";
	}
    
}