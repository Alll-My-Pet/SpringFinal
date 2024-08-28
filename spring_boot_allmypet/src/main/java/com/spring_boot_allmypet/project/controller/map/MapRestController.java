package com.spring_boot_allmypet.project.controller.map;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpSession;

import com.spring_boot_allmypet.project.service.map.PetMapService;
import com.spring_boot_allmypet.project.service.market.OrderService;
import com.spring_boot_allmypet.project.model.map.PetMapVO;
import com.spring_boot_allmypet.project.model.market.MemberVO;


@RestController
public class MapRestController {
    @Autowired
    PetMapService petservice;

    @RequestMapping("/petmap")
    public ArrayList<PetMapVO> getStationsByBounds(
    		 @RequestParam double swLat, 
    	     @RequestParam double swLng, 
    	     @RequestParam double neLat, 
    	     @RequestParam double neLng,
    	     @RequestParam(required = false) String category
    	    ) {
        
        // 경계 정보를 담은 Map 객체 생성
    	HashMap<String, Object> bounds = new HashMap<>();
        bounds.put("swLat", swLat);
        bounds.put("swLng", swLng);
        bounds.put("neLat", neLat);
        bounds.put("neLng", neLng);
        bounds.put("category", category);

        // 경계 내의 시설들 조회
        ArrayList<PetMapVO> petList = petservice.getStationsByBounds(bounds);
        return petList;
    }
}