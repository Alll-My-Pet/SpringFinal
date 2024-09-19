package com.spring_boot_allmypet.project.service.comment;

import java.util.List;
import java.util.Map;

import com.spring_boot_allmypet.project.model.comment.CommentVO;

public interface ICommentService {
	// 댓글 조회
    public List<CommentVO> getCommentsByPostAndBoardCtgNo(Map<String, Object> params);
    
    // 댓글 삽입
    public void insertComment(CommentVO comment);

    // 댓글 삭제
    public void deleteComment(int commentId);

    // 댓글 공감 수 증가
    public void incrementCommentLike(int commentId);
    
    // 특정 게시물의 댓글 수 조회
    public int countCommentsByPostNo(int postNo);
}