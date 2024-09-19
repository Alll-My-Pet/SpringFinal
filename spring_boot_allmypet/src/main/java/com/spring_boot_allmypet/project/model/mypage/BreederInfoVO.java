package com.spring_boot_allmypet.project.model.mypage;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class BreederInfoVO {
	private String mgtNo;
	private String memId; 
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date apvPermYmd;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date apvCancelYmd;
	private String bplcNm; 
	private String siteTel; 
	private String rdnPostNo;
	private String rdnWhlAddr; 
	private String rdnWhlAddrdetail;
	
	public String getMgtNo() {
		return mgtNo;
	}
	public void setMgtNo(String mgtNo) {
		this.mgtNo = mgtNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public Date getApvPermYmd() {
		return apvPermYmd;
	}
	public void setApvPermYmd(Date apvPermYmd) {
		this.apvPermYmd = apvPermYmd;
	}
	public Date getApvCancelYmd() {
		return apvCancelYmd;
	}
	public void setApvCancelYmd(Date apvCancelYmd) {
		this.apvCancelYmd = apvCancelYmd;
	}
	public String getBplcNm() {
		return bplcNm;
	}
	public void setBplcNm(String bplcNm) {
		this.bplcNm = bplcNm;
	}
	public String getSiteTel() {
		return siteTel;
	}
	public void setSiteTel(String siteTel) {
		this.siteTel = siteTel;
	}
	public String getRdnPostNo() {
		return rdnPostNo;
	}
	public void setRdnPostNo(String rdnPostNo) {
		this.rdnPostNo = rdnPostNo;
	}
	public String getRdnWhlAddr() {
		return rdnWhlAddr;
	}
	public void setRdnWhlAddr(String rdnWhlAddr) {
		this.rdnWhlAddr = rdnWhlAddr;
	}
	public String getRdnWhlAddrdetail() {
		return rdnWhlAddrdetail;
	}
	public void setRdnWhlAddrdetail(String rdnWhlAddrdetail) {
		this.rdnWhlAddrdetail = rdnWhlAddrdetail;
	}
}
