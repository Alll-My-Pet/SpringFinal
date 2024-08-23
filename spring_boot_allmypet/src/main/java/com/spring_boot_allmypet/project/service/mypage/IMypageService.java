package com.spring_boot_allmypet.project.service.mypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring_boot_allmypet.project.model.member.MemberPointVO;
import com.spring_boot_allmypet.project.model.member.MemberVO;
import com.spring_boot_allmypet.project.model.member.PetVO;
import com.spring_boot_allmypet.project.model.mypage.BlockListVO;
import com.spring_boot_allmypet.project.model.mypage.BookMarkGVO;
import com.spring_boot_allmypet.project.model.mypage.BookMarkVO;

public interface IMypageService {
	// 내정보 출력
	public MemberVO memInfoView(String mid);
	// 내정보 수정	// 구매한 이모지
	public void updateMyInfo(MemberVO vo);
	// 팻정보 출력
	public ArrayList<PetVO> myPetList(String mid);
	// 포인트 내역 출력
	public ArrayList<MemberPointVO> myPointList_total(String mid);
	// 포인트 내역 조건 출력
	public ArrayList<MemberPointVO> myPointList(String mid,int year,int month);
	// 북마크한 게시글 출력
	public ArrayList<BookMarkVO> bookMarkPostList(String mid);
	// 북마크 구분 조건 출력 
	public ArrayList<BookMarkVO> bookMarkPostList_div(String mid,int selectedValue);
	// 북마크 검색 조건 출력 
	public ArrayList<BookMarkVO> bookMarkPostList_search(String mid,String searchDiv,String searchContents);
	// 북마크 갤려리 출력
	public ArrayList<BookMarkGVO> bookMarkGalleryList(String mid);
	// 블락 리스트 출력
	public ArrayList<BlockListVO> blockList(String mid);
	// 블락 리스트 삭제
	public void blockList_delete(String mid,String blockedMemId);
	// 블락 리스트 수정
	public void blockList_update(String mid,String blockedMemId, String block_reason);
	// 블락 리스트 검색
	public ArrayList<HashMap<String, Object>>blockList_search(String mid,String blockedMemId);
	// 내가 쓴 글 댓글 출력
	public List<Map<String, Object>> myPosts_Comments(String memId);
	// 내가 쓴 글만 출력
	public List<Map<String, Object>> myPosts_only(String memId);
	// 내가 쓴 댓글만 출력
	public List<Map<String, Object>> myComments_only(String memId);
	// 북마크 검색 조건 출력
	public List<Map<String, Object>> myPosts_Comments_search(String mid,String searchDiv,String searchContents);
	// 즐겨찾기 이모지 출력
	public List<Map<String, Object>> emoji_favorites(String memId);
	// 즐겨찾기 이모지 삭제
	public void emoji_favorites_delete(String mid, int purchaseId);
	// 즐겨찾기 이모지 추가
	public void emoji_favorites_insert(String mid, int purchaseId);
	// 제작한 이모지
	public List<Map<String, Object>> emoji_my_edit(String memId);
	// 구매한 이모지
	public List<Map<String, Object>> emoji_my_purch(String memId);
}
