package com.spring_boot_allmypet.project.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ProtectVO {
	private int postNo;
	private int headerNo;
	private String memId;
	private String memNickName;
	private String postTitle;
	private String postContent;
	private String postImg;
	private Date postDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private int postLike;
	private int postView;
	private String companyName;
	private String lossLocation;
	private String lossPet;
	
	public String getLossLocation() {
		return lossLocation;
	}
	public void setLossLocation(String lossLocation) {
		this.lossLocation = lossLocation;
	}
	public String getLossPet() {
		return lossPet;
	}
	public void setLossPet(String lossPet) {
		this.lossPet = lossPet;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public Date getPostDate() {
		return postDate;
	}
	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	public int getPostLike() {
		return postLike;
	}
	public void setPostLike(int postLike) {
		this.postLike = postLike;
	}
	public int getPostView() {
		return postView;
	}
	public void setPostView(int postView) {
		this.postView = postView;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public int getHeaderNo() {
		return headerNo;
	}
	public void setHeaderNo(int headerNo) {
		this.headerNo = headerNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public String getPostImg() {
		return postImg;
	}
	public void setPostImg(String postImg) {
		this.postImg = postImg;
	}
	public String getMemNickName() {
		return memNickName;
	}
	public void setMemNickName(String memNickName) {
		this.memNickName = memNickName;
	}
	
}
