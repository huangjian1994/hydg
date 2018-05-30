package com.htcf.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * entity. @author MyEclipse Persistence Tools  无表
 * 数据字典实体
 */
@Entity
@Table(name = "BASE_SJZD")
public class Sjzd implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// Fields
	private Long id;		
	private Long fid;		//父节点
	private String content;	//内容
	private String bz;	//备注
	private String isLeaf ;	//是否叶子节点
	private Long layer;	//级别
	
	// Constructors

	/** default constructor */
	public Sjzd() {
	}

	/** full constructor */
	public Sjzd(Long fid, String content, String bz,String isLeaf,Long layer) {
		super();
		this.fid = fid;
		this.content = content;
		this.bz = bz;
		this.isLeaf = isLeaf;
		this.layer = layer;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "ID")
	public Long getId() {
		return this.id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "FID")
	public Long getFid() {
		return fid;
	}

	public void setFid(Long fid) {
		this.fid = fid;
	}
	
	@Column(name = "CONTENT")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "BZ")
	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	@Column(name = "ISLEAF")
	public String getIsLeaf() {
		return isLeaf;
	}

	public void setIsLeaf(String isLeaf) {
		this.isLeaf = isLeaf;
	}

	@Column(name = "LAYER")
	public Long getLayer() {
		return layer;
	}

	public void setLayer(Long layer) {
		this.layer = layer;
	}
	
}