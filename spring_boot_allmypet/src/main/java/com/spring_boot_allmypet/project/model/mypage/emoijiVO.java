package com.spring_boot_allmypet.project.model.mypage;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class emoijiVO {
	private String memId;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date emoDate;
	private String emoSale;
	private String emoImg;
	private String emoName;
	
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
}
