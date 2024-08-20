package com.spring_boot_allmypet.project.controller.mypage;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;

@RestController
public class MyPageRestController {
	@Autowired
    private ServletContext servletContext;

    @PostMapping("/mypage/uploadImage")
    public String uploadImage(HttpSession session,@RequestParam("image") MultipartFile image) {
        if (!image.isEmpty()) {
            try {
                // 웹 애플리케이션 루트 경로 기준으로 파일 저장 경로 설정
                String uploadDir = servletContext.getRealPath("/uploads/");
                String fileName = System.currentTimeMillis() + "_" + image.getOriginalFilename();
                File destFile = new File(uploadDir, fileName);
                
                // 디렉토리가 없으면 생성
                if (!destFile.getParentFile().exists()) {
                    destFile.getParentFile().mkdirs();
                }

                image.transferTo(destFile);

                return fileName;
            } catch (IOException e) {
                e.printStackTrace();
                return "{\"error\": \"Failed to upload file\"}";
            }
        } else {
            return "{\"error\": \"No file uploaded\"}";
        }
    }
}
