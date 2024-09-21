package com.spring_boot_allmypet.project.controller.usedItem;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsedController {
	@RequestMapping("/usedItem")
	public String usedItemHome() {
		return "usedItem/usedItemBoard";
	}
	
	@RequestMapping("/usedItemBuy")
	public String usedItemBuy() {
		return "usedItem/usedItemBuyBoard";
	}
}
