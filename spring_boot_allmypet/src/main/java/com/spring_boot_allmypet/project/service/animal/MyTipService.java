package com.spring_boot_allmypet.project.service.animal;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.dao.animal.IMyTipDAO;
import com.spring_boot_allmypet.project.model.animal.MyTipBoardVO;

@Service
public class MyTipService implements IMyTipService {
	@Autowired
	@Qualifier("IMyTipDAO")
	IMyTipDAO dao;
	
	@Override
	public ArrayList<MyTipBoardVO> getTipList(String petCtgNo) {
		return dao.getTipList(petCtgNo);
	}

}
