package com.spring_boot_allmypet.project.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class BoardVO {
	  private String bodNo;
	  private String bodTitle;
	  private String memId;
	  private Date bodDate;
	  @DateTimeFormat(pattern="yyyy-MM-dd")
	  private String bodView;
	  private String bodLike;
	  private String bodText;
	  
	  
	  public String getBodNo() {
		return bodNo;
	}
	public void setBodNo(String bodNo) {
		this.bodNo = bodNo;
	}
	public String getBodTitle() {
		return bodTitle;
	}
	public void setBodTitle(String bodTitle) {
		this.bodTitle = bodTitle;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public Date getBodDate() {
		return bodDate;
	}
	public void setBodDate(Date bodDate) {
		this.bodDate = bodDate;
	}
	public String getBodView() {
		return bodView;
	}
	public void setBodView(String bodView) {
		this.bodView = bodView;
	}
	public String getBodLike() {
		return bodLike;
	}
	public void setBodLike(String bodLike) {
		this.bodLike = bodLike;
	}
	public String getBodText() {
		return bodText;
	}
	public void setBodText(String bodText) {
		this.bodText = bodText;
	}
	

}
