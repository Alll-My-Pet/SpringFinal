package com.spring_boot_allmypet.project.service.map;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.dao.map.IPetMapDAO;
import com.spring_boot_allmypet.project.model.map.PetMapVO;

@Service
public class PetMapService {
	@Autowired
	@Qualifier("IPetMapDAO")
	IPetMapDAO dao;
	
	public ArrayList<PetMapVO> getAllStationList() {
		return dao.getAllStationList();
	}
	


	public ArrayList<PetMapVO> getStationsByCity(String cityName) {
		return dao.getStationsByCity();
	}



    public ArrayList<PetMapVO> getStationsByBounds(HashMap<String, Object> bounds) {
        return dao.getStationsByBounds(bounds);
    }
}
