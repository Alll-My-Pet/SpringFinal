package com.spring_boot_allmypet.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.spring_boot_allmypet.project.service.BoardService;

@RestController
public class BoardRestController {
	
	@Autowired
	BoardService boardService;
}
