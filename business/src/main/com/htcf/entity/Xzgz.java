package com.htcf.entity;// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;


/**
 * Xzgz entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="T_HYSYYW_HYGNQH_XZGZ"
    //,schema="HYDGCF"
)

public class Xzgz  implements java.io.Serializable {


    // Fields    

     private Long id;
     private String gnqhmc;
     private String gnqhmcid;
     private String kfgm;
     private String kfgmbfb;
     private String kfgmsm;
     private String gnqzlbh;
     private String zlbhqksm;
     private String bz;
     private String addtime;
     private String lastupdatetime;
     private String addusername;
     private String adduserid;
     private String updateusername;
     private String updateuserid;
     private String yxcd;
     private String yxcdsm;
     private String dw;
     private String examinetime;
     private String examineperson;


    // Constructors

    /** default constructor */
    public Xzgz() {
    }

    
    /** full constructor */
    public Xzgz(String gnqhmc, String gnqhmcid, String kfgm, String kfgmbfb, String kfgmsm, String gnqzlbh, String zlbhqksm, String bz, String addtime, String lastupdatetime, String addusername, String adduserid, String updateusername, String updateuserid, String yxcd, String yxcdsm, String dw, String examinetime, String examineperson) {
        this.gnqhmc = gnqhmc;
        this.gnqhmcid = gnqhmcid;
        this.kfgm = kfgm;
        this.kfgmbfb = kfgmbfb;
        this.kfgmsm = kfgmsm;
        this.gnqzlbh = gnqzlbh;
        this.zlbhqksm = zlbhqksm;
        this.bz = bz;
        this.addtime = addtime;
        this.lastupdatetime = lastupdatetime;
        this.addusername = addusername;
        this.adduserid = adduserid;
        this.updateusername = updateusername;
        this.updateuserid = updateuserid;
        this.yxcd = yxcd;
        this.yxcdsm = yxcdsm;
        this.dw = dw;
        this.examinetime = examinetime;
        this.examineperson = examineperson;
    }

   
    // Property accessors
    @GenericGenerator(name="generator", strategy="increment")
    @Id @GeneratedValue(generator="generator")
    
    @Column(name="ID", unique=true, nullable=false, precision=18, scale=0)

    public Long getId() {
        return this.id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    @Column(name="GNQHMC", length=50)

    public String getGnqhmc() {
        return this.gnqhmc;
    }
    
    public void setGnqhmc(String gnqhmc) {
        this.gnqhmc = gnqhmc;
    }
    
    @Column(name="GNQHMCID", length=50)

    public String getGnqhmcid() {
        return this.gnqhmcid;
    }
    
    public void setGnqhmcid(String gnqhmcid) {
        this.gnqhmcid = gnqhmcid;
    }
    
    @Column(name="KFGM", length=50)

    public String getKfgm() {
        return this.kfgm;
    }
    
    public void setKfgm(String kfgm) {
        this.kfgm = kfgm;
    }
    
    @Column(name="KFGMBFB", length=50)

    public String getKfgmbfb() {
        return this.kfgmbfb;
    }
    
    public void setKfgmbfb(String kfgmbfb) {
        this.kfgmbfb = kfgmbfb;
    }
    
    @Column(name="KFGMSM", length=1000)

    public String getKfgmsm() {
        return this.kfgmsm;
    }
    
    public void setKfgmsm(String kfgmsm) {
        this.kfgmsm = kfgmsm;
    }
    
    @Column(name="GNQZLBH", length=50)

    public String getGnqzlbh() {
        return this.gnqzlbh;
    }
    
    public void setGnqzlbh(String gnqzlbh) {
        this.gnqzlbh = gnqzlbh;
    }
    
    @Column(name="ZLBHQKSM", length=1000)

    public String getZlbhqksm() {
        return this.zlbhqksm;
    }
    
    public void setZlbhqksm(String zlbhqksm) {
        this.zlbhqksm = zlbhqksm;
    }
    
    @Column(name="BZ", length=1000)

    public String getBz() {
        return this.bz;
    }
    
    public void setBz(String bz) {
        this.bz = bz;
    }
    
    @Column(name="ADDTIME", length=50)

    public String getAddtime() {
        return this.addtime;
    }
    
    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }
    
    @Column(name="LASTUPDATETIME", length=50)

    public String getLastupdatetime() {
        return this.lastupdatetime;
    }
    
    public void setLastupdatetime(String lastupdatetime) {
        this.lastupdatetime = lastupdatetime;
    }
    
    @Column(name="ADDUSERNAME", length=50)

    public String getAddusername() {
        return this.addusername;
    }
    
    public void setAddusername(String addusername) {
        this.addusername = addusername;
    }
    
    @Column(name="ADDUSERID", length=50)

    public String getAdduserid() {
        return this.adduserid;
    }
    
    public void setAdduserid(String adduserid) {
        this.adduserid = adduserid;
    }
    
    @Column(name="UPDATEUSERNAME", length=50)

    public String getUpdateusername() {
        return this.updateusername;
    }
    
    public void setUpdateusername(String updateusername) {
        this.updateusername = updateusername;
    }
    
    @Column(name="UPDATEUSERID", length=50)

    public String getUpdateuserid() {
        return this.updateuserid;
    }
    
    public void setUpdateuserid(String updateuserid) {
        this.updateuserid = updateuserid;
    }
    
    @Column(name="YXCD", length=50)

    public String getYxcd() {
        return this.yxcd;
    }
    
    public void setYxcd(String yxcd) {
        this.yxcd = yxcd;
    }
    
    @Column(name="YXCDSM", length=1000)

    public String getYxcdsm() {
        return this.yxcdsm;
    }
    
    public void setYxcdsm(String yxcdsm) {
        this.yxcdsm = yxcdsm;
    }
    
    @Column(name="DW", length=50)

    public String getDw() {
        return this.dw;
    }
    
    public void setDw(String dw) {
        this.dw = dw;
    }
    
    @Column(name="EXAMINETIME", length=50)

    public String getExaminetime() {
        return this.examinetime;
    }
    
    public void setExaminetime(String examinetime) {
        this.examinetime = examinetime;
    }
    
    @Column(name="EXAMINEPERSON", length=50)

    public String getExamineperson() {
        return this.examineperson;
    }
    
    public void setExamineperson(String examineperson) {
        this.examineperson = examineperson;
    }
   








}