package com.spring_boot_allmypet.project.model.market;

public class OrderProductVO {
	public int ordProductNo;
	public int ordNo;
	public String prdNo;
	public int ordQty;
	public ProductVO productDetails;
	
	public ProductVO getProductDetails() {
		return productDetails;
	}
	public void setProductDetails(ProductVO productDetails) {
		this.productDetails = productDetails;
	}
	public int getOrdProductNo() {
		return ordProductNo;
	}
	public void setOrdProductNo(int ordProductNo) {
		this.ordProductNo = ordProductNo;
	}
	public int getOrdNo() {
		return ordNo;
	}
	public void setOrdNo(int ordNo) {
		this.ordNo = ordNo;
	}
	public String getPrdNo() {
		return prdNo;
	}
	public void setPrdNo(String prdNo) {
		this.prdNo = prdNo;
	}
	public int getOrdQty() {
		return ordQty;
	}
	public void setOrdQty(int ordQty) {
		this.ordQty = ordQty;
	}
	
	
	
}
