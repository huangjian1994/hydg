package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 海域勘界管理 划界方案综合分析
 * @author yinying
 *
 */
@Entity
@Table(name="T_HYSYYW_HYSYDT_HYKJ_HJFA")
public class THysyywHysydtHykjHjfa  implements Serializable{

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
	private String wjlx;
	
	@Column
	private String wjm;
	
	@Column
	private String wjbclj;
	
	@Column
	private String fl1;
	
	@Column
	private String fl2;
	
	
	@Column
	private String fj;
	
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

	public String getWjlx() {
		return wjlx;
	}

	public void setWjlx(String wjlx) {
		this.wjlx = wjlx;
	}

	public String getWjm() {
		return wjm;
	}

	public void setWjm(String wjm) {
		this.wjm = wjm;
	}

	public String getWjbclj() {
		return wjbclj;
	}

	public void setWjbclj(String wjbclj) {
		this.wjbclj = wjbclj;
	}

	public String getFl1() {
		return fl1;
	}

	public void setFl1(String fl1) {
		this.fl1 = fl1;
	}

	public String getFl2() {
		return fl2;
	}

	public void setFl2(String fl2) {
		this.fl2 = fl2;
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
	
	
	
}

	
