package com.spring_boot_allmypet.project.model.market;

import java.util.List;

public class OrderInfoVO {
	public int ordNo;
	public String ordDate;
	public String memId;
	public String ordName;
	public String ordReceiver;
	public String ordAddress;
	public String ordHP;
	public String ordMsg;
	public String ordPay;
	public int ordPrice;
	public boolean ordState;
	public ProductVO product;
	private List<OrderProductVO> orderProducts;
	
	public List<OrderProductVO> getOrderProducts() {
		return orderProducts;
	}
	public void setOrderProducts(List<OrderProductVO> orderProducts) {
		this.orderProducts = orderProducts;
	}
	
	public ProductVO getProduct() {
		return product;
	}
	public void setProduct(ProductVO product) {
		this.product = product;
	}
	
	public int getOrdNo() {
		return ordNo;
	}
	public void setOrdNo(int ordNo) {
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
	public String getOrdName() {
		return ordName;
	}
	public void setOrdName(String ordName) {
		this.ordName = ordName;
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
	public int getOrdPrice() {
		return ordPrice;
	}
	public void setOrdPrice(int ordPrice) {
		this.ordPrice = ordPrice;
	}
	public boolean isOrdState() {
		return ordState;
	}
	public void setOrdState(boolean ordState) {
		this.ordState = ordState;
	}
	
	
}
