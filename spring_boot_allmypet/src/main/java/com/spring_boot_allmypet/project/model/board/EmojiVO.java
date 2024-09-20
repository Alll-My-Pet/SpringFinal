package com.spring_boot_allmypet.project.model.board;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class EmojiVO {
	private int emoNo;
	private String memId;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date emoDate;
	private String emoSale;
	private String emoImg;
	private String emoName;
	private String approvalStatus;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date approvalDate;
	
	public int getEmoNo() {
		return emoNo;
	}
	public void setEmoNo(int emoNo) {
		this.emoNo = emoNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public Date getEmoDate() {
		return emoDate;
	}
	public void setEmoDate(Date emoDate) {
		this.emoDate = emoDate;
	}
	public String getEmoSale() {
		return emoSale;
	}
	public void setEmoSale(String emoSale) {
		this.emoSale = emoSale;
	}
	public String getEmoImg() {
		return emoImg;
	}
	public void setEmoImg(String emoImg) {
		this.emoImg = emoImg;
	}
	public String getEmoName() {
		return emoName;
	}
	public void setEmoName(String emoName) {
		this.emoName = emoName;
	}
	public String getApprovalStatus() {
		return approvalStatus;
	}
	public void setApprovalStatus(String approvalStatus) {
		this.approvalStatus = approvalStatus;
	}
	public Date getApprovalDate() {
		return approvalDate;
	}
	public void setApprovalDate(Date approvalDate) {
		this.approvalDate = approvalDate;
	}

}
