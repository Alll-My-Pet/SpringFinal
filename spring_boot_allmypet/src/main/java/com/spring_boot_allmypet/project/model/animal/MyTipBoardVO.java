package com.spring_boot_allmypet.project.model.animal;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MyTipBoardVO {
	private int tipNo;
    private String petCtgNo;
    private int postNo;
    private String postTitle;
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
    private Date postDate;
    private String memId;
    private String postContent;
    private int postLike;
    private String postImg;
    
	public int getTipNo() {
		return tipNo;
	}
	public void setTipNo(int tipNo) {
		this.tipNo = tipNo;
	}
	public String getPetCtgNo() {
		return petCtgNo;
	}
	public void setPetCtgNo(String petCtgNo) {
		this.petCtgNo = petCtgNo;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public Date getPostDate() {
		return postDate;
	}
	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public int getPostLike() {
		return postLike;
	}
	public void setPostLike(int postLike) {
		this.postLike = postLike;
	}
	public String getPostImg() {
		return postImg;
	}
	public void setPostImg(String postImg) {
		this.postImg = postImg;
	}
    
	
}
