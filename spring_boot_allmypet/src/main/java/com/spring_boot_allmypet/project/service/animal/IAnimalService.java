package com.spring_boot_allmypet.project.service.animal;

import java.util.ArrayList;

import com.spring_boot_allmypet.project.model.animal.AnimalCtgVO;

public interface IAnimalService {
	
	// petCtgNo가져옴
	public ArrayList<AnimalCtgVO> ctgListPet(String petCtgNo);
	
	
}
