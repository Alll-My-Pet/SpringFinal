package com.spring_boot_allmypet.project.model.mypage;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class BlockListVO {
	private String blocker_memId;
	private String blocked_memId;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date timestamp;
	private String block_reason;
	
	public String getBlocker_memId() {
		return blocker_memId;
	}
	public void setBlocker_memId(String blocker_memId) {
		this.blocker_memId = blocker_memId;
	}
	public String getBlocked_memId() {
		return blocked_memId;
	}
	public void setBlocked_memId(String blocked_memId) {
		this.blocked_memId = blocked_memId;
	}
	public Date getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}
	public String getBlock_reason() {
		return block_reason;
	}
	public void setBlock_reason(String block_reason) {
		this.block_reason = block_reason;
	}
	
}
