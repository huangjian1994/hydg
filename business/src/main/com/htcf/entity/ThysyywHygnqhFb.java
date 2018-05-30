package com.htcf.entity;

import javax.persistence.*;

/**
 * 功能区划发布实体
 * @author by hj on 2017-10-25.
 */

@Entity
@Table(name="T_HYSYYW_HYGNQH_FB")
public class ThysyywHygnqhFb {

    @Id
    @GeneratedValue
    private Long id;

    /**
     * 新增时间
     */
    @Column
    private String addtime;

    /**
     * 最后修改时间
     */
    @Column
    private String lastupdatetime;

    /**
     * 新增用户姓名
     */
    @Column
    private String addusername;

    /**
     * 新增用户唯一标识
     */
    @Column
    private String adduserid;

    /**
     * 功能区划id
     */
     @Column
    private Long gnqhid;

    /**
     * 功能区划名称
     */
    @Column
    private String gnqhmc;

    /**
     * 标题
     */
    @Column
    private String bt;

    /**
     * 正文
     */
    @Column
    private String zw;

    /**
     * 发布人
     */
    @Column
    private String fbr;

    /**
     * 发布时间
     */
    @Column
    private String fbsj;

    /**
     * 发布单位
     */
    @Column
    private String fbdw;

    /**
     * 备注
     */
    @Column
    private String bz;

    /**
     * 附件
     */
    @Column
    private String fj;
    /**
     * 修改人姓名
     */
    @Column
    private String updateusername;
    /**
     * 修改人id
     */
    @Column
    private String updateuserid ;


    @Override
    public String toString() {
        return "ThysyywHygnqhFb{" +
                "id=" + id +
                ", addtime='" + addtime + '\'' +
                ", lastupdatetime='" + lastupdatetime + '\'' +
                ", addusername='" + addusername + '\'' +
                ", adduserid='" + adduserid + '\'' +
                ", gnqhid=" + gnqhid +
                ", gnqhmc='" + gnqhmc + '\'' +
                ", bt='" + bt + '\'' +
                ", zw='" + zw + '\'' +
                ", fbr='" + fbr + '\'' +
                ", fbsj='" + fbsj + '\'' +
                ", fbdw='" + fbdw + '\'' +
                ", bz='" + bz + '\'' +
                ", fj='" + fj + '\'' +
                ", updateusername='" + updateusername + '\'' +
                ", updateuserid='" + updateuserid + '\'' +
                '}';
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }

    public String getLastupdatetime() {
        return lastupdatetime;
    }

    public void setLastupdatetime(String lastupdatetime) {
        this.lastupdatetime = lastupdatetime;
    }

    public String getAddusername() {
        return addusername;
    }

    public void setAddusername(String addusername) {
        this.addusername = addusername;
    }

    public String getAdduserid() {
        return adduserid;
    }

    public void setAdduserid(String adduserid) {
        this.adduserid = adduserid;
    }

    public Long getGnqhid() {
        return gnqhid;
    }

    public void setGnqhid(Long gnqhid) {
        this.gnqhid = gnqhid;
    }

    public String getGnqhmc() {
        return gnqhmc;
    }

    public void setGnqhmc(String gnqhmc) {
        this.gnqhmc = gnqhmc;
    }

    public String getBt() {
        return bt;
    }

    public void setBt(String bt) {
        this.bt = bt;
    }

    public String getZw() {
        return zw;
    }

    public void setZw(String zw) {
        this.zw = zw;
    }

    public String getFbr() {
        return fbr;
    }

    public void setFbr(String fbr) {
        this.fbr = fbr;
    }

    public String getFbsj() {
        return fbsj;
    }

    public void setFbsj(String fbsj) {
        this.fbsj = fbsj;
    }

    public String getFbdw() {
        return fbdw;
    }

    public void setFbdw(String fbdw) {
        this.fbdw = fbdw;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }

    public String getFj() {
        return fj;
    }

    public void setFj(String fj) {
        this.fj = fj;
    }

    public String getUpdateusername() {
        return updateusername;
    }

    public void setUpdateusername(String updateusername) {
        this.updateusername = updateusername;
    }

    public String getUpdateuserid() {
        return updateuserid;
    }

    public void setUpdateuserid(String updateuserid) {
        this.updateuserid = updateuserid;
    }

}
