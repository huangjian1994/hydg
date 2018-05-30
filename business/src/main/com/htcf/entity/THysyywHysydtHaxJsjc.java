package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="T_HYSYYW_HYSYDT_HAX_JSJC")
public class THysyywHysydtHaxJsjc implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private Long id;
	
	@Column
	private String haxid;
	
	@Column
	private String haxname;

	@Column
	private String addtime;
	
	@Column
	private String lastupdatetime;
	
	@Column
	private String addusername;
	
	@Column
	private String adduserid;
	
	@Column
	private String sfqs;
	
	@Column
	private String qsqk;
	
	@Column
	private String sfcy;
	
	@Column
	private String cyqk;
	
	@Column
	private String sfhsrq;
	
	@Column
	private String hsrqqk;
	
	@Column
	private String sfylz;
	
	@Column
	private String lzqk;
	
	@Column
	private String sffyyh;
	
	@Column
	private String fyyhqk;
	
	@Column
	private String sfyjf;
	
	@Column
	private String jfqk;
	
	@Column
	private String sfywfzyhaxqk;
	
	@Column
	private String wfzyhaxqk;
	
	@Column
	private String jsjcrq;
	
	@Column
	private String jsjcrxm;
	
	@Column
	private String bz;
	
	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getHaxid() {
		return haxid;
	}

	public void setHaxid(String haxid) {
		this.haxid = haxid;
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

	public String getSfqs() {
		return sfqs;
	}

	public void setSfqs(String sfqs) {
		this.sfqs = sfqs;
	}

	public String getQsqk() {
		return qsqk;
	}

	public void setQsqk(String qsqk) {
		this.qsqk = qsqk;
	}

	public String getSfcy() {
		return sfcy;
	}

	public void setSfcy(String sfcy) {
		this.sfcy = sfcy;
	}

	public String getCyqk() {
		return cyqk;
	}

	public void setCyqk(String cyqk) {
		this.cyqk = cyqk;
	}

	public String getSfhsrq() {
		return sfhsrq;
	}

	public void setSfhsrq(String sfhsrq) {
		this.sfhsrq = sfhsrq;
	}

	public String getHsrqqk() {
		return hsrqqk;
	}

	public void setHsrqqk(String hsrqqk) {
		this.hsrqqk = hsrqqk;
	}

	public String getSfylz() {
		return sfylz;
	}

	public void setSfylz(String sfylz) {
		this.sfylz = sfylz;
	}

	public String getLzqk() {
		return lzqk;
	}

	public void setLzqk(String lzqk) {
		this.lzqk = lzqk;
	}

	public String getSffyyh() {
		return sffyyh;
	}

	public void setSffyyh(String sffyyh) {
		this.sffyyh = sffyyh;
	}

	public String getFyyhqk() {
		return fyyhqk;
	}

	public void setFyyhqk(String fyyhqk) {
		this.fyyhqk = fyyhqk;
	}

	public String getSfyjf() {
		return sfyjf;
	}

	public void setSfyjf(String sfyjf) {
		this.sfyjf = sfyjf;
	}

	public String getJfqk() {
		return jfqk;
	}

	public void setJfqk(String jfqk) {
		this.jfqk = jfqk;
	}

	public String getSfywfzyhaxqk() {
		return sfywfzyhaxqk;
	}

	public void setSfywfzyhaxqk(String sfywfzyhaxqk) {
		this.sfywfzyhaxqk = sfywfzyhaxqk;
	}

	public String getWfzyhaxqk() {
		return wfzyhaxqk;
	}

	public void setWfzyhaxqk(String wfzyhaxqk) {
		this.wfzyhaxqk = wfzyhaxqk;
	}

	public String getHaxname() {
		return haxname;
	}

	public void setHaxname(String haxname) {
		this.haxname = haxname;
	}

	public String getJsjcrq() {
		return jsjcrq;
	}

	public void setJsjcrq(String jsjcrq) {
		this.jsjcrq = jsjcrq;
	}

	public String getJsjcrxm() {
		return jsjcrxm;
	}

	public void setJsjcrxm(String jsjcrxm) {
		this.jsjcrxm = jsjcrxm;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}
	
	
}
