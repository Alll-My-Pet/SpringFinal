package com.spring_boot_allmypet.project.service.animal;

import java.util.ArrayList;

import com.spring_boot_allmypet.project.model.animal.MyTipBoardVO;

public interface IMyTipService {
	public ArrayList<MyTipBoardVO> getTipList(String petCtgNo);
}
