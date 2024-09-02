package com.spring_boot_allmypet.project.model.gallery;

import com.spring_boot_allmypet.project.model.member.MemberVO;

public class GalleryVO {
	public int postNo;
	public String petCtgNo;
	public String postTitle;
	public String postDate;
	public String memId;
	public String postContent;
	public String postImg;
	public String postLike;
	public MemberVO member;

	
	public MemberVO getMember() {
		return member;
	}

	public void setMember(MemberVO member) {
		this.member = member;
	}
	
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getPetCtgNo() {
		return petCtgNo;
	}
	public void setPetCtgNo(String petCtgNo) {
		this.petCtgNo = petCtgNo;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostDate() {
		return postDate;
	}
	public void setPostDate(String postDate) {
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
	public String getPostImg() {
		return postImg;
	}
	public void setPostImg(String postImg) {
		this.postImg = postImg;
	}
	public String getPostLike() {
		return postLike;
	}
	public void setPostLike(String postLike) {
		this.postLike = postLike;
	}
	
}
