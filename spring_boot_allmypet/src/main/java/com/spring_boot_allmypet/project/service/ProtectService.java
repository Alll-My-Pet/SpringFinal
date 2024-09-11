package com.spring_boot_allmypet.project.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.dao.IProtectDAO;
import com.spring_boot_allmypet.project.model.ProtectVO;

@Service
public class ProtectService implements IProtectService {
	

	@Autowired
	@Qualifier("IProtectDAO")
	IProtectDAO dao;
	
	@Override
	public ArrayList<ProtectVO> ProtectReportList(HashMap<String, Integer> map) {
		return dao.ProtectReportList(map);
	}

	@Override
	public ArrayList<ProtectVO> ProtectBoardList(HashMap<String, Integer> map) {
		return dao.ProtectBoardList(map);
	}

	@Override
	public int ProtectPaging() {
		return dao.ProtectPaging();
	}

	@Override
	public void ProtectInsert(ProtectVO vo) {
		dao.ProtectInsert(vo);

	}
	
	@Override
    public void reportInsert(ProtectVO vo) {
        dao.reportInsert(vo);
    }

	@Override
	public void ProtectUpdate(ProtectVO vo) {
		dao.ProtectUpdate(vo);

	}

	@Override
	public void ProtectDelete(int postNo) {
		dao.ProtectDelete(postNo);

	}

	@Override
	public ProtectVO ProtectDetailView(int postNo) {
		return dao.ProtectDetailView(postNo);
	}

	@Override
	public ArrayList<ProtectVO> ProtectSearch(HashMap<String, String> map) {
		return dao.ProtectSearch(map);
	}

}
