package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 海域勘界管理 矢量数据管理
 * @author yinying
 *
 */
@Entity
@Table(name="T_HYSYYW_HYSYDT_HYKJ_SLSJ")
public class THysyywHysydtHykjSlsj  implements Serializable{

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
	private String sjlx;
	
	@Column
	private String slsjmc;
	
	@Column
	private String sjwjm;
	
	@Column
	private String sjbclj;
	
	@Column
	private String sjsclx;
	
	@Column
	private String sjlj;

	@Column
	private String fj;
	
	@Column
	private String bz;
	
	@Column
	private String fjlj;
	
	@Column
	private String sjly;

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

	public String getSjlx() {
		return sjlx;
	}

	public void setSjlx(String sjlx) {
		this.sjlx = sjlx;
	}

	public String getSjwjm() {
		return sjwjm;
	}

	public void setSjwjm(String sjwjm) {
		this.sjwjm = sjwjm;
	}

	public String getSjbclj() {
		return sjbclj;
	}

	public void setSjbclj(String sjbclj) {
		this.sjbclj = sjbclj;
	}

	public String getSjlj() {
		return sjlj;
	}

	public void setSjlj(String sjlj) {
		this.sjlj = sjlj;
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

	public String getSjly() {
		return sjly;
	}

	public void setSjly(String sjly) {
		this.sjly = sjly;
	}

	public String getSjsclx() {
		return sjsclx;
	}

	public void setSjsclx(String sjsclx) {
		this.sjsclx = sjsclx;
	}

	public String getSlsjmc() {
		return slsjmc;
	}

	public void setSlsjmc(String slsjmc) {
		this.slsjmc = slsjmc;
	}

	
	
}

	
