package com.spring_boot_allmypet.project.model.market;

import com.spring_boot_allmypet.project.model.member.MemberVO;

public class ReviewVO {
	public int revNo;
	public String prdNo;
	public String memId;
	public String revDate;
	public String revImg;
	public String revText;
	public String revSco;
	public MemberVO member;
	
	public MemberVO getMember() {
		return member;
	}
	public void setMember(MemberVO member) {
		this.member = member;
	}
	public int getRevNo() {
		return revNo;
	}
	public void setRevNo(int revNo) {
		this.revNo = revNo;
	}
	public String getPrdNo() {
		return prdNo;
	}
	public void setPrdNo(String prdNo) {
		this.prdNo = prdNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getRevDate() {
		return revDate;
	}
	public void setRevDate(String revDate) {
		this.revDate = revDate;
	}
	public String getRevImg() {
		return revImg;
	}
	public void setRevImg(String revImg) {
		this.revImg = revImg;
	}
	public String getRevText() {
		return revText;
	}
	public void setRevText(String revText) {
		this.revText = revText;
	}
	public String getRevSco() {
		return revSco;
	}
	public void setRevSco(String revSco) {
		this.revSco = revSco;
	}
	
	
	
}
