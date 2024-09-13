package com.spring_boot_allmypet.project.model.comment;


public class CommentVO {
	public int commentId;
	public int postNo;
	public String boardCtgNo;
	public String memId;
	public String commentDate;
	public String commentText;
	public int emojiNo;
	public int commentlike;
	
	
	public int getCommentlike() {
		return commentlike;
	}
	public void setCommentlike(int commentlike) {
		this.commentlike = commentlike;
	}
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getBoardCtgNo() {
		return boardCtgNo;
	}
	public void setBoardCtgNo(String boardCtgNo) {
		this.boardCtgNo = boardCtgNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	public String getCommentText() {
		return commentText;
	}
	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}
	public int getEmojiNo() {
		return emojiNo;
	}
	public void setEmojiNo(int emojiNo) {
		this.emojiNo = emojiNo;
	}
	
	
}
