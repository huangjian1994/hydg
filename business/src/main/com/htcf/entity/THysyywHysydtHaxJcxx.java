package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="T_HYSYYW_HYSYDT_HAX_JCXX")
public class THysyywHysydtHaxJcxx implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long id;
	private String name;
	private String addtime;
	private String lastupdatetime;
	private String addusername;
	private String adduserid;
	private String adxh;
	private String cd;
	private String xzqh;
	private String wz;
	private String jd;
	private String wd;
	private String bz;
	private String haxlx_a;
	private String haxlx_b;
	private String haxlx_c;

	public THysyywHysydtHaxJcxx(){}
	
	public THysyywHysydtHaxJcxx(Long id, String name, String addtime,
			String lastupdatetime, String addusername, String adduserid,
			String adxh, String cd, String xzqh, String wz, String jd,
			String wd, String bz,String haxlx_a,String haxlx_b,String haxlx_c) {
		super();
		this.id = id;
		this.name = name;
		this.addtime = addtime;
		this.lastupdatetime = lastupdatetime;
		this.addusername = addusername;
		this.adduserid = adduserid;
		this.adxh = adxh;
		this.cd = cd;
		this.xzqh = xzqh;
		this.wz = wz;
		this.jd = jd;
		this.wd = wd;
		this.bz = bz;
		this.haxlx_a=haxlx_a;
		this.haxlx_b=haxlx_b;
		this.haxlx_c=haxlx_c;
	}
	@Id
	@GeneratedValue
	@Column(name = "ID", unique = true, nullable = false, precision = 8, scale = 0)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	@Column(name = "ADDTIME", length = 50)
	public String getAddtime() {
		return addtime;
	}
	
	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}
	@Column(name = "LASTUPDATETIME", length = 50)
	public String getLastupdatetime() {
		return lastupdatetime;
	}

	public void setLastupdatetime(String lastupdatetime) {
		this.lastupdatetime = lastupdatetime;
	}
	@Column(name = "ADDUSERNAME", length = 50)
	public String getAddusername() {
		return addusername;
	}

	public void setAddusername(String addusername) {
		this.addusername = addusername;
	}
	@Column(name = "ADDUSERID", length = 50)
	public String getAdduserid() {
		return adduserid;
	}

	public void setAdduserid(String adduserid) {
		this.adduserid = adduserid;
	}
	@Column(name = "ADXH", length = 50)
	public String getAdxh() {
		return adxh;
	}

	public void setAdxh(String adxh) {
		this.adxh = adxh;
	}
	@Column(name = "CD", length = 50)
	public String getCd() {
		return cd;
	}

	public void setCd(String cd) {
		this.cd = cd;
	}
	@Column(name = "XZQH", length = 50)
	public String getXzqh() {
		return xzqh;
	}

	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
	}
	@Column(name = "WZ", length = 50)
	public String getWz() {
		return wz;
	}

	public void setWz(String wz) {
		this.wz = wz;
	}
	@Column(name = "JD", length = 50)
	public String getJd() {
		return jd;
	}

	public void setJd(String jd) {
		this.jd = jd;
	}
	@Column(name = "WD", length = 50)
	public String getWd() {
		return wd;
	}

	public void setWd(String wd) {
		this.wd = wd;
	}
	@Column(name = "BZ", length = 50)
	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}
	@Column(name = "NAME", length = 50)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	@Column(name = "HAXLX_A", length = 50)
	public String getHaxlx_a() {
		return haxlx_a;
	}

	public void setHaxlx_a(String haxlxA) {
		haxlx_a = haxlxA;
	}
	@Column(name = "HAXLX_B", length = 50)
	public String getHaxlx_b() {
		return haxlx_b;
	}

	public void setHaxlx_b(String haxlxB) {
		haxlx_b = haxlxB;
	}
	@Column(name = "HAXLX_C", length = 50)
	public String getHaxlx_c() {
		return haxlx_c;
	}

	public void setHaxlx_c(String haxlxC) {
		haxlx_c = haxlxC;
	}
	
	
}
