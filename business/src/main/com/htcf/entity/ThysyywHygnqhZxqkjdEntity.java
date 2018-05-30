package com.htcf.entity;// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;


/**
 * ThysyywHygnqhZxqkjdEntity entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="T_HYSYYW_HYGNQH_ZXQKJD"
    //,schema="HYDGCF"
)

public class ThysyywHygnqhZxqkjdEntity  implements java.io.Serializable {


    // Fields    

     private Long id;
     private String gnqhmc;
     private String gnqhmcid;
     private String yhxmmc;
     private String wgyhmj;
     private String fxdw;
     private String fxr;
     private String fxsj;
     private String bz;
     private String addtime;
     private String lastupdatetime;
     private String addusername;
     private String adduserid;
     private String updateusername;
     private String updateuserid;
     private String wgyy;


    // Constructors

    /** default constructor */
    public ThysyywHygnqhZxqkjdEntity() {
    }

    
    /** full constructor */
    public ThysyywHygnqhZxqkjdEntity(String gnqhmc, String gnqhmcid, String yhxmmc, String wgyhmj, String fxdw, String fxr, String fxsj, String bz, String addtime, String lastupdatetime, String addusername, String adduserid, String updateusername, String updateuserid, String wgyy) {
        this.gnqhmc = gnqhmc;
        this.gnqhmcid = gnqhmcid;
        this.yhxmmc = yhxmmc;
        this.wgyhmj = wgyhmj;
        this.fxdw = fxdw;
        this.fxr = fxr;
        this.fxsj = fxsj;
        this.bz = bz;
        this.addtime = addtime;
        this.lastupdatetime = lastupdatetime;
        this.addusername = addusername;
        this.adduserid = adduserid;
        this.updateusername = updateusername;
        this.updateuserid = updateuserid;
        this.wgyy = wgyy;
    }

   
    // Property accessors
    @GenericGenerator(name="generator", strategy="increment")@Id @GeneratedValue(generator="generator")
    
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
    
    @Column(name="YHXMMC", length=50)

    public String getYhxmmc() {
        return this.yhxmmc;
    }
    
    public void setYhxmmc(String yhxmmc) {
        this.yhxmmc = yhxmmc;
    }
    
    @Column(name="WGYHMJ", length=50)

    public String getWgyhmj() {
        return this.wgyhmj;
    }
    
    public void setWgyhmj(String wgyhmj) {
        this.wgyhmj = wgyhmj;
    }
    
    @Column(name="FXDW", length=50)

    public String getFxdw() {
        return this.fxdw;
    }
    
    public void setFxdw(String fxdw) {
        this.fxdw = fxdw;
    }
    
    @Column(name="FXR", length=50)

    public String getFxr() {
        return this.fxr;
    }
    
    public void setFxr(String fxr) {
        this.fxr = fxr;
    }
    
    @Column(name="FXSJ", length=50)

    public String getFxsj() {
        return this.fxsj;
    }
    
    public void setFxsj(String fxsj) {
        this.fxsj = fxsj;
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
    
    @Column(name="WGYY", length=1000)

    public String getWgyy() {
        return this.wgyy;
    }
    
    public void setWgyy(String wgyy) {
        this.wgyy = wgyy;
    }
   








}