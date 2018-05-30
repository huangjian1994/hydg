package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 用海项目信息管理 宗海图
 * @author yinying
 *
 */
@Entity
@Table(name="T_HYSYYW_HYSYDT_YHXM_ZHT")
public class THysyywHysydtYhxmZht  implements Serializable{

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
	private byte[] yhwzt;
	
	@Column
	private byte[] jzt;
	
	@Column
	private Long zsid;

	
	@Column
	private String jzt_tpmc;
	@Column
	private String jzt_tpsjcc;
	@Column
	private String jzt_tpdx;
	@Column
	private String jzt_tpgs;
	@Column
	private String wzt_tpmc;
	@Column
	private String wzt_tpsjcc;
	@Column
	private String wzt_tpdx;
	@Column
	private String wzt_tpgs;
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

	public byte[] getYhwzt() {
		return yhwzt;
	}

	public void setYhwzt(byte[] yhwzt) {
		this.yhwzt = yhwzt;
	}

	public byte[] getJzt() {
		return jzt;
	}

	public void setJzt(byte[] jzt) {
		this.jzt = jzt;
	}

	public Long getZsid() {
		return zsid;
	}

	public void setZsid(Long zsid) {
		this.zsid = zsid;
	}

	public String getJzt_tpmc() {
		return jzt_tpmc;
	}

	public void setJzt_tpmc(String jztTpmc) {
		jzt_tpmc = jztTpmc;
	}

	

	public String getJzt_tpdx() {
		return jzt_tpdx;
	}

	public void setJzt_tpdx(String jztTpdx) {
		jzt_tpdx = jztTpdx;
	}

	public String getJzt_tpgs() {
		return jzt_tpgs;
	}

	public void setJzt_tpgs(String jztTpgs) {
		jzt_tpgs = jztTpgs;
	}

	public String getWzt_tpmc() {
		return wzt_tpmc;
	}

	public void setWzt_tpmc(String wztTpmc) {
		wzt_tpmc = wztTpmc;
	}


	public String getWzt_tpdx() {
		return wzt_tpdx;
	}

	public void setWzt_tpdx(String wztTpdx) {
		wzt_tpdx = wztTpdx;
	}

	public String getWzt_tpgs() {
		return wzt_tpgs;
	}

	public void setWzt_tpgs(String wztTpgs) {
		wzt_tpgs = wztTpgs;
	}

	public String getHyglh() {
		return hyglh;
	}

	public void setHyglh(String hyglh) {
		this.hyglh = hyglh;
	}

	public String getJzt_tpsjcc() {
		return jzt_tpsjcc;
	}

	public void setJzt_tpsjcc(String jztTpsjcc) {
		jzt_tpsjcc = jztTpsjcc;
	}

	public String getWzt_tpsjcc() {
		return wzt_tpsjcc;
	}

	public void setWzt_tpsjcc(String wztTpsjcc) {
		wzt_tpsjcc = wztTpsjcc;
	}
	
	
	
}
