package com.spring_boot_allmypet.project.controller.gallery;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot_allmypet.project.model.comment.CommentVO;
import com.spring_boot_allmypet.project.model.gallery.GalleryVO;
import com.spring_boot_allmypet.project.service.comment.CommentService;
import com.spring_boot_allmypet.project.service.gallery.GalleryService;

import jakarta.servlet.http.HttpSession;

@Controller
public class GalleryController {

    @Autowired
    private GalleryService galleryService;
    
    @Autowired
    private CommentService commentService;
    
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
    
	/*
	 * @RequestMapping(value = "/gallery/category/img/{petCtgNo}", method =
	 * RequestMethod.GET, produces = "application/json") public String
	 * gallery_category2(@PathVariable("petCtgNo") String petCtgNo, Model model) {
	 * System.out.
	 * println("GalleryController - gallery_category called with petCtgNo: " +
	 * petCtgNo); List<GalleryVO> galleryImg =
	 * galleryService.getPostsByPetCtgNo(petCtgNo); model.addAttribute("galleryImg",
	 * galleryImg); return "animal/gallery_image"; }
	 */
    
    @RequestMapping("/gallery/detail/{postNo}")
    public String gallery_detail(@PathVariable int postNo, Model model, HttpSession session) {
        String memId = (String) session.getAttribute("mid");

        GalleryVO gall = galleryService.getPostByPostNo(postNo);
        
        model.addAttribute("gall", gall);
        
        // 댓글을 가져오고 GalleryVO 객체에 설정
        Map<String, Object> params = new HashMap<>();
        params.put("postNo", postNo);
        params.put("boardCtgNo", gall.getPetCtgNo());
        List<CommentVO> comments = commentService.getCommentsByPostAndBoardCtgNo(params);
        
        // 댓글 날짜를 포맷하여 설정 (예: "yyyy-MM-dd HH:mm:ss")
        for (CommentVO comment : comments) {
            comment.setCommentDate(formatDate(comment.getCommentDate()));
        }

        // GalleryVO 객체에 댓글 설정
        gall.setComments(comments);
        
        model.addAttribute("post", gall);
        return "gallery/gallery_detail";
    }

    // 날짜 포맷팅 메소드
    private String formatDate(String date) {
        // 문자열을 Date로 변환 후 포맷팅할 필요가 있는 경우 사용
        // 예: "2024-09-13 14:26:34"를 "yyyy-MM-dd HH:mm:ss"로 변환
        return date; // 여기서는 이미 포맷이 맞는다고 가정
    }

   
    
	
}