package com.spring_boot_allmypet.project.service.animal;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.dao.animal.IBulletinDAO;
import com.spring_boot_allmypet.project.model.animal.BulletinBoardVO;

@Service
public class BulletinService implements IBulletinServcie {
	@Autowired
	@Qualifier("IBulletinDAO")
	IBulletinDAO dao;

	@Override
	public ArrayList<BulletinBoardVO> getBulletinList(String petCtgNo) {
		System.out.println("petctgno" + petCtgNo);
		return dao.getBulletinList(petCtgNo);
	}

	@Override
	public BulletinBoardVO getPost(int postNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertPost(BulletinBoardVO post) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updatePost(BulletinBoardVO post) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deletePost(int postNo) {
		// TODO Auto-generated method stub

	}

}
