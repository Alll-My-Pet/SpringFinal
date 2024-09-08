package com.spring_boot_allmypet.project.model.animal;

public class PetNameRequestVO {
	private String petType;
	private String petColor;
	private String petGender;

	public PetNameRequestVO(String petType, String petColor, String petGender) {
		super();
		this.petType = petType;
		this.petColor = petColor;
		this.petGender = petGender;
	}

	public String getPetType() {
		return petType;
	}

	public void setPetType(String petType) {
		this.petType = petType;
	}

	public String getPetColor() {
		return petColor;
	}

	public void setPetColor(String petColor) {
		this.petColor = petColor;
	}

	public String getPetGender() {
		return petGender;
	}

	public void setPetGender(String petGender) {
		this.petGender = petGender;
	}

}
