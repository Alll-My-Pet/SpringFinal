package com.spring_boot_allmypet.project.service.animal;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.dao.animal.IBulletinDAO;
import com.spring_boot_allmypet.project.model.animal.BulletinBoardVO;

@Service
public class BulletinService implements IBulletinServcie {
	@Autowired
	@Qualifier("IBulletinDAO")
	IBulletinDAO dao;

	// animal_index.jsp에 붙을 전체게시판 미리보기
	@Override
	public ArrayList<BulletinBoardVO> showBulletin(String petCtgNo) {
		return dao.showBulletin(petCtgNo);
	}

	// 전체게시판 목록 가져오기
	public ArrayList<BulletinBoardVO> getBulletinList(HashMap<String, Object> map) {
		// 필터링 로직 추가 (예: headerNo가 null이 아닐 경우 필터링)
		return dao.getBulletinList(map);
	}

	// 전체게시판 실시간 인기글
	@Override
	public ArrayList<BulletinBoardVO> hotList(String petCtgNo) {
		return dao.hotList(petCtgNo);
	}

	@Override
	public BulletinBoardVO getPost(int postNo) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// 게시글 상세보기
	@Override
	public BulletinBoardVO detailViewBoard(int postNo) {
		return dao.detailViewBoard(postNo);
	}
	
	// 좋아요 업데이트
	@Override
	public void updateLikeCount(int postNo, int postLike) {
	    dao.updateLikeCount(postNo, postLike);
	}

	
	// 게시글 등록
	@Override
	public void insertPost(BulletinBoardVO vo) {
		dao.insertPost(vo);
	}

	@Override
	public void updatePost(BulletinBoardVO post) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deletePost(int postNo) {
		// TODO Auto-generated method stub

	}

}
