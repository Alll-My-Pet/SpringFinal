package com.spring_boot_allmypet.project.controller.gallery;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot_allmypet.project.model.ai.GreenEyeVO;
import com.spring_boot_allmypet.project.model.animal.AnimalCtgVO;
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
    
    @RequestMapping("/gallery")
    public String gallery(Model model) {
        Map<String, List<GalleryVO>> categorizedPosts = new HashMap<>();
        Map<Integer, Integer> commentCounts = new HashMap<>();
        Map<Integer, String> profileImages = new HashMap<>();  // 프로필 이미지 저장
        
        for (int petCtgNo = 1; petCtgNo <= 8; petCtgNo++) {
            List<GalleryVO> categoryPosts = galleryService.getTopPostsByPetCtgNoInLastWeek(String.valueOf(petCtgNo));
            categorizedPosts.put(String.valueOf(petCtgNo), categoryPosts);
            
            for (GalleryVO post : categoryPosts) {
                int commentCount = commentService.countCommentsByPostNo(post.getPostNo());
                String profileImage = galleryService.getProfileImage(post.getPostNo()); // 프로필 이미지 가져오기
                commentCounts.put(post.getPostNo(), commentCount);
                profileImages.put(post.getPostNo(), profileImage);  // 프로필 이미지 저장
            }
        }
        
        model.addAttribute("categorizedPosts", categorizedPosts);
        model.addAttribute("commentCounts", commentCounts);
        model.addAttribute("profileImages", profileImages);  // 프로필 이미지 전달
        return "gallery/gallery_best";
    }
    
    // petCtgNo를 받아와서 해당되는 게시물 출력
    @RequestMapping("/gallery/category/{petCtgNo}")
    public String gallery_category(@PathVariable("petCtgNo") String petCtgNo, 
                                   @RequestParam(value = "keyword", required = false) String keyword,
                                   @RequestParam(value = "page", defaultValue = "1") int page,
                                   Model model) {
        int pageSize = 10; // 페이지당 게시물 수
        int offset = (page - 1) * pageSize;
        
        // 검색어와 페이징을 적용한 게시물 가져오기
        List<GalleryVO> categoryPosts = galleryService.searchPostsByPetCtgNo(petCtgNo, keyword, offset, pageSize);
        int totalPosts = galleryService.countPostsByPetCtgNo(petCtgNo, keyword);
        int totalPages = (int) Math.ceil((double) totalPosts / pageSize);
        Map<Integer, String> profileImages = new HashMap<>();  // 프로필 이미지 저장
        
        // 각 게시물에 대한 댓글 수 조회 후 모델에 추가
        Map<Integer, Integer> commentCounts = new HashMap<>();
        for (GalleryVO post : categoryPosts) {
            int commentCount = commentService.countCommentsByPostNo(post.getPostNo());
            String profileImage = galleryService.getProfileImage(post.getPostNo()); // 프로필 이미지 가져오기
            profileImages.put(post.getPostNo(), profileImage);  // 프로필 이미지 저장
            commentCounts.put(post.getPostNo(), commentCount);
        }
        
        model.addAttribute("profileImages", profileImages);
        model.addAttribute("categoryPosts", categoryPosts);
        model.addAttribute("commentCounts", commentCounts); // 댓글 수 추가
        model.addAttribute("page", page);
        model.addAttribute("totalPages", totalPages);

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
        String profileImage = galleryService.getProfileImage(postNo); // 프로필 이미지 가져오기
        GalleryVO gall = galleryService.getPostByPostNo(postNo);
        
        model.addAttribute("profileImage", profileImage);
        model.addAttribute("gall", gall);
        
        // 댓글을 가져오고 GalleryVO 객체에 설정
        Map<String, Object> params = new HashMap<>();
        params.put("postNo", postNo);
        params.put("boardCtgNo", gall.getPetCtgNo());
        List<CommentVO> comments = commentService.getCommentsByPostAndBoardCtgNo(params);
        
        // 댓글 날짜를 포맷하여 설정 (예: "yyyy-MM-dd HH:mm:ss")
        for (CommentVO comment : comments) {
            comment.setCommentDate(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
        }

        // GalleryVO 객체에 댓글 설정
        gall.setComments(comments);
        
        model.addAttribute("post", gall);
        return "gallery/gallery_detail";
    }


    @RequestMapping("/gallery/{petCtgNo}/gallery_form")
	public String boardWrite(@PathVariable String petCtgNo, Model model, HttpSession session) {
        String memId = (String) session.getAttribute("mid");
		model.addAttribute("memId", memId);
		model.addAttribute("petCtgNo", petCtgNo);

		return "gallery/gallery_form";
	}
    
    @PostMapping("/gallery/insert")
    public String insertGalleryPost(@ModelAttribute GalleryVO galleryVO,
                                    @RequestParam("postImgFile") MultipartFile postImgFile,
                                    HttpSession session) throws IOException {
        // 현재 로그인된 사용자 정보 가져오기
        String memId = (String) session.getAttribute("memId");
        

        // 작성 날짜 설정
        galleryVO.setPostDate(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));

        // 파일 업로드 처리
        if (!postImgFile.isEmpty()) {
            // 파일 저장 경로 설정 (시스템에 맞게 변경 필요)
            String uploadDir = "/gallery_images/"; // 시스템 경로에 맞게 수정

            // 고유한 파일 이름 생성
            String originalFilename = postImgFile.getOriginalFilename();
            String newFilename = System.currentTimeMillis() + "_" + originalFilename;

            // 저장할 디렉토리 경로가 존재하지 않으면 생성
            Path uploadPath = Paths.get(uploadDir);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            // 파일을 저장 디렉토리에 저장
            Path filePath = uploadPath.resolve(newFilename);
            Files.copy(postImgFile.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

            // VO 객체에 이미지 파일 이름 설정
            galleryVO.setPostImg(newFilename);
        }

        // 좋아요 초기값 설정
        galleryVO.setPostLike("0");

        // 게시글 저장 서비스 호출
        galleryService.insertGalleryPost(galleryVO);

        // 저장 후 갤러리 페이지로 리다이렉트
        return "redirect:/gallery";
    }
    
}