package com.spring_boot_allmypet.project.dao.comment;

import java.util.List;
import java.util.Map;

import com.spring_boot_allmypet.project.model.comment.CommentVO;
import com.spring_boot_allmypet.project.model.comment.EmojiFavVO;
import com.spring_boot_allmypet.project.model.comment.EmojiVO;


public interface ICommentDAO {
	// 댓글 조회 (postNo, boardCtgNo 기준)
    public List<CommentVO> getCommentsByPostAndBoardCtgNo(Map<String, Object> params);
    
    // 댓글 삽입
    public void insertComment(CommentVO comment);

    // 댓글 삭제
    public void deleteComment(int commentId);

    // 댓글 공감 수 증가
    public void incrementCommentLike(int commentId);
    
    //즐겨찾기 이모지 조회
    public List<EmojiVO> getFavoriteEmojisByMemId(String memId);

}