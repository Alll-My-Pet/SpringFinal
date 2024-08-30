package com.spring_boot_allmypet.project.service.board;

import java.util.ArrayList;

import com.spring_boot_allmypet.project.model.board.BestTipVO;

public interface IBestTipService {
	// 특정 petCtgNo에 해당하는 양육 팁 조회
		public ArrayList<BestTipVO> getTipList(String petCtgNo);
}
