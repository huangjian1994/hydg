package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 功能区划管理 功能区信息
 * @author hj
 *
 */
@Entity
@Table(name="T_HYSYYW_HYGNQH_XXGL")
public class THYsyywHygnqhXxgl  implements Serializable{

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
	private String yjlmc;
	
	@Column
	private String ejlmc;
	
	@Column
	private String gnqhmc;
	
	@Column
	private String ghmj;
	
	@Column
	private String kzldm;
	
	@Column
	private String dlfwmc;
	
	@Column
	private String xzqy;

	@Column
	private String syyq;

	@Column
	private String hjbhyq;

	@Column
	private String szd;

	@Column
	private String axcd;

	@Column
	private String updateusername;

	@Column
	private String updateuserid;

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

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

	public String getYjlmc() {
		return yjlmc;
	}

	public void setYjlmc(String yjlmc) {
		this.yjlmc = yjlmc;
	}

	public String getEjlmc() {
		return ejlmc;
	}

	public void setEjlmc(String ejlmc) {
		this.ejlmc = ejlmc;
	}

	public String getGnqhmc() {
		return gnqhmc;
	}

	public void setGnqhmc(String gnqhmc) {
		this.gnqhmc = gnqhmc;
	}

	public String getGhmj() {
		return ghmj;
	}

	public void setGhmj(String ghmj) {
		this.ghmj = ghmj;
	}

	public String getKzldm() {
		return kzldm;
	}

	public void setKzldm(String kzldm) {
		this.kzldm = kzldm;
	}

	public String getDlfwmc() {
		return dlfwmc;
	}

	public void setDlfwmc(String dlfwmc) {
		this.dlfwmc = dlfwmc;
	}

	public String getXzqy() {
		return xzqy;
	}

	public void setXzqy(String xzqy) {
		this.xzqy = xzqy;
	}

	public String getUpdateusername() {
		return updateusername;
	}

	public void setUpdateusername(String updateusername) {
		this.updateusername = updateusername;
	}

	public String getUpdateuserid() {
		return updateuserid;
	}

	public void setUpdateuserid(String updateuserid) {
		this.updateuserid = updateuserid;
	}

	public String getSyyq() {
		return syyq;
	}

	public void setSyyq(String syyq) {
		this.syyq = syyq;
	}

	public String getHjbhyq() {
		return hjbhyq;
	}

	public void setHjbhyq(String hjbhyq) {
		this.hjbhyq = hjbhyq;
	}

	public String getSzd() {
		return szd;
	}

	public void setSzd(String szd) {
		this.szd = szd;
	}

	public String getAxcd() {
		return axcd;
	}

	public void setAxcd(String axcd) {
		this.axcd = axcd;
	}
}

	
