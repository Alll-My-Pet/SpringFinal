package com.spring_boot_allmypet.project.service.comment;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.dao.comment.ICommentDAO;
import com.spring_boot_allmypet.project.model.comment.CommentVO;
import com.spring_boot_allmypet.project.model.comment.EmojiFavVO;
import com.spring_boot_allmypet.project.model.comment.EmojiVO;

@Service
public class CommentService implements ICommentService {
	@Autowired
	@Qualifier("ICommentDAO")
	ICommentDAO dao;

    // 댓글 조회
    @Override
    public List<CommentVO> getCommentsByPostAndBoardCtgNo(Map<String, Object> params) {
        return dao.getCommentsByPostAndBoardCtgNo(params);
    }

    // 댓글 삽입
    @Override
    public void insertComment(CommentVO comment) {
        dao.insertComment(comment);
    }

    // 댓글 삭제
    @Override
    public void deleteComment(int commentId) {
        dao.deleteComment(commentId);
    }

    // 댓글 공감 수 증가
    @Override
    public void incrementCommentLike(int commentId) {
        dao.incrementCommentLike(commentId);
    }
    
    // 특정 회원의 즐겨찾는 이모지 조회
    public List<EmojiVO> getFavoriteEmojisByMemId(String memId) {
        return dao.getFavoriteEmojisByMemId(memId);
    }
}
