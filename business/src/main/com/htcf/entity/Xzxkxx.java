package com.htcf.entity;

/**
 * @author by hj on 2017-11-20.
 */

public class Xzxkxx {

    /**
     * 事项id
     */
    private String projectid;
    /**
     * 流程实例id
     */
    private String processinstaceid;
    /**
     * 工作流id
     */
    private String processid;
    /**
     * 事项名称
     */
    private String itemname;
    /**
     * 受理编号
     */
    private String slbh;
    /**
     * 受理时间
     */
    private String receivadate;
    /**
     * 状态 discard代表撤销
     */
    private String status;
    /**
     * 申请人
     */
    private String applier;
    /**
     * 地址
     */
    private String address;
    /**
     * 行政区
     */
    private String division;
    /**
     * 申请类型
     */
    private String sqtype;
    /**
     * 项目名称
     */
    private String projectname;
    /**
     * 是否暂存过
     */
    private String issaved;

    /**
     * 结束时间
     */
    private String overdate;
    /**
     * 审批
     */
    private String advise;
    /**
     * 统一编码
     */
    private String wslbh;
    /**
     * 行业类别
     */
    private String hangye;
    /**
     * 外网申请人账号
     */
    private String contactpostcode;


    /**
     * 项目地址
     */
    private String projectaddress;

    /**
     * 导出日期
     */
    private String expdaste;
    /**
     * 类型
     */
    private String lx;
    /**
     * 代码
     */
    private String dm;

    @Override
    public String toString() {
        return "Xzxkxx{" +
                "projectid='" + projectid + '\'' +
                ", processinstaceid='" + processinstaceid + '\'' +
                ", processid='" + processid + '\'' +
                ", itemname='" + itemname + '\'' +
                ", slbh='" + slbh + '\'' +
                ", receivadate='" + receivadate + '\'' +
                ", status='" + status + '\'' +
                ", applier='" + applier + '\'' +
                ", address='" + address + '\'' +
                ", division='" + division + '\'' +
                ", sqtype='" + sqtype + '\'' +
                ", projectname='" + projectname + '\'' +
                ", issaved='" + issaved + '\'' +
                ", overdate='" + overdate + '\'' +
                ", advise='" + advise + '\'' +
                ", wslbh='" + wslbh + '\'' +
                ", hangye='" + hangye + '\'' +
                ", contactpostcode='" + contactpostcode + '\'' +
                ", projectaddress='" + projectaddress + '\'' +
                ", expdaste='" + expdaste + '\'' +
                ", lx='" + lx + '\'' +
                ", dm='" + dm + '\'' +
                '}';
    }

    public String getProjectid() {
        return projectid;
    }

    public void setProjectid(String projectid) {
        this.projectid = projectid;
    }

    public String getProcessinstaceid() {
        return processinstaceid;
    }

    public void setProcessinstaceid(String processinstaceid) {
        this.processinstaceid = processinstaceid;
    }

    public String getProcessid() {
        return processid;
    }

    public void setProcessid(String processid) {
        this.processid = processid;
    }

    public String getItemname() {
        return itemname;
    }

    public void setItemname(String itemname) {
        this.itemname = itemname;
    }

    public String getSlbh() {
        return slbh;
    }

    public void setSlbh(String slbh) {
        this.slbh = slbh;
    }

    public String getReceivadate() {
        return receivadate;
    }

    public void setReceivadate(String receivadate) {
        this.receivadate = receivadate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getApplier() {
        return applier;
    }

    public void setApplier(String applier) {
        this.applier = applier;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDivision() {
        return division;
    }

    public void setDivision(String division) {
        this.division = division;
    }

    public String getSqtype() {
        return sqtype;
    }

    public void setSqtype(String sqtype) {
        this.sqtype = sqtype;
    }

    public String getProjectname() {
        return projectname;
    }

    public void setProjectname(String projectname) {
        this.projectname = projectname;
    }

    public String getIssaved() {
        return issaved;
    }

    public void setIssaved(String issaved) {
        this.issaved = issaved;
    }

    public String getOverdate() {
        return overdate;
    }

    public void setOverdate(String overdate) {
        this.overdate = overdate;
    }

    public String getAdvise() {
        return advise;
    }

    public void setAdvise(String advise) {
        this.advise = advise;
    }

    public String getWslbh() {
        return wslbh;
    }

    public void setWslbh(String wslbh) {
        this.wslbh = wslbh;
    }

    public String getHangye() {
        return hangye;
    }

    public void setHangye(String hangye) {
        this.hangye = hangye;
    }

    public String getContactpostcode() {
        return contactpostcode;
    }

    public void setContactpostcode(String contactpostcode) {
        this.contactpostcode = contactpostcode;
    }

    public String getProjectaddress() {
        return projectaddress;
    }

    public void setProjectaddress(String projectaddress) {
        this.projectaddress = projectaddress;
    }

    public String getExpdaste() {
        return expdaste;
    }

    public void setExpdaste(String expdaste) {
        this.expdaste = expdaste;
    }

    public String getLx() {
        return lx;
    }

    public void setLx(String lx) {
        this.lx = lx;
    }

    public String getDm() {
        return dm;
    }

    public void setDm(String dm) {
        this.dm = dm;
    }
}
