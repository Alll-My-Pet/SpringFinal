package com.spring_boot_allmypet.project.controller.gallery;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_boot_allmypet.project.model.gallery.GalleryVO;
import com.spring_boot_allmypet.project.service.gallery.GalleryService;

@Controller
public class GalleryController {

    @Autowired
    private GalleryService galleryService;
    
    // getPopularPostsInLastWeek를 적용하여 각 펫 ctg별로 조회수 높은 게시글 4개 출력
    @RequestMapping("/gallery")
    public String gallery(Model model) {
        Map<String, List<GalleryVO>> categorizedPosts = new HashMap<>();
        
        for (int petCtgNo = 1; petCtgNo <= 8; petCtgNo++) {
            List<GalleryVO> categoryPosts = galleryService.getTopPostsByPetCtgNoInLastWeek(String.valueOf(petCtgNo));
            categorizedPosts.put(String.valueOf(petCtgNo), categoryPosts);
        }
        
        model.addAttribute("categorizedPosts", categorizedPosts);
        return "gallery/gallery_best";
    }
    
    // petCtgNo를 받아와서 해당되는 게시물 출력
    @RequestMapping("/gallery/category/{petCtgNo}")
    public String gallery_category(@PathVariable("petCtgNo") String petCtgNo, Model model) {
        List<GalleryVO> categoryPosts = galleryService.getPostsByPetCtgNo(petCtgNo);
        model.addAttribute("categoryPosts", categoryPosts);
        return "gallery/gallery_category";
    }
}