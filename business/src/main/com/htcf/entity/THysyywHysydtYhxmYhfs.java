package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 用海项目信息管理 用海方式
 * @author yinying
 *
 */
@Entity
@Table(name="T_HYSYYW_HYSYDT_YHXM_YHFS")
public class THysyywHysydtYhxmYhfs  implements Serializable{

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
	private Long xmid;
	
	@Column
	private Long zsid;
	
	@Column
	private String bs;
	
	@Column
	private String yhfs;
	
	@Column
	private String mj;
	
	@Column
	private String jtyt;
	
	@Column
	private String mjdw;
	@Column
	private String hyglh;

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

	public Long getXmid() {
		return xmid;
	}

	public void setXmid(Long xmid) {
		this.xmid = xmid;
	}

	public Long getZsid() {
		return zsid;
	}

	public void setZsid(Long zsid) {
		this.zsid = zsid;
	}

	public String getBs() {
		return bs;
	}

	public void setBs(String bs) {
		this.bs = bs;
	}

	public String getYhfs() {
		return yhfs;
	}

	public void setYhfs(String yhfs) {
		this.yhfs = yhfs;
	}

	public String getMj() {
		return mj;
	}

	public void setMj(String mj) {
		this.mj = mj;
	}

	public String getJtyt() {
		return jtyt;
	}

	public void setJtyt(String jtyt) {
		this.jtyt = jtyt;
	}

	public String getMjdw() {
		return mjdw;
	}

	public void setMjdw(String mjdw) {
		this.mjdw = mjdw;
	}

	public String getHyglh() {
		return hyglh;
	}

	public void setHyglh(String hyglh) {
		this.hyglh = hyglh;
	}
	
	
	
}
