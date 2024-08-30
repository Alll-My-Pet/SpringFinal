package com.spring_boot_allmypet.project.dao.map;

import java.util.ArrayList;
import java.util.Map;

import com.spring_boot_allmypet.project.model.map.PetMapVO;

public interface IPetMapDAO {
	public ArrayList<PetMapVO> getAllStationList();

	public ArrayList<PetMapVO> getStationsByCity();

	public ArrayList<PetMapVO> getStationsByBounds(Map<String, Object> bounds);
}
