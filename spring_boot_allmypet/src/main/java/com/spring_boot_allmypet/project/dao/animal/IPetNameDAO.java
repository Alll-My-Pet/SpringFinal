package com.spring_boot_allmypet.project.dao.animal;

import java.util.List;

import com.spring_boot_allmypet.project.model.animal.PetNameVO;

public interface IPetNameDAO {
	// 색깔군 정하는 함수
	public String getColorGroup(String specificColor);
	
	// 반려동물 이름 정하는 함수
	public List<PetNameVO> getPetNames(String colorGroup, String petGender);
}
