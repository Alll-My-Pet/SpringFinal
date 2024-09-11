package com.spring_boot_allmypet.project.service.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class MailService {
	
	@Autowired
    private JavaMailSender javaMailSender;
	
    private String senderEmail= "jeanjinjeen51@gmail.com";
    private static int number; // 랜덤 인증 코드
    
    // 인증번호 저장할 맵
    private Map<String, String> codes = new HashMap<>();

	// 랜덤으로 숫자 생성
    public static void createNumber() {
        number = (int)(Math.random() * (90000)) + 100000; //(int) Math.random() * (최댓값-최소값+1) + 최소값
    }

    public MimeMessage CreateMail(String memEmail) {
        createNumber(); // 인증 코드 생성
        MimeMessage message = javaMailSender.createMimeMessage();

        try {
            message.setFrom(senderEmail);
            message.setRecipients(MimeMessage.RecipientType.TO, memEmail);
            message.setSubject("이메일 인증");
            String body = "";
            body += "<h3>" + "요청하신 인증 번호입니다." + "</h3>";
            body += "<h1>" + number + "</h1>";
            body += "<h3>" + "감사합니다." + "</h3>";
            message.setText(body,"UTF-8", "html");
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return message;
    }
    
    // 메일 전송
    public int sendMail(String memEmail) {
        MimeMessage message = CreateMail(memEmail);
        javaMailSender.send(message);
        
        // 인증 코드 저장
        codes.put(memEmail, String.valueOf(number));
        
        // 인증 코드 반환
        return number;
    }
    
    // 인증번호 확인
    public boolean checkNum(String memEmail, String code) {
        String storedCode = codes.get(memEmail);
        return storedCode != null && storedCode.equals(code);
    }
}