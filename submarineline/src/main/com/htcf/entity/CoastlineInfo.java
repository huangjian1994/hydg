package com.htcf.entity;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;


/**
 * CoastlineInfo entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="T_HYSYYW_HAXXX"
)

public class CoastlineInfo  implements java.io.Serializable {


    // Fields    

     private Long id;
     private String addtime;
     private String lastupdatetime;
     private String addusername;
     private String adduserid;
     /**
      * 海岸线地理信息
      */
     private String lineGeo;
     /**
      * 海岸线长度
      */
     private String lineLength;
     /**
      * 海岸线名称
      */
     private String lineName;
     private String lineUpdatePerson;
     private String lineUpdatePersonId;
     private String lineUpdateTime;
     private String lineUpdateReason;
     /**
      * 1:海岸线时空分析;2:海域勘界-划界
      */
     private Integer type;


    // Constructors

    /** default constructor */
    public CoastlineInfo() {
    }

    
    /** full constructor */
    public CoastlineInfo(String addtime, String lastupdatetime, String addusername, String adduserid, String lineGeo, String lineLength, String lineName, String lineUpdatePerson, String lineUpdatePersonId, String lineUpdateTime, String lineUpdateReason, Integer type) {
        this.addtime = addtime;
        this.lastupdatetime = lastupdatetime;
        this.addusername = addusername;
        this.adduserid = adduserid;
        this.lineGeo = lineGeo;
        this.lineLength = lineLength;
        this.lineName = lineName;
        this.lineUpdatePerson = lineUpdatePerson;
        this.lineUpdatePersonId = lineUpdatePersonId;
        this.lineUpdateTime = lineUpdateTime;
        this.lineUpdateReason = lineUpdateReason;
        this.type = type;
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
    
    @Column(name="LINE_GEO")

    public String getLineGeo() {
        return this.lineGeo;
    }
    
    public void setLineGeo(String lineGeo) {
        this.lineGeo = lineGeo;
    }
    
    @Column(name="LINE_LENGTH")

    public String getLineLength() {
        return this.lineLength;
    }
    
    public void setLineLength(String lineLength) {
        this.lineLength = lineLength;
    }
    
    @Column(name="LINE_NAME", length=50)

    public String getLineName() {
        return this.lineName;
    }
    
    public void setLineName(String lineName) {
        this.lineName = lineName;
    }
    
    @Column(name="LINE_UPDATE_PERSON", length=50)

    public String getLineUpdatePerson() {
        return this.lineUpdatePerson;
    }
    
    public void setLineUpdatePerson(String lineUpdatePerson) {
        this.lineUpdatePerson = lineUpdatePerson;
    }
    
    @Column(name="LINE_UPDATE_PERSON_ID", length=50)

    public String getLineUpdatePersonId() {
        return this.lineUpdatePersonId;
    }
    
    public void setLineUpdatePersonId(String lineUpdatePersonId) {
        this.lineUpdatePersonId = lineUpdatePersonId;
    }
    
    @Column(name="LINE_UPDATE_TIME", length=50)

    public String getLineUpdateTime() {
        return this.lineUpdateTime;
    }
    
    public void setLineUpdateTime(String lineUpdateTime) {
        this.lineUpdateTime = lineUpdateTime;
    }
    
    @Column(name="LINE_UPDATE_REASON", length=1000)

    public String getLineUpdateReason() {
        return this.lineUpdateReason;
    }
    
    public void setLineUpdateReason(String lineUpdateReason) {
        this.lineUpdateReason = lineUpdateReason;
    }

    @Column(name="TYPE", precision=2, scale=0)
	public Integer getType() {
		return type;
	}


	public void setType(Integer type) {
		this.type = type;
	}
   








}