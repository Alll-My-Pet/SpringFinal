package com.spring_boot_allmypet.project.dao.animal;

import java.util.ArrayList;

import com.spring_boot_allmypet.project.model.animal.AnimalCtgVO;

public interface IAnimalDAO {
	public ArrayList<AnimalCtgVO> ctgListPet(String petCtgNo);
}
