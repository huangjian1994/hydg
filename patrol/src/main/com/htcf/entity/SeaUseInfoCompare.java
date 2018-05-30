package com.htcf.entity;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;


/**
 * 用海信息比对
 * @author lwb
 *
 */
@Entity
@Table(name="T_HTXCGL_XTBD"
    //,schema="HYDGCF"
)

public class SeaUseInfoCompare  implements java.io.Serializable {


    // Fields    

     private Long id;
     private String addtime;
     private String lastupdatetime;
     private String addusername;
     private String adduserid;
     private String projectId;
     private String projectName;
     /**
      * 项目性质
      */
     private String projectNature;
     /**
      * 海域用途
      */
     private String seaAreaUse;
     /**
      * 用海方式
      */
     private String seaUseWay;
     /**
      * 用海范围
      */
     private String seaUseRange;
     /**
      * 用海面积
      */
     private String seaUseAreage;
     /**
      * 用海期限
      */
     private String seaUseDeadline;
     /**
      * 是否缴纳海域使用金
      */
     private String isPay;


    // Constructors

    /** default constructor */
    public SeaUseInfoCompare() {
    }

    
    /** full constructor */
    public SeaUseInfoCompare(String addtime, String lastupdatetime, String addusername, String adduserid, String projectId, String projectName, String projectNature, String seaAreaUse, String seaUseWay, String seaUseRange, String seaUseAreage, String seaUseDeadline, String isPay) {
        this.addtime = addtime;
        this.lastupdatetime = lastupdatetime;
        this.addusername = addusername;
        this.adduserid = adduserid;
        this.projectId = projectId;
        this.projectName = projectName;
        this.projectNature = projectNature;
        this.seaAreaUse = seaAreaUse;
        this.seaUseWay = seaUseWay;
        this.seaUseRange = seaUseRange;
        this.seaUseAreage = seaUseAreage;
        this.seaUseDeadline = seaUseDeadline;
        this.isPay = isPay;
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
    
    @Column(name="PROJECT_NAME", length=100)

    public String getProjectName() {
        return this.projectName;
    }
    
    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }
    
    @Column(name="PROJECT_NATURE", length=100)

    public String getProjectNature() {
        return this.projectNature;
    }
    
    public void setProjectNature(String projectNature) {
        this.projectNature = projectNature;
    }
    
    @Column(name="SEA_AREA_USE", length=2048)

    public String getSeaAreaUse() {
        return this.seaAreaUse;
    }
    
    public void setSeaAreaUse(String seaAreaUse) {
        this.seaAreaUse = seaAreaUse;
    }
    
    @Column(name="SEA_USE_WAY", length=2048)

    public String getSeaUseWay() {
        return this.seaUseWay;
    }
    
    public void setSeaUseWay(String seaUseWay) {
        this.seaUseWay = seaUseWay;
    }
    
    @Column(name="SEA_USE_RANGE", length=2048)

    public String getSeaUseRange() {
        return this.seaUseRange;
    }
    
    public void setSeaUseRange(String seaUseRange) {
        this.seaUseRange = seaUseRange;
    }
    
    @Column(name="SEA_USE_AREAGE", length=64)

    public String getSeaUseAreage() {
        return this.seaUseAreage;
    }
    
    public void setSeaUseAreage(String seaUseAreage) {
        this.seaUseAreage = seaUseAreage;
    }
    
    @Column(name="SEA_USE_DEADLINE", length=64)

    public String getSeaUseDeadline() {
        return this.seaUseDeadline;
    }
    
    public void setSeaUseDeadline(String seaUseDeadline) {
        this.seaUseDeadline = seaUseDeadline;
    }
    
    @Column(name="IS_PAY", length=64)

    public String getIsPay() {
        return this.isPay;
    }
    
    public void setIsPay(String isPay) {
        this.isPay = isPay;
    }

    @Column(name="PROJECT_ID", length=20)
	public String getProjectId() {
		return projectId;
	}


	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
   








}