package com.spring_boot_allmypet.project.service.animal;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.dao.animal.IAnimalDAO;
import com.spring_boot_allmypet.project.model.animal.AnimalCtgVO;

@Service
public class AnimalService implements IAnimalService {
	@Autowired
	@Qualifier("IAnimalDAO")
	IAnimalDAO dao;

	@Override
	public ArrayList<AnimalCtgVO> ctgListPet(String petCtgNo) {
		return dao.ctgListPet(petCtgNo);
	}

}
