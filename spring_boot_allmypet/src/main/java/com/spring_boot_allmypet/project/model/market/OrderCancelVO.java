package com.spring_boot_allmypet.project.model.market;

public class OrderCancelVO {
    private int ordCancelNo;
    private int ordNo;
    private String prdNo;
    private int ordQty;
    private String canReason;

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
}