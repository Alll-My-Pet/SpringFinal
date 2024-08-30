package com.spring_boot_allmypet.project.controller.map;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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


@Controller
public class MapController {
    @Autowired
    PetMapService petservice;

    @Autowired
    OrderService orderService;

    @RequestMapping("/map")
    public String map() {
        return "map/petmap";
    }


}