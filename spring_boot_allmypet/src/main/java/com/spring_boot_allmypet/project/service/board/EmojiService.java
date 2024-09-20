package com.spring_boot_allmypet.project.service.board;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.dao.board.IEmojiDAO;
import com.spring_boot_allmypet.project.model.board.EmojiVO;

@Service
public class EmojiService implements IEmojiService {

	@Autowired
	@Qualifier("IEmojiDAO")
	IEmojiDAO dao;

	@Override
	public ArrayList<EmojiVO> listAllEmoji(HashMap<String, Integer> map) {
		return dao.listAllEmoji(map);
	}

	// 공지 게시판
	@Override
	public ArrayList<EmojiVO> viewNotice() {
		return dao.viewNotice();
	}

	// 자유게시판 페이징
	@Override
	public int paging() {
		return dao.paging();
	}

	@Override
	public int getEmojiCount() {
		// TODO Auto-generated method stub
		return dao.getEmojiCount();
	}

	// 작성
	@Override
	public void insertEmoji(EmojiVO vo) {
		dao.insertEmoji(vo);

	}

	@Override
	public void updateEmoji(EmojiVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteEmoji(String emoNo) {
		// TODO Auto-generated method stub

	}

	// 상세 조회
	@Override
	public EmojiVO detailViewEmoji(int emoNo) {
		return dao.detailViewEmoji(emoNo);
	}

	// 검색
	@Override
	public ArrayList<EmojiVO> emojiSearch(HashMap<String, String> param) {
		return dao.emojiSearch(param);
	}

	// 인기글
	@Override
	public ArrayList<EmojiVO> listHotEmojis() {
		return dao.listHotEmojis();
	}

}
