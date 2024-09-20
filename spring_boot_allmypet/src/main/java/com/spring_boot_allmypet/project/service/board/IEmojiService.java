package com.spring_boot_allmypet.project.service.board;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot_allmypet.project.model.board.EmojiVO;


public interface IEmojiService {

	/* public ArrayList<EmojiVO> listAllEmoji(); */
	public ArrayList<EmojiVO> listAllEmoji(HashMap<String, Integer> map);

	public int getEmojiCount();

	// 페이징
	public int paging();

	// 공지게시판
	public ArrayList<EmojiVO> viewNotice();

	public void insertEmoji(EmojiVO vo);

	public void updateEmoji(EmojiVO vo);

	// 게시글 삭제
	public void deleteEmoji(String emoNo);

	// 상세 게시글 조회
	public EmojiVO detailViewEmoji(int emoNo);

	// 상품 검색
	public ArrayList<EmojiVO> emojiSearch(HashMap<String, String> map);

	// 인기글
	public ArrayList<EmojiVO> listHotEmojis();

}
