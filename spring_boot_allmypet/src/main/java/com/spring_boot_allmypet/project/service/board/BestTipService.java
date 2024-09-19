package com.spring_boot_allmypet.project.service.board;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.dao.board.IBestTipDAO;
import com.spring_boot_allmypet.project.model.board.BestTipVO;

@Service
public class BestTipService implements IBestTipService {
	@Autowired
	@Qualifier("IBestTipDAO")
	IBestTipDAO dao;

	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<BestTipVO> getTipList(String petCtgNo) {
		return null;
	}

}
