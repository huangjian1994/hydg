package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 海域巡查_海岛巡查_海岛巡查发现问题信息表
 * @author yinying
 *
 */
@Entity
@Table(name="T_HYXC_HDXC_FXWT")
public class THyxcHdxcFxwt  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Long id;

	@Column
	private String sbrid;
	
	@Column
	private String sbrxm;
	
	@Column
	private String sbrdwdm;
	
	@Column
	private String sbrdwmc;
	
	@Column
	private String sbrlxdh;
	
	@Column
	private String sbryddh;
	
	@Column
	private String sbsj;
	
	@Column
	private String ssqx;
	
	@Column
	private String fsdd;
	
	@Column
	private String bw;
	
	@Column
	private String dj;
	
	@Column
	private String wtlb;
	
	@Column
	private String wtms;
	
	@Column
	private String xcjhid;
	
	@Column
	private byte[] xczp;
	
	@Column
	private String lastupdatetime;
	
	@Column
	private String xgrxm;
	
	@Column
	private String addtime;
	
	@Column
	private String sbzt;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSbrid() {
		return sbrid;
	}

	public void setSbrid(String sbrid) {
		this.sbrid = sbrid;
	}

	public String getSbrxm() {
		return sbrxm;
	}

	public void setSbrxm(String sbrxm) {
		this.sbrxm = sbrxm;
	}

	public String getSbrdwdm() {
		return sbrdwdm;
	}

	public void setSbrdwdm(String sbrdwdm) {
		this.sbrdwdm = sbrdwdm;
	}

	public String getSbrdwmc() {
		return sbrdwmc;
	}

	public void setSbrdwmc(String sbrdwmc) {
		this.sbrdwmc = sbrdwmc;
	}

	public String getSbrlxdh() {
		return sbrlxdh;
	}

	public void setSbrlxdh(String sbrlxdh) {
		this.sbrlxdh = sbrlxdh;
	}

	public String getSbryddh() {
		return sbryddh;
	}

	public void setSbryddh(String sbryddh) {
		this.sbryddh = sbryddh;
	}

	public String getSbsj() {
		return sbsj;
	}

	public void setSbsj(String sbsj) {
		this.sbsj = sbsj;
	}

	public String getFsdd() {
		return fsdd;
	}

	public void setFsdd(String fsdd) {
		this.fsdd = fsdd;
	}

	public String getBw() {
		return bw;
	}

	public void setBw(String bw) {
		this.bw = bw;
	}

	public String getDj() {
		return dj;
	}

	public void setDj(String dj) {
		this.dj = dj;
	}

	public String getWtlb() {
		return wtlb;
	}

	public void setWtlb(String wtlb) {
		this.wtlb = wtlb;
	}

	public String getWtms() {
		return wtms;
	}

	public void setWtms(String wtms) {
		this.wtms = wtms;
	}

	public String getXcjhid() {
		return xcjhid;
	}

	public void setXcjhid(String xcjhid) {
		this.xcjhid = xcjhid;
	}

	public byte[] getXczp() {
		return xczp;
	}

	public void setXczp(byte[] xczp) {
		this.xczp = xczp;
	}

	
	public String getXgrxm() {
		return xgrxm;
	}

	public void setXgrxm(String xgrxm) {
		this.xgrxm = xgrxm;
	}

	public String getSsqx() {
		return ssqx;
	}

	public void setSsqx(String ssqx) {
		this.ssqx = ssqx;
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

	public String getSbzt() {
		return sbzt;
	}

	public void setSbzt(String sbzt) {
		this.sbzt = sbzt;
	}
	
	   
	
}

	
