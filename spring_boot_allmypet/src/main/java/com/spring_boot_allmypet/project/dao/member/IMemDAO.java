package com.spring_boot_allmypet.project.dao.member;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.spring_boot_allmypet.project.model.member.MemVO;

@Mapper
@Repository
public interface IMemDAO {
	
	void insertMem (MemVO memId);
	
	MemVO getUserByUsername(String memId);
	
	MemVO login(@Param("memId") String memID, @Param("memPwd") String memPwd);
	
	int checkID (String memId);
	
	MemVO findID (String memId);
	
	MemVO findPW (String memName, String memEmail, String memHP);

}