package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 海域巡查_巡查考评_人员考核
 * @author yinying
 *
 */
@Entity
@Table(name="T_HYXC_XCKP_RYKH")
public class THyxcXckpRykh  implements Serializable{

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
	private String year;
	
	@Column
	private String month;
	
	@Column
	private String dwdm;
	
	@Column
	private String dwmc;
	
	@Column
	private String bz;
	
	@Column
	private int zf;
	
	@Column
	private String dfbm;
	
	@Column
	private String dfr;
	
	@Column
	private String dfrq;

	@Column
	private String xzqh;
	
	@Column
	private String xzqhmc;
	
	@Column
	private String xcbls;
	
	@Column
	private String zyx_zy;
	
	@Column
	private String zyx_yb;
	
	@Column
	private String zyx_b;
	
	@Column
	private String xysj_ks;
	
	@Column
	private String xysj_yb;
	
	@Column
	private String xysj_b;
	
	@Column
	private String xm;

	@Column
	private String xclx;
	
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

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDwdm() {
		return dwdm;
	}

	public void setDwdm(String dwdm) {
		this.dwdm = dwdm;
	}

	public String getDwmc() {
		return dwmc;
	}

	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public int getZf() {
		return zf;
	}

	public void setZf(int zf) {
		this.zf = zf;
	}

	public String getDfbm() {
		return dfbm;
	}

	public void setDfbm(String dfbm) {
		this.dfbm = dfbm;
	}

	public String getDfr() {
		return dfr;
	}

	public void setDfr(String dfr) {
		this.dfr = dfr;
	}

	public String getDfrq() {
		return dfrq;
	}

	public void setDfrq(String dfrq) {
		this.dfrq = dfrq;
	}

	public String getXzqh() {
		return xzqh;
	}

	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
	}

	public String getXzqhmc() {
		return xzqhmc;
	}

	public void setXzqhmc(String xzqhmc) {
		this.xzqhmc = xzqhmc;
	}

	public String getXcbls() {
		return xcbls;
	}

	public void setXcbls(String xcbls) {
		this.xcbls = xcbls;
	}

	public String getZyx_zy() {
		return zyx_zy;
	}

	public void setZyx_zy(String zyxZy) {
		zyx_zy = zyxZy;
	}

	public String getZyx_yb() {
		return zyx_yb;
	}

	public void setZyx_yb(String zyxYb) {
		zyx_yb = zyxYb;
	}

	public String getZyx_b() {
		return zyx_b;
	}

	public void setZyx_b(String zyxB) {
		zyx_b = zyxB;
	}

	public String getXysj_ks() {
		return xysj_ks;
	}

	public void setXysj_ks(String xysjKs) {
		xysj_ks = xysjKs;
	}

	public String getXysj_yb() {
		return xysj_yb;
	}

	public void setXysj_yb(String xysjYb) {
		xysj_yb = xysjYb;
	}

	public String getXysj_b() {
		return xysj_b;
	}

	public void setXysj_b(String xysjB) {
		xysj_b = xysjB;
	}

	public String getXm() {
		return xm;
	}

	public void setXm(String xm) {
		this.xm = xm;
	}

	public String getXclx() {
		return xclx;
	}

	public void setXclx(String xclx) {
		this.xclx = xclx;
	}
	
	
	
	
}

	
