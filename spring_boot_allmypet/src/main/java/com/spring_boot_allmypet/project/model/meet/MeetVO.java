package com.spring_boot_allmypet.project.model.meet;

import java.util.List;

public class MeetVO {
	public int meetNo;
	public String meetName;
	public String petCtgNo;
	public String addressRegion;
	public String addressDo;
	public String addressSiGunGu;
	public boolean meetType;
	public int meetMember;
	public String meetImg;
	public String meetContent;
	
	
	public int getMeetNo() {
		return meetNo;
	}
	public void setMeetNo(int meetNo) {
		this.meetNo = meetNo;
	}
	public String getMeetName() {
		return meetName;
	}
	public void setMeetName(String meetName) {
		this.meetName = meetName;
	}
	public String getPetCtgNo() {
		return petCtgNo;
	}
	public void setPetCtgNo(String petCtgNo) {
		this.petCtgNo = petCtgNo;
	}
	public String getAddressRegion() {
		return addressRegion;
	}
	public void setAddressRegion(String addressRegion) {
		this.addressRegion = addressRegion;
	}
	public String getAddressDo() {
		return addressDo;
	}
	public void setAddressDo(String addressDo) {
		this.addressDo = addressDo;
	}
	public String getAddressSiGunGu() {
		return addressSiGunGu;
	}
	public void setAddressSiGunGu(String addressSiGunGu) {
		this.addressSiGunGu = addressSiGunGu;
	}
	public boolean isMeetType() {
		return meetType;
	}
	public void setMeetType(boolean meetType) {
		this.meetType = meetType;
	}
	public int getMeetMember() {
		return meetMember;
	}
	public void setMeetMember(int meetMember) {
		this.meetMember = meetMember;
	}
	public String getMeetImg() {
		return meetImg;
	}
	public void setMeetImg(String meetImg) {
		this.meetImg = meetImg;
	}
	public String getMeetContent() {
		return meetContent;
	}
	public void setMeetContent(String meetContent) {
		this.meetContent = meetContent;
	}
	
	
	
}
