package com.spring_boot_allmypet.project.model.mypage;

import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlElementWrapper;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;

import java.util.List;

public class AnimalDealers {

    @JacksonXmlProperty(localName = "header")
    private Header header;

    @JacksonXmlProperty(localName = "body")
    private Body body;

    // Getters and Setters for header and body
    public Header getHeader() {
        return header;
    }

    public void setHeader(Header header) {
        this.header = header;
    }

    public Body getBody() {
        return body;
    }

    public void setBody(Body body) {
        this.body = body;
    }

    public static class Header {
        @JacksonXmlProperty(localName = "columns")
        private Columns columns;

        @JacksonXmlProperty(localName = "paging")
        private Paging paging;

        // Getters and Setters for columns and paging
        public Columns getColumns() {
            return columns;
        }

        public void setColumns(Columns columns) {
            this.columns = columns;
        }

        public Paging getPaging() {
            return paging;
        }

        public void setPaging(Paging paging) {
            this.paging = paging;
        }
    }

    public static class Columns {
        @JacksonXmlProperty(localName = "opnSvcNm")
        private String opnSvcNm;

        @JacksonXmlProperty(localName = "opnSvcId")
        private String opnSvcId;

        @JacksonXmlProperty(localName = "opnSfTeamCode")
        private String opnSfTeamCode;

        @JacksonXmlProperty(localName = "mgtNo")
        private String mgtNo;

        @JacksonXmlProperty(localName = "apvPermYmd")
        private String apvPermYmd;

        @JacksonXmlProperty(localName = "apvCancelYmd")
        private String apvCancelYmd;

        @JacksonXmlProperty(localName = "trdStateGbn")
        private String trdStateGbn;

        @JacksonXmlProperty(localName = "trdStateNm")
        private String trdStateNm;

        @JacksonXmlProperty(localName = "dtlStateGbn")
        private String dtlStateGbn;

        @JacksonXmlProperty(localName = "dtlStateNm")
        private String dtlStateNm;

        @JacksonXmlProperty(localName = "dcbYmd")
        private String dcbYmd;

        @JacksonXmlProperty(localName = "clgStdt")
        private String clgStdt;

        @JacksonXmlProperty(localName = "clgEnddt")
        private String clgEnddt;

        @JacksonXmlProperty(localName = "ropnYmd")
        private String ropnYmd;

        @JacksonXmlProperty(localName = "siteTel")
        private String siteTel;

        @JacksonXmlProperty(localName = "siteArea")
        private String siteArea;

        @JacksonXmlProperty(localName = "sitePostNo")
        private String sitePostNo;

        @JacksonXmlProperty(localName = "siteWhlAddr")
        private String siteWhlAddr;

        @JacksonXmlProperty(localName = "rdnWhlAddr")
        private String rdnWhlAddr;

        @JacksonXmlProperty(localName = "rdnPostNo")
        private String rdnPostNo;

        @JacksonXmlProperty(localName = "bplcNm")
        private String bplcNm;

        @JacksonXmlProperty(localName = "lastModTs")
        private String lastModTs;

        @JacksonXmlProperty(localName = "updateGbn")
        private String updateGbn;

        @JacksonXmlProperty(localName = "updateDt")
        private String updateDt;

        @JacksonXmlProperty(localName = "uptaeNm")
        private String uptaeNm;

        @JacksonXmlProperty(localName = "x")
        private String x;

        @JacksonXmlProperty(localName = "y")
        private String y;

        @JacksonXmlProperty(localName = "lindJobGbnNm")
        private String lindJobGbnNm;

        @JacksonXmlProperty(localName = "lindPrcbGbnNm")
        private String lindPrcbGbnNm;

        @JacksonXmlProperty(localName = "rgtMbdSno")
        private String rgtMbdSno;

        @JacksonXmlProperty(localName = "totEpNum")
        private String totEpNum;

        // Getters and Setters for each field
        public String getOpnSvcNm() {
            return opnSvcNm;
        }

        public void setOpnSvcNm(String opnSvcNm) {
            this.opnSvcNm = opnSvcNm;
        }

        public String getOpnSvcId() {
            return opnSvcId;
        }

        public void setOpnSvcId(String opnSvcId) {
            this.opnSvcId = opnSvcId;
        }

        public String getOpnSfTeamCode() {
            return opnSfTeamCode;
        }

        public void setOpnSfTeamCode(String opnSfTeamCode) {
            this.opnSfTeamCode = opnSfTeamCode;
        }

        public String getMgtNo() {
            return mgtNo;
        }

        public void setMgtNo(String mgtNo) {
            this.mgtNo = mgtNo;
        }

        public String getApvPermYmd() {
            return apvPermYmd;
        }

