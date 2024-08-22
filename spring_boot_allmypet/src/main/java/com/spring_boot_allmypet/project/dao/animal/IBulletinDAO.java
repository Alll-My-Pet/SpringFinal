package com.spring_boot_allmypet.project.dao.animal;

import java.util.ArrayList;

import com.spring_boot_allmypet.project.model.animal.BulletinBoardVO;

// 동물별 - 전체게시판
public interface IBulletinDAO {
	// petCtgNo에 따른 목록 가져오기
	public ArrayList<BulletinBoardVO> getBulletinList(String petCtgNo);

	// postNo로 해당 게시글 가져오기
	public BulletinBoardVO getPost(int postNo);

	// 삽입/갱신/삭제
	public void insertPost(int postNo);

	public void updatePost(BulletinBoardVO post);

	public void deletePost(int postNo);
}
