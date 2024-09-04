package com.spring_boot_allmypet.project.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.dao.IPromoteDAO;
import com.spring_boot_allmypet.project.model.PromoteVO;

@Service
public class PromoteService implements IPromoteService {
	
	@Autowired
	@Qualifier("IPromoteDAO")
	IPromoteDAO dao;

	@Override
	public ArrayList<PromoteVO> promoteList(HashMap<String, Integer> map) {
		return dao.promoteList(map);
	}

	@Override
	public int promoteCount() {
		// TODO Auto-generated method stub
		return dao.promoteCount();
	}

	@Override
	public void insertPromote(PromoteVO vo) {
		dao.insertPromote(vo);

	}

	@Override
	public void updatePromote(PromoteVO vo) {
		dao.updatePromote(vo);

	}

	@Override
	public void deletePromote(String bodNo) {
		dao.deletePromote(bodNo);

	}

	@Override
	public PromoteVO promoteDetailView(int postNo) {
		return dao.promoteDetailView(postNo);
	}

	@Override
	public ArrayList<PromoteVO> promoteSearch(HashMap<String, String> map) {
		return dao.promoteSearch(map);
	}

}
