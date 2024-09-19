package com.spring_boot_allmypet.project.controller.ai;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring_boot_allmypet.project.model.ai.GreenEyeVO;
import com.spring_boot_allmypet.project.service.ai.GreenEyeService;

@Controller
public class AIController {
    private GreenEyeService greenService;

    @Autowired
    public AIController(GreenEyeService greenService) {
        this.greenService = greenService;
    }

    // 파일 업로드를 처리하고 GreenEye 서비스로 파일 경로를 전달
    @PostMapping("/uploadImage")
    public String uploadImage(@RequestParam("file") MultipartFile file, Model model) {
        String uploadDir = "C:/springWorkspace/ai/"; // 임시 업로드 경로
        String galleryDir = "C:/springWorkspace/final/SpringFinal/spring_boot_allmypet/src/main/resources/static/image/gallery/"; // 실제 저장될 경로

        String fileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
        String filePath = uploadDir + fileName;
        String galleryFilePath = galleryDir + fileName;

        try {
            // 파일을 임시 경로에 저장
            File dest = new File(filePath);
            file.transferTo(dest);

            // GreenEye 서비스 호출 (파일 경로 전달)
            GreenEyeVO greenVo = greenService.greenEye(filePath);
            model.addAttribute("greenVo", greenVo);

            // 판정이 완료된 이미지를 gallery 경로로 복사
            Path sourcePath = Paths.get(filePath);
            Path destinationPath = Paths.get(galleryFilePath);
            Files.copy(sourcePath, destinationPath, java.nio.file.StandardCopyOption.REPLACE_EXISTING);

            // 복사된 파일 경로를 JSP로 전달
            model.addAttribute("postImg", "/image/gallery/" + fileName);
        } catch (Exception e) {
            e.printStackTrace();
            return "error"; // 에러 처리
        }

        // JSP 페이지를 렌더링하여 팝업창에 표시
        return "ai/greenEyeResultView";
    }
}
