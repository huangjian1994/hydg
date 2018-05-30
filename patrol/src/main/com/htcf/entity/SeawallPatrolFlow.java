package com.htcf.entity;
// default package

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.GenericGenerator;


/**
 * SeawallPatrolFlow entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="T_HYSYYW_HTXC_LC"
    //,schema="HYDGCF"
)

public class SeawallPatrolFlow  implements java.io.Serializable {


    // Fields    

     private Long id;
     private String addtime;
     private String lastupdatetime;
     private String addusername;
     private String adduserid;
     private Long stPatrolId;
     private String personId;
     private String person;
     /**
      * 流程类型1.上报 2.立案 3.派遣 4.处理 5.确认
      */
     private String opType;
     /**
      * 操作状态：0:处理中;1:已完成
      */
     private String opStatus;
     /**
      * 处理方式（比如装养护单位、处理完成）
      */
     private String opWay;
     private Date opTime;
     private String deadline;
     /**
      * 备注/意见
      */
     private String remark;
     /**
      * 附件
      */
     private String attachment;

    // Constructors

    /** default constructor */
    public SeawallPatrolFlow() {
    }

    
    /** full constructor */
    public SeawallPatrolFlow(String addtime, String lastupdatetime, String addusername, String adduserid, Long stPatrolId, String personId, String person, String opType, String opStatus, String opWay, Date opTime, String deadline, String remark, String attachment) {
        this.addtime = addtime;
        this.lastupdatetime = lastupdatetime;
        this.addusername = addusername;
        this.adduserid = adduserid;
        this.stPatrolId = stPatrolId;
        this.personId = personId;
        this.person = person;
        this.opType = opType;
        this.opStatus = opStatus;
        this.opWay = opWay;
        this.opTime = opTime;
        this.deadline = deadline;
        this.remark = remark;
        this.attachment = attachment;
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
    
    @Column(name="ST_PATROL_ID", precision=18, scale=0)

    public Long getStPatrolId() {
        return this.stPatrolId;
    }
    
    public void setStPatrolId(Long stPatrolId) {
        this.stPatrolId = stPatrolId;
    }
    
    @Column(name="PERSON_ID", length=20)

    public String getPersonId() {
        return this.personId;
    }
    
    public void setPersonId(String personId) {
        this.personId = personId;
    }
    
    @Column(name="PERSON", length=20)

    public String getPerson() {
        return this.person;
    }
    
    public void setPerson(String person) {
        this.person = person;
    }
    
    @Column(name="OP_TYPE", length=4)

    public String getOpType() {
        return this.opType;
    }
    
    public void setOpType(String opType) {
        this.opType = opType;
    }
    
    @Column(name="OP_STATUS", length=4)

    public String getOpStatus() {
        return this.opStatus;
    }
    
    public void setOpStatus(String opStatus) {
        this.opStatus = opStatus;
    }
    
    @Column(name="OP_WAY", length=50)

    public String getOpWay() {
        return this.opWay;
    }
    
    public void setOpWay(String opWay) {
        this.opWay = opWay;
    }
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="OP_TIME", length=7)

    public Date getOpTime() {
        return this.opTime;
    }
    
    public void setOpTime(Date opTime) {
        this.opTime = opTime;
    }
    
    @Column(name="DEADLINE", length=50)

    public String getDeadline() {
        return this.deadline;
    }
    
    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }
    
    @Column(name="REMARK", length=512)

    public String getRemark() {
        return this.remark;
    }
    
    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Column(name="ATTACHMENT", length=512)
    
	public String getAttachment() {
		return attachment;
	}


	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}
   








}