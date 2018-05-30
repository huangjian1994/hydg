package com.htcf.entity;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;


/**
 * 海塘巡查上报附件表
 * @author lwb
 *
 */
@Entity
@Table(name="T_HYSYYW_HTXC_FJ"
    //,schema="HYDGCF"
)

public class SeawallPatrolAttachment  implements java.io.Serializable {


    // Fields    

     private Long id;
     private String addtime;
     private String lastupdatetime;
     private String addusername;
     private String adduserid;
     private Long stPatrolId;
     private String path;
     /**
      * 附件状态：0:删除;1:保存
      */
     private String status;


    // Constructors

    /** default constructor */
    public SeawallPatrolAttachment() {
    }

    
    /** full constructor */
    public SeawallPatrolAttachment(String addtime, String lastupdatetime, String addusername, String adduserid, Long stPatrolId, String path, String status) {
        this.addtime = addtime;
        this.lastupdatetime = lastupdatetime;
        this.addusername = addusername;
        this.adduserid = adduserid;
        this.stPatrolId = stPatrolId;
        this.path = path;
        this.status = status;
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
    
    @Column(name="ST_PATROL_ID",nullable=false, precision=18, scale=0)

    public Long getStPatrolId() {
        return this.stPatrolId;
    }
    
    public void setStPatrolId(Long stPatrolId) {
        this.stPatrolId = stPatrolId;
    }
    
    @Column(name="PATH", length=500)

    public String getPath() {
        return this.path;
    }
    
    public void setPath(String path) {
        this.path = path;
    }
    
    @Column(name="STATUS", length=4)

    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
   








}