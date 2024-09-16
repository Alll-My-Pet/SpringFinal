package com.spring_boot_allmypet.project.controller.comment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring_boot_allmypet.project.model.comment.CommentVO;
import com.spring_boot_allmypet.project.model.comment.EmojiVO;
import com.spring_boot_allmypet.project.model.gallery.GalleryVO;
import com.spring_boot_allmypet.project.model.market.MemberVO;
import com.spring_boot_allmypet.project.model.market.ProductVO;
import com.spring_boot_allmypet.project.service.comment.CommentService;
import com.spring_boot_allmypet.project.service.gallery.GalleryService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CommentController {

    
    @Autowired
    private CommentService commentService;
    
    @PostMapping("/comment/like")
    public String likeComment(@RequestParam("commentId") int commentId, @RequestParam("postNo") Integer postNo) {
        commentService.incrementCommentLike(commentId);
        return "redirect:/gallery/detail/" + postNo;
    }

    @PostMapping("/comment/delete")
    public String deleteComment(@RequestParam("commentId") int commentId, @RequestParam("postNo") Integer postNo) {
        commentService.deleteComment(commentId);
        return "redirect:/gallery/detail/" + postNo;
    }

    @PostMapping("/comment/insert")
    public String insertComment(CommentVO comment, HttpSession session, @RequestParam("emojiImg") String emojiImg) {
        String memId = (String) session.getAttribute("mid");
        comment.setMemId(memId);
        comment.setEmojiImg(emojiImg); // 선택된 이모지 설정
        commentService.insertComment(comment);
        return "redirect:/gallery/detail/" + comment.getPostNo();
    }
    
 // 이모지 즐겨찾기 목록 모달 출력
    @RequestMapping("/emoji/favorites")
    public String getFavoriteEmojis(HttpSession session, Model model) {
        String memId = (String) session.getAttribute("mid");

        // 즐겨찾기한 이모지를 가져오는 서비스 호출
        List<EmojiVO> favoriteEmojis = commentService.getFavoriteEmojisByMemId(memId);
        model.addAttribute("favoriteEmojis", favoriteEmojis);

        return "comment/emoji_favorites_modal"; // 모달용 JSP 파일
    }
    
	
}