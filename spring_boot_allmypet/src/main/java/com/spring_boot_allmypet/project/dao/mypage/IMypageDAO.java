package com.spring_boot_allmypet.project.dao.mypage;

import java.util.ArrayList;
import java.util.Map;

import com.spring_boot_allmypet.project.model.member.MemberPointVO;
import com.spring_boot_allmypet.project.model.member.MemberVO;
import com.spring_boot_allmypet.project.model.member.PetVO;
import com.spring_boot_allmypet.project.model.mypage.BlockListVO;
import com.spring_boot_allmypet.project.model.mypage.BookMarkGVO;
import com.spring_boot_allmypet.project.model.mypage.BookMarkVO;

public interface IMypageDAO {
	// 내정보 출력
	public MemberVO memInfoView(String mid);
	// 내정보 수정
	public void updateMyInfo(MemberVO vo);
	// 팻정보 출력
	public ArrayList<PetVO> myPetList(String mid);
	// 포인트 내역 전부 출력
	public ArrayList<MemberPointVO> myPointList_total(String mid);
	// 포인트 내역 조건 출력
	public ArrayList<MemberPointVO> myPointList(Map<String, Object> params);
	// 북마크한 게시글 출력
	public ArrayList<BookMarkVO> bookMarkPostList(String mid);
	// 북마크 구분 조건 출력 
	public ArrayList<BookMarkVO> bookMarkPostList_div(Map<String, Object> params);
	// 북마크 검색 조건 출력
	public ArrayList<BookMarkVO> bookMarkPostList_search(Map<String, Object> params);
	// 북마크 갤려리 출력
	public ArrayList<BookMarkGVO> bookMarkGalleryList(String mid);
	// 블락 리스트 출력
	public ArrayList<BlockListVO> blockList(String mid);
	
}
