package com.spring_boot_allmypet.project.model.animal;

public class AnmialCtgVO {
	private int petCtgNo;
	private String petCtgName;
	
	public AnmialCtgVO(int petCtgNo, String petCtgName) {
		this.petCtgNo = petCtgNo;
		this.petCtgName = petCtgName;
	}

	public int getPetCtgNo() {
		return petCtgNo;
	}

	public void setPetCtgNo(int petCtgNo) {
		this.petCtgNo = petCtgNo;
	}

	public String getPetCtgName() {
		return petCtgName;
	}

	public void setPetCtgName(String petCtgName) {
		this.petCtgName = petCtgName;
	}
	
	
}