        public void setApvPermYmd(String apvPermYmd) {
            this.apvPermYmd = apvPermYmd;
        }

        public String getApvCancelYmd() {
            return apvCancelYmd;
        }

        public void setApvCancelYmd(String apvCancelYmd) {
            this.apvCancelYmd = apvCancelYmd;
        }

        public String getTrdStateGbn() {
            return trdStateGbn;
        }

        public void setTrdStateGbn(String trdStateGbn) {
            this.trdStateGbn = trdStateGbn;
        }

        public String getTrdStateNm() {
            return trdStateNm;
        }

        public void setTrdStateNm(String trdStateNm) {
            this.trdStateNm = trdStateNm;
        }

        public String getDtlStateGbn() {
            return dtlStateGbn;
        }

        public void setDtlStateGbn(String dtlStateGbn) {
            this.dtlStateGbn = dtlStateGbn;
        }

        public String getDtlStateNm() {
            return dtlStateNm;
        }

        public void setDtlStateNm(String dtlStateNm) {
            this.dtlStateNm = dtlStateNm;
        }

        public String getDcbYmd() {
            return dcbYmd;
        }

        public void setDcbYmd(String dcbYmd) {
            this.dcbYmd = dcbYmd;
        }

        public String getClgStdt() {
            return clgStdt;
        }

        public void setClgStdt(String clgStdt) {
            this.clgStdt = clgStdt;
        }

        public String getClgEnddt() {
            return clgEnddt;
        }

        public void setClgEnddt(String clgEnddt) {
            this.clgEnddt = clgEnddt;
        }

        public String getRopnYmd() {
            return ropnYmd;
        }

        public void setRopnYmd(String ropnYmd) {
            this.ropnYmd = ropnYmd;
        }

        public String getSiteTel() {
            return siteTel;
        }

        public void setSiteTel(String siteTel) {
            this.siteTel = siteTel;
        }

        public String getSiteArea() {
            return siteArea;
        }

        public void setSiteArea(String siteArea) {
            this.siteArea = siteArea;
        }

        public String getSitePostNo() {
            return sitePostNo;
        }

        public void setSitePostNo(String sitePostNo) {
            this.sitePostNo = sitePostNo;
        }

        public String getSiteWhlAddr() {
            return siteWhlAddr;
        }

        public void setSiteWhlAddr(String siteWhlAddr) {
            this.siteWhlAddr = siteWhlAddr;
        }

        public String getRdnWhlAddr() {
            return rdnWhlAddr;
        }

        public void setRdnWhlAddr(String rdnWhlAddr) {
            this.rdnWhlAddr = rdnWhlAddr;
        }

        public String getRdnPostNo() {
            return rdnPostNo;
        }

        public void setRdnPostNo(String rdnPostNo) {
            this.rdnPostNo = rdnPostNo;
        }

        public String getBplcNm() {
            return bplcNm;
        }

        public void setBplcNm(String bplcNm) {
            this.bplcNm = bplcNm;
        }

        public String getLastModTs() {
            return lastModTs;
        }

        public void setLastModTs(String lastModTs) {
            this.lastModTs = lastModTs;
        }

        public String getUpdateGbn() {
            return updateGbn;
        }

        public void setUpdateGbn(String updateGbn) {
            this.updateGbn = updateGbn;
        }

        public String getUpdateDt() {
            return updateDt;
        }

        public void setUpdateDt(String updateDt) {
            this.updateDt = updateDt;
        }

        public String getUptaeNm() {
            return uptaeNm;
        }

        public void setUptaeNm(String uptaeNm) {
            this.uptaeNm = uptaeNm;
        }

        public String getX() {
            return x;
        }

        public void setX(String x) {
            this.x = x;
        }

        public String getY() {
            return y;
        }

        public void setY(String y) {
            this.y = y;
        }

        public String getLindJobGbnNm() {
            return lindJobGbnNm;
        }

        public void setLindJobGbnNm(String lindJobGbnNm) {
            this.lindJobGbnNm = lindJobGbnNm;
        }

        public String getLindPrcbGbnNm() {
            return lindPrcbGbnNm;
        }

        public void setLindPrcbGbnNm(String lindPrcbGbnNm) {
            this.lindPrcbGbnNm = lindPrcbGbnNm;
        }

        public String getRgtMbdSno() {
            return rgtMbdSno;
        }

        public void setRgtMbdSno(String rgtMbdSno) {
            this.rgtMbdSno = rgtMbdSno;
        }

        public String getTotEpNum() {
            return totEpNum;
        }

        public void setTotEpNum(String totEpNum) {
            this.totEpNum = totEpNum;
        }
    }

    public static class Paging {
        @JacksonXmlProperty(localName = "pageIndex")
        private int pageIndex;

        @JacksonXmlProperty(localName = "totalCount")
        private int totalCount;

