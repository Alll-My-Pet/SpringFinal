package com.spring_boot_allmypet.project.model.member;

public class MemberPointVO {
	private int id;
	private String memId;
	private int point_change;
	private String reason;
	private String change_date;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public int getPoint_change() {
		return point_change;
	}
	public void setPoint_change(int point_change) {
		this.point_change = point_change;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getChange_date() {
		return change_date;
	}
	public void setChange_date(String change_date) {
		this.change_date = change_date;
	}

}
