package com.spring_boot_allmypet.project.model.market;

import java.util.Date;
import java.util.List;

public class OrderCancelVO {
    private int ordCancelNo;
    private int ordNo;
    private String prdNo;
    private int ordQty;
    private int ordPrice;
    private String ordDate;
	private String memId;
	private String canReason;
	private List<OrderProductVO> orderProducts;
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	
    public int getOrdPrice() {
		return ordPrice;
	}
	public void setOrdPrice(int ordPrice) {
		this.ordPrice = ordPrice;
	}
	public String getOrdDate() {
		return ordDate;
	}
	public void setOrdDate(String ordDate) {
		this.ordDate = ordDate;
	}
    public int getOrdCancelNo() { return ordCancelNo; }
    public void setOrdCancelNo(int ordCancelNo) { this.ordCancelNo = ordCancelNo; }

    public int getOrdNo() { return ordNo; }
    public void setOrdNo(int ordNo) { this.ordNo = ordNo; }

    public String getPrdNo() { return prdNo; }
    public void setPrdNo(String prdNo) { this.prdNo = prdNo; }

    public int getOrdQty() { return ordQty; }
    public void setOrdQty(int ordQty) { this.ordQty = ordQty; }

    public String getCanReason() { return canReason; }
    public void setCanReason(String canReason) { this.canReason = canReason; }
	
    public List<OrderProductVO> getOrderProducts() {
		return orderProducts;
	}
	public void setOrderProducts(List<OrderProductVO> orderProducts) {
		this.orderProducts = orderProducts;
	}
}