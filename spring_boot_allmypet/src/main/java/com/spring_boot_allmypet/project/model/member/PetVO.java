package com.spring_boot_allmypet.project.model.member;

import java.util.List;

public class PetVO {
	private String petNo;
	private String petSpecies; 
	private String petName; 
	private String birth; 
	private String petCtgNo;
	private boolean rep_pet;
	private String memId;
	private List<PetVO> petVOs;
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public List<PetVO> getPetVOs() {
		return petVOs;
	}
	public void setPetVOs(List<PetVO> petVOs) {
		this.petVOs = petVOs;
	}
	public PetVO() {
        // 기본 생성자
    }
	public String getPetNo() {
		return petNo;
	}
	public void setPetNo(String petNo) {
		this.petNo = petNo;
	}
	public String getPetSpecies() {
		return petSpecies;
	}
	public void setPetSpecies(String petSpecies) {
		this.petSpecies = petSpecies;
	}
	public String getPetName() {
		return petName;
	}
	public void setPetName(String petName) {
		this.petName = petName;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPetCtgNo() {
		return petCtgNo;
	}
	public void setPetCtgNo(String petCtgNo) {
		this.petCtgNo = petCtgNo;
	}
	public boolean getRep_pet() {
		return rep_pet;
	}
	public void setRep_pet(boolean rep_pet) {
		this.rep_pet = rep_pet;
	}
}
