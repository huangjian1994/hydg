package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 海域使用金管理  海域使用金征收标准
 * @author yinying
 *
 */
@Entity
@Table(name="T_HYSYYW_HYSYDT_YHXM_HYSYJZSBZ")
public class THysyywHysydtYhxmHysyjZsbz  implements Serializable{

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
	private String yhlxa;
	
	@Column
	private String yhlxb;
	
	@Column
	private String hydb;
	
	@Column
	private String zsfs;
	
	@Column
	private String zsbz;
	
	@Column
	private String dw;

	@Column
	private String hydb1;
	
	@Column
	private String hydb2;
	
	@Column
	private String hydb3;
	
	@Column
	private String hydb4;
	
	@Column
	private String hydb5;
	
	@Column
	private String hydb6;
	
	@Column
	private String yz;
	
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

	public String getHydb() {
		return hydb;
	}

	public void setHydb(String hydb) {
		this.hydb = hydb;
	}

	
	public String getDw() {
		return dw;
	}

	public void setDw(String dw) {
		this.dw = dw;
	}

	public String getZsfs() {
		return zsfs;
	}

	public void setZsfs(String zsfs) {
		this.zsfs = zsfs;
	}

	public String getZsbz() {
		return zsbz;
	}

	public void setZsbz(String zsbz) {
		this.zsbz = zsbz;
	}

	public String getHydb1() {
		return hydb1;
	}

	public void setHydb1(String hydb1) {
		this.hydb1 = hydb1;
	}

	public String getHydb2() {
		return hydb2;
	}

	public void setHydb2(String hydb2) {
		this.hydb2 = hydb2;
	}

	public String getHydb3() {
		return hydb3;
	}

	public void setHydb3(String hydb3) {
		this.hydb3 = hydb3;
	}

	public String getHydb4() {
		return hydb4;
	}

	public void setHydb4(String hydb4) {
		this.hydb4 = hydb4;
	}

	public String getHydb5() {
		return hydb5;
	}

	public void setHydb5(String hydb5) {
		this.hydb5 = hydb5;
	}

	public String getHydb6() {
		return hydb6;
	}

	public void setHydb6(String hydb6) {
		this.hydb6 = hydb6;
	}

	public String getYz() {
		return yz;
	}

	public void setYz(String yz) {
		this.yz = yz;
	}
	
	 
	    
	
}
