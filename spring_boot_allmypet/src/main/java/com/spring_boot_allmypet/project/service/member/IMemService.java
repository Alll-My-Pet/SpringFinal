package com.spring_boot_allmypet.project.service.member;

import org.apache.ibatis.annotations.Param;

import com.spring_boot_allmypet.project.model.member.MemVO;

public interface IMemService {
	
void insertMem (MemVO memId);
	
	MemVO getUserByUsername(String memId);
	
	MemVO login(@Param("memId") String memID, @Param("memPwd") String memPwd);
	
	int checkID (String memId);
	
	MemVO findID (String memId);
	
	MemVO findPW (String memName, String memEmail, String memHP);

}