        @JacksonXmlProperty(localName = "pageSize")
        private int pageSize;

        // Getters and Setters for paging fields
        public int getPageIndex() {
            return pageIndex;
        }

        public void setPageIndex(int pageIndex) {
            this.pageIndex = pageIndex;
        }

        public int getTotalCount() {
            return totalCount;
        }

        public void setTotalCount(int totalCount) {
            this.totalCount = totalCount;
        }

        public int getPageSize() {
            return pageSize;
        }

        public void setPageSize(int pageSize) {
            this.pageSize = pageSize;
        }
    }

    public static class Body {
        @JacksonXmlElementWrapper(localName = "rows")
        @JacksonXmlProperty(localName = "row")
        private List<Row> rows;

        // Getters and Setters for rows
        public List<Row> getRows() {
            return rows;
        }

        public void setRows(List<Row> rows) {
            this.rows = rows;
        }
    }

    public static class Row {
        @JacksonXmlProperty(localName = "rowNum")
        private int rowNum;

        @JacksonXmlProperty(localName = "opnSvcNm")
        private String opnSvcNm;

        @JacksonXmlProperty(localName = "opnSvcId")
        private String opnSvcId;

        @JacksonXmlProperty(localName = "opnSfTeamCode")
        private String opnSfTeamCode;

        @JacksonXmlProperty(localName = "mgtNo")
        private String mgtNo;

        @JacksonXmlProperty(localName = "apvPermYmd")
        private String apvPermYmd;

        @JacksonXmlProperty(localName = "apvCancelYmd")
        private String apvCancelYmd;

        @JacksonXmlProperty(localName = "trdStateGbn")
        private String trdStateGbn;

        @JacksonXmlProperty(localName = "trdStateNm")
        private String trdStateNm;

        @JacksonXmlProperty(localName = "dtlStateGbn")
        private String dtlStateGbn;

        @JacksonXmlProperty(localName = "dtlStateNm")
        private String dtlStateNm;

        @JacksonXmlProperty(localName = "dcbYmd")
        private String dcbYmd;

        @JacksonXmlProperty(localName = "clgStdt")
        private String clgStdt;

        @JacksonXmlProperty(localName = "clgEnddt")
        private String clgEnddt;

        @JacksonXmlProperty(localName = "ropnYmd")
        private String ropnYmd;

        @JacksonXmlProperty(localName = "siteTel")
        private String siteTel;

        @JacksonXmlProperty(localName = "siteArea")
        private String siteArea;

        @JacksonXmlProperty(localName = "sitePostNo")
        private String sitePostNo;

        @JacksonXmlProperty(localName = "siteWhlAddr")
        private String siteWhlAddr;

        @JacksonXmlProperty(localName = "rdnWhlAddr")
        private String rdnWhlAddr;

        @JacksonXmlProperty(localName = "rdnPostNo")
        private String rdnPostNo;

        @JacksonXmlProperty(localName = "bplcNm")
        private String bplcNm;

        @JacksonXmlProperty(localName = "lastModTs")
        private String lastModTs;

        @JacksonXmlProperty(localName = "updateGbn")
        private String updateGbn;

        @JacksonXmlProperty(localName = "updateDt")
        private String updateDt;

        @JacksonXmlProperty(localName = "uptaeNm")
        private String uptaeNm;

        @JacksonXmlProperty(localName = "x")
        private String x;

        @JacksonXmlProperty(localName = "y")
        private String y;

        @JacksonXmlProperty(localName = "lindJobGbnNm")
        private String lindJobGbnNm;

        @JacksonXmlProperty(localName = "lindPrcbGbnNm")
        private String lindPrcbGbnNm;

        @JacksonXmlProperty(localName = "rgtMbdSno")
        private String rgtMbdSno;

        @JacksonXmlProperty(localName = "totEpNum")
        private String totEpNum;

        // Getters and Setters for each field
        public int getRowNum() {
            return rowNum;
        }

        public void setRowNum(int rowNum) {
            this.rowNum = rowNum;
        }

        public String getOpnSvcNm() {
            return opnSvcNm;
        }

        public void setOpnSvcNm(String opnSvcNm) {
            this.opnSvcNm = opnSvcNm;
        }

        public String getOpnSvcId() {
            return opnSvcId;
        }

        public void setOpnSvcId(String opnSvcId) {
            this.opnSvcId = opnSvcId;
        }

        public String getOpnSfTeamCode() {
            return opnSfTeamCode;
        }

        public void setOpnSfTeamCode(String opnSfTeamCode) {
            this.opnSfTeamCode = opnSfTeamCode;
        }

        public String getMgtNo() {
            return mgtNo;
        }

        public void setMgtNo(String mgtNo) {
            this.mgtNo = mgtNo;
        }

