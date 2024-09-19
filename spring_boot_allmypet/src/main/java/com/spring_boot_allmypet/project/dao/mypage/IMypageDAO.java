package com.spring_boot_allmypet.project.dao.mypage;

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
import com.spring_boot_allmypet.project.model.mypage.BreederInfoVO;

public interface IMypageDAO {
	// 내정보 출력
	public MemberVO memInfoView(String mid);
	// 내정보 수정
	public void updateMyInfo(MemberVO vo);
	// 펫정보 출력
	public ArrayList<PetVO> myPetList(String mid);
	// 펫정보 삭제
	public void myPetDelete(String mid);
	// 펫정보 추가
	public void  myPetUpdate(PetVO petvo);
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
	// 블락 리스트 삭제
	public void blockList_delete(Map<String, Object>params);
	// 블락 리스트 수정
	public void blockList_update(Map<String, Object>params);
	// 블락 리스트 검색
	public ArrayList<HashMap<String, Object>>blockList_search(Map<String, Object> params);
	// 내가 쓴 글 댓글 출력
	public List<Map<String, Object>> myPosts_Comments(String memId);
	// 내가 쓴 글만 출력
	public List<Map<String, Object>> myPosts_only(String memId);
	// 내가 쓴 댓글만 출력
	public List<Map<String, Object>> myComments_only(String memId);
	// 북마크 검색 조건 출력
	public List<Map<String, Object>> myPosts_Comments_search(Map<String, Object> params);
	// 즐겨찾기 이모지 출력
	public List<Map<String, Object>> emoji_favorites(String memId);
	// 즐겨찾기 삭제
	public void emoji_favorites_delete(Map<String, Object> params);
	// 즐겨찾기 추가
	public	void emoji_favorites_insert(Map<String, Object> params);
	// 제작한 이모지 
	public List<Map<String, Object>> emoji_my_edit(String memId);
	// 구매한 이모지
	public List<Map<String, Object>> emoji_my_purch(String memId);
	// 쿠폰 리스트 출력
	public List<Map<String, Object>> myCouponList(String memId);
	// 브리더 등록
	public void breederInsert(BreederInfoVO vo);
	// 브리더 수정
	public void breederUpdate(BreederInfoVO vo);
	// 회원정보 브리더로 수정
	public void updateBreeder(String mid);
}
