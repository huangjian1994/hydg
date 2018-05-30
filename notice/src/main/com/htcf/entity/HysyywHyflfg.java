package com.htcf.entity;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;


/**
 * HysyywHyflfg entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="T_HYSYYW_HYFLFG")

public class HysyywHyflfg  implements java.io.Serializable {


    // Fields    

     private Long id;
     private String addtime;
     private String lastupdatetime;
     private String addusername;
     private String adduserid;
     /**
      * 法律法规名称
      */
     private String lawName;
     /**
      * 摘要
      */
     private String lawAbstract;
     /**
      * 文号
      */
     private String articleNum;
     /**
      * 类型
      */
     private Integer type;
     /**
      * 序号
      */
     private Integer seq;
     /**
      * 文件路径
      */
     private String filePath;


    // Constructors

    /** default constructor */
    public HysyywHyflfg() {
    }

    
    /** full constructor */
    public HysyywHyflfg(String addtime, String lastupdatetime, String addusername, String adduserid, String lawName, String lawAbstract, String articleNum, Integer type, Integer seq, String filePath) {
        this.addtime = addtime;
        this.lastupdatetime = lastupdatetime;
        this.addusername = addusername;
        this.adduserid = adduserid;
        this.lawName = lawName;
        this.lawAbstract = lawAbstract;
        this.articleNum = articleNum;
        this.type = type;
        this.seq = seq;
        this.filePath = filePath;
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
    
    @Column(name="LAW_NAME", length=100)

    public String getLawName() {
        return this.lawName;
    }
    
    public void setLawName(String lawName) {
        this.lawName = lawName;
    }
    
    @Column(name="ABSTRACT", length=1000)
    public String getLawAbstract() {
		return lawAbstract;
	}


	public void setLawAbstract(String lawAbstract) {
		this.lawAbstract = lawAbstract;
	}

    
    @Column(name="ARTICLE_NUM", length=10)

    public String getArticleNum() {
        return this.articleNum;
    }
    
	public void setArticleNum(String articleNum) {
        this.articleNum = articleNum;
    }
    
    @Column(name="TYPE", precision=2, scale=0)

    public Integer getType() {
        return this.type;
    }
    
    public void setType(Integer type) {
        this.type = type;
    }
    
    @Column(name="SEQ", precision=8, scale=0)

    public Integer getSeq() {
        return this.seq;
    }
    
    public void setSeq(Integer seq) {
        this.seq = seq;
    }
    
    @Column(name="FILE_PATH", length=100)

    public String getFilePath() {
        return this.filePath;
    }
    
    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
   








}