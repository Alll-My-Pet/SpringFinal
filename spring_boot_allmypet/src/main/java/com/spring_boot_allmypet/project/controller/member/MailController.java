package com.spring_boot_allmypet.project.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot_allmypet.project.service.member.MailService;

@Controller
public class MailController {
	
	@Autowired
    MailService mailService;

    @ResponseBody
    @PostMapping("/mail")
    public String MailSend(@RequestParam("memEmail") String memEmail){

        int number = mailService.sendMail(memEmail);

        return String.valueOf(number);
    }
    
    @ResponseBody
    @PostMapping("/checkNum")
    public String checkNum(@RequestParam("memEmail") String memEmail, @RequestParam("code") String code) {
        boolean isValid = mailService.checkNum(memEmail, code);

        if (isValid) {
            return "{\"success\": true, \"message\": \"인증번호가 확인되었습니다.\"}";
        } else {
            return "{\"success\": false, \"message\": \"인증번호가 일치하지 않습니다.\"}";
        }
    }


}
