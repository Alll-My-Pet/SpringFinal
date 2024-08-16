package com.spring_boot_allmypet.project.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.dao.member.IMemDAO;
import com.spring_boot_allmypet.project.model.member.MemVO;

@Service
public class MemService {
	
	@Autowired
	@Qualifier("IMemDAO")
	private IMemDAO memDao;
	
	public boolean authenticate(String memId, String memPwd) {
		MemVO user = memDao.getUserByUsername(memId);
        if (user != null) {
            return user.getMemPwd().equals(memPwd); // 실제로는 비밀번호를 암호화하여 비교하는 것이 좋습니다.
        }
        return false;
    }
	
	/*
	 * public boolean isIdDuplicate(String memId) { return memDao.checkID(memId) >
	 * 0; }
	 * 
	 * public String findPW(String memId) { return memDao.findPW(memId); }
	 * 
	 * public String findID(String memName, String memEmail, String memHP) { return
	 * memDao.findID(memName, memEmail, memHP); }
	 */

}