        public String getApvPermYmd() {
            return apvPermYmd;
        }

        public void setApvPermYmd(String apvPermYmd) {
            this.apvPermYmd = apvPermYmd;
        }

        public String getApvCancelYmd() {
            return apvCancelYmd;
        }

        public void setApvCancelYmd(String apvCancelYmd) {
            this.apvCancelYmd = apvCancelYmd;
        }

        public String getTrdStateGbn() {
            return trdStateGbn;
        }

        public void setTrdStateGbn(String trdStateGbn) {
            this.trdStateGbn = trdStateGbn;
        }

        public String getTrdStateNm() {
            return trdStateNm;
        }

        public void setTrdStateNm(String trdStateNm) {
            this.trdStateNm = trdStateNm;
        }

        public String getDtlStateGbn() {
            return dtlStateGbn;
        }

        public void setDtlStateGbn(String dtlStateGbn) {
            this.dtlStateGbn = dtlStateGbn;
        }

        public String getDtlStateNm() {
            return dtlStateNm;
        }

        public void setDtlStateNm(String dtlStateNm) {
            this.dtlStateNm = dtlStateNm;
        }

        public String getDcbYmd() {
            return dcbYmd;
        }

        public void setDcbYmd(String dcbYmd) {
            this.dcbYmd = dcbYmd;
        }

        public String getClgStdt() {
            return clgStdt;
        }

        public void setClgStdt(String clgStdt) {
            this.clgStdt = clgStdt;
        }

        public String getClgEnddt() {
            return clgEnddt;
        }

        public void setClgEnddt(String clgEnddt) {
            this.clgEnddt = clgEnddt;
        }

        public String getRopnYmd() {
            return ropnYmd;
        }

        public void setRopnYmd(String ropnYmd) {
            this.ropnYmd = ropnYmd;
        }

        public String getSiteTel() {
            return siteTel;
        }

        public void setSiteTel(String siteTel) {
            this.siteTel = siteTel;
        }

        public String getSiteArea() {
            return siteArea;
        }

        public void setSiteArea(String siteArea) {
            this.siteArea = siteArea;
        }

        public String getSitePostNo() {
            return sitePostNo;
        }

        public void setSitePostNo(String sitePostNo) {
            this.sitePostNo = sitePostNo;
        }

        public String getSiteWhlAddr() {
            return siteWhlAddr;
        }

        public void setSiteWhlAddr(String siteWhlAddr) {
            this.siteWhlAddr = siteWhlAddr;
        }

        public String getRdnWhlAddr() {
            return rdnWhlAddr;
        }

        public void setRdnWhlAddr(String rdnWhlAddr) {
            this.rdnWhlAddr = rdnWhlAddr;
        }

        public String getRdnPostNo() {
            return rdnPostNo;
        }

        public void setRdnPostNo(String rdnPostNo) {
            this.rdnPostNo = rdnPostNo;
        }

        public String getBplcNm() {
            return bplcNm;
        }

        public void setBplcNm(String bplcNm) {
            this.bplcNm = bplcNm;
        }

        public String getLastModTs() {
            return lastModTs;
        }

        public void setLastModTs(String lastModTs) {
            this.lastModTs = lastModTs;
        }

        public String getUpdateGbn() {
            return updateGbn;
        }

        public void setUpdateGbn(String updateGbn) {
            this.updateGbn = updateGbn;
        }

        public String getUpdateDt() {
            return updateDt;
        }

        public void setUpdateDt(String updateDt) {
            this.updateDt = updateDt;
        }

        public String getUptaeNm() {
            return uptaeNm;
        }

        public void setUptaeNm(String uptaeNm) {
            this.uptaeNm = uptaeNm;
        }

        public String getX() {
            return x;
        }

        public void setX(String x) {
            this.x = x;
        }

        public String getY() {
            return y;
        }

        public void setY(String y) {
            this.y = y;
        }

        public String getLindJobGbnNm() {
            return lindJobGbnNm;
        }

        public void setLindJobGbnNm(String lindJobGbnNm) {
            this.lindJobGbnNm = lindJobGbnNm;
        }

        public String getLindPrcbGbnNm() {
            return lindPrcbGbnNm;
        }

        public void setLindPrcbGbnNm(String lindPrcbGbnNm) {
            this.lindPrcbGbnNm = lindPrcbGbnNm;
        }

        public String getRgtMbdSno() {
            return rgtMbdSno;
        }

        public void setRgtMbdSno(String rgtMbdSno) {
            this.rgtMbdSno = rgtMbdSno;
        }

        public String getTotEpNum() {
            return totEpNum;
        }

        public void setTotEpNum(String totEpNum) {
            this.totEpNum = totEpNum;
        }
    }
}


