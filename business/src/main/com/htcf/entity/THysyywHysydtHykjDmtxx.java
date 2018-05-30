package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 海域勘界管理 多媒体信息管理
 * @author yinying
 *
 */
@Entity
@Table(name="T_HYSYYW_HYSYDT_HYKJ_DMTXX")
public class THysyywHysydtHykjDmtxx  implements Serializable{

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
	private String wjm;
	
	@Column
	private String wjsm;
	
	@Column
	private String wjlx;
	
	@Column
	private String scr;
	
	@Column
	private String scsj;
	
	@Column
	private String fj;
	
	@Column
	private String bz;
	
	@Column
	private String fjlj;

	
	@Column
	private byte[] zp;
	
	@Column
	private String spjtmc;
	
	@Column
	private String type;
	
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

	public String getWjm() {
		return wjm;
	}

	public void setWjm(String wjm) {
		this.wjm = wjm;
	}

	public String getWjsm() {
		return wjsm;
	}

	public void setWjsm(String wjsm) {
		this.wjsm = wjsm;
	}

	public String getWjlx() {
		return wjlx;
	}

	public void setWjlx(String wjlx) {
		this.wjlx = wjlx;
	}

	public String getScr() {
		return scr;
	}

	public void setScr(String scr) {
		this.scr = scr;
	}

	public String getScsj() {
		return scsj;
	}

	public void setScsj(String scsj) {
		this.scsj = scsj;
	}

	public String getFj() {
		return fj;
	}

	public void setFj(String fj) {
		this.fj = fj;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getFjlj() {
		return fjlj;
	}

	public void setFjlj(String fjlj) {
		this.fjlj = fjlj;
	}

	public byte[] getZp() {
		return zp;
	}

	public void setZp(byte[] zp) {
		this.zp = zp;
	}

	public String getSpjtmc() {
		return spjtmc;
	}

	public void setSpjtmc(String spjtmc) {
		this.spjtmc = spjtmc;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	
	
}

	
