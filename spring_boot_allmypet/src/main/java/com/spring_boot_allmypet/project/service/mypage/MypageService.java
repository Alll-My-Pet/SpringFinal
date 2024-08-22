package com.spring_boot_allmypet.project.service.mypage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.dao.mypage.IMypageDAO;
import com.spring_boot_allmypet.project.model.member.MemberPointVO;
import com.spring_boot_allmypet.project.model.member.MemberVO;
import com.spring_boot_allmypet.project.model.member.PetVO;
import com.spring_boot_allmypet.project.model.mypage.BlockListVO;
import com.spring_boot_allmypet.project.model.mypage.BookMarkGVO;
import com.spring_boot_allmypet.project.model.mypage.BookMarkVO;

@Service
public class MypageService implements IMypageService {
	@Autowired
	@Qualifier("IMypageDAO")
	IMypageDAO dao;
	
	/* 내정보 출력 */
	@Override
	public MemberVO memInfoView(String mid) {
		return dao.memInfoView(mid);
	}
	/* 내정보 수정 */
	@Override
	public void updateMyInfo(MemberVO vo) {
		dao.updateMyInfo(vo);
	}
	/* 펫 정보 출력 */
	@Override
	public ArrayList<PetVO> myPetList(String mid) {
		return dao.myPetList(mid);
	}
	/* 포인트 내역 출력*/
	@Override
	public ArrayList<MemberPointVO> myPointList_total(String mid){ 
		return dao.myPointList_total(mid);
	}
	@Override
	public ArrayList<MemberPointVO> myPointList(String mid, int year, int month) {
		Map<String, Object> params = new HashMap<>();
        params.put("memId", mid);
        params.put("year", year);
        params.put("month", month);
        return dao.myPointList(params);
	}
	/* 북마크한 글 출력 */
	@Override
	public ArrayList<BookMarkVO> bookMarkPostList(String mid) {
		return dao.bookMarkPostList(mid);
	}
	/* 북마크 구분 조건 출력 */
	@Override
	public ArrayList<BookMarkVO> bookMarkPostList_div(String mid, int selectedValue) {
		Map<String, Object> params = new HashMap<>();
		params.put("memId", mid);
        params.put("headerNo", selectedValue);
		return dao.bookMarkPostList_div(params);
	}
	/* 북마크 검색 조건 출력*/
	@Override
	public ArrayList<BookMarkVO> bookMarkPostList_search(String mid, String searchDiv, String searchContents) {
		Map<String, Object> params = new HashMap<>();
		params.put("memId", mid);
        params.put("searchDiv", searchDiv);
        params.put("searchContents", searchContents);
		return dao.bookMarkPostList_search(params);
	}
	/* 북마크 갤러리 출력 */
	@Override
	public ArrayList<BookMarkGVO> bookMarkGalleryList(String mid) {
		return dao.bookMarkGalleryList(mid);
	}
	/* 블락 리스트 출력 */
	@Override
	public ArrayList<BlockListVO> blockList(String mid) {
		return dao.blockList(mid);
	}
	/* 블락 리스트 삭제 */
	@Override
	public void blockList_delete(String mid, String blockedMemId) {
		Map<String, Object> params = new HashMap<>();
        params.put("memId", mid);
        params.put("blockedMemId", blockedMemId);
		dao.blockList_delete(params);
	}
	/* 블락 리스트 수정 */
	@Override
	public void blockList_update(String mid, String blockedMemId, String block_reason) {
		Map<String,Object> params = new HashMap<>();
		params.put("memId", mid);
		params.put("blockedMemId", blockedMemId);
		params.put("block_reason", block_reason);
		
		dao.blockList_update(params);
	}
	/* 블락 리스트 검색 */
	@Override
	public ArrayList<HashMap<String, Object>> blockList_search(String mid, String blockedMemId) {
		Map<String, Object> params = new HashMap<>();
		params.put("memId", mid);
		params.put("blockedMemId", blockedMemId);
		
		return dao.blockList_search(params);
	}
	/* 내가 쓴 글 댓글 출력 */
	@Override
	public List<Map<String, Object>> myPosts_Comments(String memId) {
		return dao.myPosts_Comments(memId);
	}
	/* 내가 쓴 글만 출력 */
	@Override
	public List<Map<String, Object>> myPosts_only(String memId) {
		return dao.myPosts_only(memId);
	}
	/* 내가 쓴 댓글만 출력 */
	@Override
	public List<Map<String, Object>> myComments_only(String memId) {
		return dao.myComments_only(memId);
	}
	// 북마크 검색 조건 출력
	@Override
	public List<Map<String, Object>> myPosts_Comments_search(String mid, String searchDiv, String searchContents) {
		Map<String, Object> params = new HashMap<>();
		params.put("memId", mid);
        params.put("searchDiv", searchDiv);
        params.put("searchContents", searchContents);
		return dao.myPosts_Comments_search(params);
	}
}
