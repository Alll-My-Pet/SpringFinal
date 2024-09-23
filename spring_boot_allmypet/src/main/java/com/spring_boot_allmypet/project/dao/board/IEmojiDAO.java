package com.spring_boot_allmypet.project.dao.board;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot_allmypet.project.model.board.EmojiVO;

public interface IEmojiDAO {
	// 목록
		/* public ArrayList<EmojiVO> listAllEmoji(); */
		public ArrayList<EmojiVO> listAllEmoji(HashMap<String, Integer> map);

		public int getEmojiCount();

		// 페이징
		public int paging();

		// 공지게시판
		public ArrayList<EmojiVO> viewNotice();
		
		// 글 쓰기
		public void insertEmoji(EmojiVO vo);

		// 수정
		public void updateEmoji(EmojiVO vo);

		// 삭제
		public void deleteEmoji(String emoNo);

		// 상세 조회
		public EmojiVO detailViewEmoji(int emoNo);

		// 검색
		public ArrayList<EmojiVO> emojiSearch(HashMap<String, String> map);

		// 인기글
		public ArrayList<EmojiVO> listHotEmojis();
}
