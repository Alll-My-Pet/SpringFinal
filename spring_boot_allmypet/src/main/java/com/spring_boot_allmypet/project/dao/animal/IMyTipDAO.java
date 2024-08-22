package com.spring_boot_allmypet.project.dao.animal;

import java.util.ArrayList;

import com.spring_boot_allmypet.project.model.animal.MyTipBoardVO;

public interface IMyTipDAO {
    // 특정 petCtgNo에 해당하는 양육 팁(headerNo가 4인 경우) 조회 
    public ArrayList<MyTipBoardVO> getTipList(String petCtgNo);
}
