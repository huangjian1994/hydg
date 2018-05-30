package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 海域巡查_巡查考评_单位考核
 * @author yinying
 *
 */
@Entity
@Table(name="T_HYXC_XCKP_DWKH")
public class THyxcXckpDwkh  implements Serializable{

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
	private String xzqh;
	
	@Column
	private String dwmc;
	
	@Column
	private String year;
	
	@Column
	private String month;
	
	@Column
	private String dwdm;
	
	@Column
	private String gljg;
	
	@Column
	private String jhgl;
	
	@Column
	private String jswm;
	
	@Column
	private String zdgl;
	
	@Column
	private String dagl;
	
	@Column
	private String rcgl;
	
	@Column
	private String aqgl;
	
	@Column
	private String xxsbl;
	
	@Column
	private String xccs;
	
	@Column
	private String xclj;
	          
	@Column
	private String shcp;
	           
	@Column
	private String dfbm;
	
	@Column
	private String dfr;
	
	@Column
	private String dfrq;

	@Column
	private String bz;
	
	@Column
	private String xzqhmc;
	
	@Column
	private int zf;
	
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

	public String getXzqh() {
		return xzqh;
	}

	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
	}

	public String getDwmc() {
		return dwmc;
	}

	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
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

	public String getGljg() {
		return gljg;
	}

	public void setGljg(String gljg) {
		this.gljg = gljg;
	}

	public String getJhgl() {
		return jhgl;
	}

	public void setJhgl(String jhgl) {
		this.jhgl = jhgl;
	}

	public String getJswm() {
		return jswm;
	}

	public void setJswm(String jswm) {
		this.jswm = jswm;
	}

	public String getZdgl() {
		return zdgl;
	}

	public void setZdgl(String zdgl) {
		this.zdgl = zdgl;
	}

	public String getDagl() {
		return dagl;
	}

	public void setDagl(String dagl) {
		this.dagl = dagl;
	}

	public String getRcgl() {
		return rcgl;
	}

	public void setRcgl(String rcgl) {
		this.rcgl = rcgl;
	}

	public String getAqgl() {
		return aqgl;
	}

	public void setAqgl(String aqgl) {
		this.aqgl = aqgl;
	}

	public String getXxsbl() {
		return xxsbl;
	}

	public void setXxsbl(String xxsbl) {
		this.xxsbl = xxsbl;
	}

	public String getXccs() {
		return xccs;
	}

	public void setXccs(String xccs) {
		this.xccs = xccs;
	}

	public String getXclj() {
		return xclj;
	}

	public void setXclj(String xclj) {
		this.xclj = xclj;
	}

	public String getShcp() {
		return shcp;
	}

	public void setShcp(String shcp) {
		this.shcp = shcp;
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

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getXzqhmc() {
		return xzqhmc;
	}

	public void setXzqhmc(String xzqhmc) {
		this.xzqhmc = xzqhmc;
	}

	public int getZf() {
		return zf;
	}

	public void setZf(int zf) {
		this.zf = zf;
	}

	public String getXclx() {
		return xclx;
	}

	public void setXclx(String xclx) {
		this.xclx = xclx;
	}

	
	
	
	
	
	
}

	
