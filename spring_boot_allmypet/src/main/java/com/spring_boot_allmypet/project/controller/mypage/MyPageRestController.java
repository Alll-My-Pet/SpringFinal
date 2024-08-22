package com.spring_boot_allmypet.project.controller.mypage;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.spring_boot_allmypet.project.model.member.MemberPointVO;
import com.spring_boot_allmypet.project.model.mypage.BlockListVO;
import com.spring_boot_allmypet.project.model.mypage.BookMarkVO;
import com.spring_boot_allmypet.project.service.mypage.MypageService;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;

@RestController
public class MyPageRestController {
	@Autowired
    private ServletContext servletContext;
	
	@Autowired
	MypageService mypageService;

    @PostMapping("/mypage/uploadImage")
    public String uploadImage(HttpSession session,@RequestParam("image") MultipartFile image) {
        if (!image.isEmpty()) {
            try {
                // 웹 애플리케이션 루트 경로 기준으로 파일 저장 경로 설정
                String uploadDir = servletContext.getRealPath("/uploads/profile_Img/");
                String fileName = System.currentTimeMillis() + "_" + image.getOriginalFilename();
                File destFile = new File(uploadDir, fileName);
                
                // 디렉토리가 없으면 생성
                if (!destFile.getParentFile().exists()) {
                    destFile.getParentFile().mkdirs();
                }

                image.transferTo(destFile);

                return fileName;
            } catch (IOException e) {
                e.printStackTrace();
                return "{\"error\": \"Failed to upload file\"}";
            }
        } else {
            return "{\"error\": \"No file uploaded\"}";
        }
    }
    
    @PostMapping("/mypage/getMonthlyPoints")
    public Map<String, Object> getMonthlyPoints(HttpSession session, @RequestParam("month") int month) {
        String memId = (String) session.getAttribute("mid");
        LocalDate currentDate = LocalDate.now();
        int year = currentDate.getYear();

        ArrayList<MemberPointVO> pointList = mypageService.myPointList(memId, year, month);

        int positive = 0; 
        int negative = 0;
        for (MemberPointVO point : pointList) {
            int change = point.getPoint_change();
            if (change > 0) {
                positive += change;
            } else if (change < 0) {
                negative += change;
            }
        }

        Map<String, Object> result = new HashMap<>();
        result.put("pointList", pointList);
        result.put("positive", positive);
        result.put("negative", negative);

        return result;
    }
    @PostMapping("/mypage/onlyPMclass")
    public Map<String, Object> onlyPMclass(HttpSession session, @RequestParam("month") int month,@RequestParam("check") int check) {
    	String memId = (String) session.getAttribute("mid");
    	LocalDate currentDate = LocalDate.now();
    	int year = currentDate.getYear();
    	ArrayList<MemberPointVO> pointLists = mypageService.myPointList(memId, year, month);
    	ArrayList<MemberPointVO> pointList = new ArrayList<>();
    	int positive = 0; 
    	int negative = 0;
    	for (MemberPointVO point : pointLists) {
    		int change = point.getPoint_change();
    		if (check > 0 && change > 0) {
    			pointList.add(point);
    			positive += change;
    		} else if (check < 0 && change < 0) {
    			pointList.add(point);
    			negative += change;
    		}
    	}

    	Map<String, Object> result = new HashMap<>();
    	
    	result.put("pointList", pointList);
    	result.put("positive", positive);
    	result.put("negative", negative);
    	
    	return result;
    }
    /*북마크 포스트 구분*/
    @PostMapping("/mypage/bookMark_post/updateDiv")
    public Map<String, Object> bookMark_post_update_div(HttpSession session, @RequestParam("selectedValue") int selectedValue) {
        String memId = (String) session.getAttribute("mid");
        ArrayList<BookMarkVO> bookmarkList;

        if (selectedValue == -1) {
            bookmarkList = mypageService.bookMarkPostList(memId);
        } else {
            bookmarkList = mypageService.bookMarkPostList_div(memId, selectedValue);
        }

        Map<String, Object> result = new HashMap<>();
        result.put("bookMarkList", bookmarkList);
        return result;
    }
    /*북마크 포스트 검색*/
    @PostMapping("/mypage/bookMark_post/updateSearch")
    public Map<String, Object> bookMark_post_update_search(HttpSession session, @RequestParam("searchDiv") String searchDiv , @RequestParam("searchContents") String searchContents) {
    	String memId = (String) session.getAttribute("mid");
    	ArrayList<BookMarkVO> bookmarkList=mypageService.bookMarkPostList_search(memId, searchDiv, searchContents);
    	
    	Map<String, Object> result = new HashMap<>();
    	result.put("bookMarkList", bookmarkList);
    	return result;
    }
    
    /* 블락리스트 삭제 */
    @PostMapping("/blockList/delete")
    public Boolean blockList_delete(HttpSession session, @RequestBody Map<String, List<String>> data) {
    	String memId = (String) session.getAttribute("mid");
    	List<String> ids = data.get("ids");
    	Boolean check=false; 
    	if (ids != null && !ids.isEmpty()) {
            for (String id : ids) {
            	mypageService.blockList_delete(memId, id);
            	check = true;
            }
        }
    	return check;
    }
    /* 블락리스트 수정 */
    @PostMapping("/blockList/update")
    public Boolean blockList_update(HttpSession session, @RequestBody Map<String, List<List<String>>> data) {
    	String memId = (String) session.getAttribute("mid");
    	 List<List<String>> lists = data.get("lists");
    	    Boolean check = false; 
    	    if (lists != null && !lists.isEmpty()) {
    	        for (List<String> list : lists) {
    	        	mypageService.blockList_update(memId, list.get(0), list.get(1));
    	        }
    	        check = true; 
    	    }
    	return check;
    }
    /* 블라리스트 검색 */
    @PostMapping("/blockList/search")
    public Map<String, Object> blockList_search(HttpSession session, @RequestParam("searchValue") String searchValue ) {
        String memId = (String) session.getAttribute("mid");
        ArrayList<HashMap<String, Object>> blockLists = mypageService.blockList_search(memId, searchValue);
        Map<String, Object> result = new HashMap<>();
        result.put("blockLists", blockLists);
        return result;
    }
}
