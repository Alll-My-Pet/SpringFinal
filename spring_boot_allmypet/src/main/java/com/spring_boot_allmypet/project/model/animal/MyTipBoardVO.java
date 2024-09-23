package com.spring_boot_allmypet.project.model.animal;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class MyTipBoardVO {
	private int postNo;
	private String petCtgNo;
	private String postTitle;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
	private Date postDate;
	private String memId;
	private String memNickName;
	private String postContent;
	private int postLike;
	private int postView;
	private String boardCtgNo;
	private MultipartFile postImg; // 수정
	private byte[] postImgBytes; // 데이터베이스에 저장할 바이트 배열

	public int getPostView() {
		return postView;
	}

	public void setPostView(int postView) {
		this.postView = postView;
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


	public MultipartFile getPostImg() {
		return postImg;
	}

	public void setPostImg(MultipartFile postImg) {
		this.postImg = postImg;
	}

	public byte[] getPostImgBytes() {
		return postImgBytes;
	}

	public void setPostImgBytes(byte[] postImgBytes) {
		this.postImgBytes = postImgBytes;
	}

	public String getMemNickName() {
		return memNickName;
	}

	public void setMemNickName(String memNickName) {
		this.memNickName = memNickName;
	}

	public String getBoardCtgNo() {
		return boardCtgNo;
	}

	public void setBoardCtgNo(String boardCtgNo) {
		this.boardCtgNo = boardCtgNo;
	}

}
