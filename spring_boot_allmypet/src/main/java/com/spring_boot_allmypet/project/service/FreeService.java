package com.spring_boot_allmypet.project.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.dao.IFreeDAO;
import com.spring_boot_allmypet.project.model.FreeVO;

@Service
public class FreeService implements IFreeService {
	
	@Autowired
	@Qualifier("IFreeDAO")
	IFreeDAO dao;

	@Override
	public ArrayList<FreeVO> FreeBoardList(HashMap<String, Integer> map) {
		return dao.FreeBoardList(map);
	}

	@Override
	public int FreePaging() {
		return dao.FreePaging();
	}

	@Override
	public void FreeInsert(FreeVO vo) {
		dao.FreeInsert(vo);

	}

	@Override
	public void FreeUpdate(FreeVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void FreeDelete(String bodNo) {
		// TODO Auto-generated method stub

	}

	@Override
	public FreeVO FreeDetailView(int postNo) {
		return dao.FreeDetailView(postNo);
	}

	@Override
	public ArrayList<FreeVO> FreeSearch(HashMap<String, String> param) {
		return dao.FreeSearch(param);
	}

	@Override
	public ArrayList<FreeVO> FreeHotTopics() {
		return dao.FreeHotTopics();
	}

}
