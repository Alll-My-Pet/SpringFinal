package com.spring_boot_allmypet.project.service.animal;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring_boot_allmypet.project.model.animal.BulletinBoardVO;

public interface IBulletinServcie {
	// petCtgNo에 따른 전체게시판 목록 - animnal_index.jsp에 붙이는 미리보기
	public ArrayList<BulletinBoardVO> showBulletin(String petCtgNo);

	// petCtgNo에 따른 필터링 되는 목록 가져오기
	public ArrayList<BulletinBoardVO> getBulletinList(HashMap<String, Object> map);

	// postNo로 해당 게시글 가져오기
	public BulletinBoardVO getPost(int postNo);

	// 삽입/갱신/삭제
	public void insertPost(BulletinBoardVO post);

	public void updatePost(BulletinBoardVO post);

	public void deletePost(int postNo);
}
