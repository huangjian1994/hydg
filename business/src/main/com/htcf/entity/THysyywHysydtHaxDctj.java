package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="T_HYSYYW_HYSYDT_HAX_DCTJ")
public class THysyywHysydtHaxDctj implements Serializable{

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
	private String adxh;
	
	@Column
	private String cd;
	
	@Column
	private String haxlx_a;
	
	@Column
	private String haxlx_b;
	
	@Column
	private String haxlx_c;
	
	@Column
	private String xzqh;
	
	@Column
	private String wz;
	
	@Column
	private String jd;
	
	@Column
	private String wd;
	
	@Column
	private String byl;
	
	@Column
	private String bhlb;
	
	@Column
	private String kflyxz;
	
	@Column
	private String zzxfqk;
	
	@Column
	private String dtbhqk;
	
	@Column
	private String dcrq;
	
	@Column
	private String dcr;
	
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

	public String getHaxname() {
		return haxname;
	}

	public void setHaxname(String haxname) {
		this.haxname = haxname;
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

	public String getAdxh() {
		return adxh;
	}

	public void setAdxh(String adxh) {
		this.adxh = adxh;
	}

	public String getCd() {
		return cd;
	}

	public void setCd(String cd) {
		this.cd = cd;
	}

	public String getHaxlx_a() {
		return haxlx_a;
	}

	public void setHaxlx_a(String haxlxA) {
		haxlx_a = haxlxA;
	}

	public String getHaxlx_b() {
		return haxlx_b;
	}

	public void setHaxlx_b(String haxlxB) {
		haxlx_b = haxlxB;
	}

	public String getHaxlx_c() {
		return haxlx_c;
	}

	public void setHaxlx_c(String haxlxC) {
		haxlx_c = haxlxC;
	}

	public String getXzqh() {
		return xzqh;
	}

	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
	}

	public String getWz() {
		return wz;
	}

	public void setWz(String wz) {
		this.wz = wz;
	}

	public String getJd() {
		return jd;
	}

	public void setJd(String jd) {
		this.jd = jd;
	}

	public String getWd() {
		return wd;
	}

	public void setWd(String wd) {
		this.wd = wd;
	}

	public String getByl() {
		return byl;
	}

	public void setByl(String byl) {
		this.byl = byl;
	}

	public String getBhlb() {
		return bhlb;
	}

	public void setBhlb(String bhlb) {
		this.bhlb = bhlb;
	}

	public String getKflyxz() {
		return kflyxz;
	}

	public void setKflyxz(String kflyxz) {
		this.kflyxz = kflyxz;
	}

	public String getZzxfqk() {
		return zzxfqk;
	}

	public void setZzxfqk(String zzxfqk) {
		this.zzxfqk = zzxfqk;
	}

	public String getDtbhqk() {
		return dtbhqk;
	}

	public void setDtbhqk(String dtbhqk) {
		this.dtbhqk = dtbhqk;
	}

	public String getDcrq() {
		return dcrq;
	}

	public void setDcrq(String dcrq) {
		this.dcrq = dcrq;
	}

	public String getDcr() {
		return dcr;
	}

	public void setDcr(String dcr) {
		this.dcr = dcr;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	
	
	
}
