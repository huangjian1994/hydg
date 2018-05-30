package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="T_HYSYYW_HYSYDT_HAX_ZZXF")
public class THysyywHysydtHaxZzxf implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Long id;

	@Column
	private String addtime;
	
	@Column
	private String lastupdatetime;
	
	@Column
	private String addusername;
	
	@Column
	private String adduserid;
	
	@Column
	private Long haxid;
	
	@Column
	private String haxmc;
	
	@Column
	private String adxh;
	
	@Column
	private String sfstxfyh;
	
	@Column
	private String stxfyhqk;
	
	@Column
	private String sfjagzwql;
	
	@Column
	private String jagzwqlqk;
	
	@Column
	private String sfqysjzz;
	
	@Column
	private String qysjzzqk;
	
	@Column
	private String sfzzhf;
	
	@Column
	private String zzhfqk;
	
	@Column
	private String sfstldjs;
	
	@Column
	private String stldjsqk;
	
	@Column
	private String xfsj;
	
	@Column
	private String xfqk;
	
	@Column
	private String bz;

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

	public Long getHaxid() {
		return haxid;
	}

	public void setHaxid(Long haxid) {
		this.haxid = haxid;
	}

	public String getAdxh() {
		return adxh;
	}

	public void setAdxh(String adxh) {
		this.adxh = adxh;
	}

	public String getSfstxfyh() {
		return sfstxfyh;
	}

	public void setSfstxfyh(String sfstxfyh) {
		this.sfstxfyh = sfstxfyh;
	}

	public String getStxfyhqk() {
		return stxfyhqk;
	}

	public void setStxfyhqk(String stxfyhqk) {
		this.stxfyhqk = stxfyhqk;
	}

	public String getSfjagzwql() {
		return sfjagzwql;
	}

	public void setSfjagzwql(String sfjagzwql) {
		this.sfjagzwql = sfjagzwql;
	}

	public String getJagzwqlqk() {
		return jagzwqlqk;
	}

	public void setJagzwqlqk(String jagzwqlqk) {
		this.jagzwqlqk = jagzwqlqk;
	}

	public String getSfqysjzz() {
		return sfqysjzz;
	}

	public void setSfqysjzz(String sfqysjzz) {
		this.sfqysjzz = sfqysjzz;
	}

	public String getQysjzzqk() {
		return qysjzzqk;
	}

	public void setQysjzzqk(String qysjzzqk) {
		this.qysjzzqk = qysjzzqk;
	}

	public String getSfzzhf() {
		return sfzzhf;
	}

	public void setSfzzhf(String sfzzhf) {
		this.sfzzhf = sfzzhf;
	}

	public String getZzhfqk() {
		return zzhfqk;
	}

	public void setZzhfqk(String zzhfqk) {
		this.zzhfqk = zzhfqk;
	}

	public String getSfstldjs() {
		return sfstldjs;
	}

	public void setSfstldjs(String sfstldjs) {
		this.sfstldjs = sfstldjs;
	}

	public String getStldjsqk() {
		return stldjsqk;
	}

	public void setStldjsqk(String stldjsqk) {
		this.stldjsqk = stldjsqk;
	}

	public String getXfsj() {
		return xfsj;
	}

	public void setXfsj(String xfsj) {
		this.xfsj = xfsj;
	}

	public String getXfqk() {
		return xfqk;
	}

	public void setXfqk(String xfqk) {
		this.xfqk = xfqk;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getHaxmc() {
		return haxmc;
	}

	public void setHaxmc(String haxmc) {
		this.haxmc = haxmc;
	}
	
	
	    
}
