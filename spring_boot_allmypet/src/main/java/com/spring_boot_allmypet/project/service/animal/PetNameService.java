package com.spring_boot_allmypet.project.service.animal;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_allmypet.project.dao.animal.IPetNameDAO;
import com.spring_boot_allmypet.project.model.animal.PetNameVO;

@Service
public class PetNameService implements IPetNameService {
	@Autowired
	@Qualifier("IPetNameDAO")
	IPetNameDAO dao;

	@Override
	public String getColorGroup(String specificColor) {
		return dao.getColorGroup(specificColor);
	}

	@Override
	public List<PetNameVO> getPetNames(String colorGroup, String petGender) {
		return dao.getPetNames(colorGroup, petGender);
	}

}
