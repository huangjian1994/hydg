package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 用海项目信息管理 证书信息
 * @author yinying
 *
 */
@Entity
@Table(name="T_HYSYYW_HYSYDT_YHXM_ZSXX")
public class THysyywHysydtYhxmZsxx  implements Serializable{

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
	private String yhlxa;
	
	@Column
	private String yhlxb;
	
	@Column
	private String yhnx;
	
	@Column
	private String zhmj;
	
	@Column
	private String yhxz;
	
	@Column
	private String qqfs;
	
	@Column
	private String yhwzwzsm;
	
	@Column
	private String bz;
	
	@Column
	private String hjdcbh;
	
	@Column
	private String spbh;
	
	@Column
	private String hjbh;
	
	@Column
	private String hjth;
	
	@Column
	private String sqr;
	
	@Column
	private String hysyqr;
	
	@Column
	private String zsh;

	@Column
	private String yhqsnx;

	@Column
	private String yhzznx;

	
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

	public String getYhlxa() {
		return yhlxa;
	}

	public void setYhlxa(String yhlxa) {
		this.yhlxa = yhlxa;
	}

	public String getYhlxb() {
		return yhlxb;
	}

	public void setYhlxb(String yhlxb) {
		this.yhlxb = yhlxb;
	}

	public String getYhnx() {
		return yhnx;
	}

	public void setYhnx(String yhnx) {
		this.yhnx = yhnx;
	}

	public String getZhmj() {
		return zhmj;
	}

	public void setZhmj(String zhmj) {
		this.zhmj = zhmj;
	}

	public String getYhxz() {
		return yhxz;
	}

	public void setYhxz(String yhxz) {
		this.yhxz = yhxz;
	}

	public String getQqfs() {
		return qqfs;
	}

	public void setQqfs(String qqfs) {
		this.qqfs = qqfs;
	}

	public String getYhwzwzsm() {
		return yhwzwzsm;
	}

	public void setYhwzwzsm(String yhwzwzsm) {
		this.yhwzwzsm = yhwzwzsm;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getHjdcbh() {
		return hjdcbh;
	}

	public void setHjdcbh(String hjdcbh) {
		this.hjdcbh = hjdcbh;
	}

	public String getSpbh() {
		return spbh;
	}

	public void setSpbh(String spbh) {
		this.spbh = spbh;
	}

	public String getHjbh() {
		return hjbh;
	}

	public void setHjbh(String hjbh) {
		this.hjbh = hjbh;
	}

	public String getHjth() {
		return hjth;
	}

	public void setHjth(String hjth) {
		this.hjth = hjth;
	}

	public String getSqr() {
		return sqr;
	}

	public void setSqr(String sqr) {
		this.sqr = sqr;
	}

	public String getHysyqr() {
		return hysyqr;
	}

	public void setHysyqr(String hysyqr) {
		this.hysyqr = hysyqr;
	}

	public String getZsh() {
		return zsh;
	}

	public void setZsh(String zsh) {
		this.zsh = zsh;
	}

	public String getYhqsnx() {
		return yhqsnx;
	}

	public void setYhqsnx(String yhqsnx) {
		this.yhqsnx = yhqsnx;
	}

	public String getYhzznx() {
		return yhzznx;
	}

	public void setYhzznx(String yhzznx) {
		this.yhzznx = yhzznx;
	}
	
	
	  
	
}
