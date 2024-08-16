package com.spring_boot_allmypet.project.model.market;

public class OrderInfoVO {
	public String ordNo;
	public String ordDate;
	public String memId;
	public String ordReceiver;
	public String ordAddress;
	public String ordHP;
	public String ordMsg;
	public String ordPay;
	public boolean ordState;
	
	public String getOrdNo() {
		return ordNo;
	}
	public void setOrdNo(String ordNo) {
		this.ordNo = ordNo;
	}
	public String getOrdDate() {
		return ordDate;
	}
	public void setOrdDate(String ordDate) {
		this.ordDate = ordDate;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getOrdReceiver() {
		return ordReceiver;
	}
	public void setOrdReceiver(String ordReceiver) {
		this.ordReceiver = ordReceiver;
	}
	public String getOrdAddress() {
		return ordAddress;
	}
	public void setOrdAddress(String ordAddress) {
		this.ordAddress = ordAddress;
	}
	public String getOrdHP() {
		return ordHP;
	}
	public void setOrdHP(String ordHP) {
		this.ordHP = ordHP;
	}
	public String getOrdMsg() {
		return ordMsg;
	}
	public void setOrdMsg(String ordMsg) {
		this.ordMsg = ordMsg;
	}
	public String getOrdPay() {
		return ordPay;
	}
	public void setOrdPay(String ordPay) {
		this.ordPay = ordPay;
	}
	public boolean isOrdState() {
		return ordState;
	}
	public void setOrdState(boolean ordState) {
		this.ordState = ordState;
	}
}
