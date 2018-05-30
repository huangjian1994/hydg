package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 用海项目批后监管 用海项目动态管理
 * @author yinying
 *
 */
@Entity
@Table(name="T_HYSYYW_HYSYDT_YHXMPHJG_DT")
public class THysyywHysydtYhxmphjgDt  implements Serializable{

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
	private String yhxmmc;
	
	@Column
	private String yhjz;
	
	@Column
	private String yhmj;
	
	@Column
	private String sgfs;
	
	@Column
	private String sgjzqk;
	
	@Column
	private String sjytsfgb;
	
	@Column
	private String atybqk;
	
	@Column
	private String jgfs;
	
	@Column
	private String yhjzsfgb;
	
	
	@Column
	private String yhmjsfgb;
	
	
	
	@Column
	private String sjytgbnr;
	
	@Column
	private String sfzyhy;
	
	@Column
	private String zyhyqk;
	
	@Column
	private String sfffwth;
	
	@Column
	private String ffwthqk;
	
	@Column
	private String sfszgbhyyt;
	
	@Column
	private String szgbhyytqk;
	
	@Column
	private String hcjsjc;
	
	@Column
	private String jgrq;
	
	@Column
	private String sfagdyxsg;
	
	@Column
	private String sfcfwth;
	
	@Column
	private String bz;
	
	@Column
	private String sfydg;
	
	@Column
	private String ydyqwz;
	
	@Column
	private String yhfs;
	
	@Column
	private String sjyt;
	
	@Column
	private String sfwgyh;
	
	@Column
	private String hcdwmc;
	
	@Column
	private String hcrymd;
	
	@Column
	private String rwmc;

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

	public String getYhxmmc() {
		return yhxmmc;
	}

	public void setYhxmmc(String yhxmmc) {
		this.yhxmmc = yhxmmc;
	}

	public String getYhjz() {
		return yhjz;
	}

	public void setYhjz(String yhjz) {
		this.yhjz = yhjz;
	}

	public String getYhmj() {
		return yhmj;
	}

	public void setYhmj(String yhmj) {
		this.yhmj = yhmj;
	}

	public String getSgfs() {
		return sgfs;
	}

	public void setSgfs(String sgfs) {
		this.sgfs = sgfs;
	}

	public String getSgjzqk() {
		return sgjzqk;
	}

	public void setSgjzqk(String sgjzqk) {
		this.sgjzqk = sgjzqk;
	}

	public String getSjytsfgb() {
		return sjytsfgb;
	}

	public void setSjytsfgb(String sjytsfgb) {
		this.sjytsfgb = sjytsfgb;
	}

	public String getAtybqk() {
		return atybqk;
	}

	public void setAtybqk(String atybqk) {
		this.atybqk = atybqk;
	}

	public String getJgfs() {
		return jgfs;
	}

	public void setJgfs(String jgfs) {
		this.jgfs = jgfs;
	}

	public String getYhjzsfgb() {
		return yhjzsfgb;
	}

	public void setYhjzsfgb(String yhjzsfgb) {
		this.yhjzsfgb = yhjzsfgb;
	}


	public String getYhmjsfgb() {
		return yhmjsfgb;
	}

	public void setYhmjsfgb(String yhmjsfgb) {
		this.yhmjsfgb = yhmjsfgb;
	}

	public String getSjytgbnr() {
		return sjytgbnr;
	}

	public void setSjytgbnr(String sjytgbnr) {
		this.sjytgbnr = sjytgbnr;
	}

	public String getSfzyhy() {
		return sfzyhy;
	}

	public void setSfzyhy(String sfzyhy) {
		this.sfzyhy = sfzyhy;
	}

	public String getZyhyqk() {
		return zyhyqk;
	}

	public void setZyhyqk(String zyhyqk) {
		this.zyhyqk = zyhyqk;
	}

	public String getSfffwth() {
		return sfffwth;
	}

	public void setSfffwth(String sfffwth) {
		this.sfffwth = sfffwth;
	}

	public String getFfwthqk() {
		return ffwthqk;
	}

	public void setFfwthqk(String ffwthqk) {
		this.ffwthqk = ffwthqk;
	}

	public String getSfszgbhyyt() {
		return sfszgbhyyt;
	}

	public void setSfszgbhyyt(String sfszgbhyyt) {
		this.sfszgbhyyt = sfszgbhyyt;
	}

	public String getSzgbhyytqk() {
		return szgbhyytqk;
	}

	public void setSzgbhyytqk(String szgbhyytqk) {
		this.szgbhyytqk = szgbhyytqk;
	}

	public String getHcjsjc() {
		return hcjsjc;
	}

	public void setHcjsjc(String hcjsjc) {
		this.hcjsjc = hcjsjc;
	}

	public String getJgrq() {
		return jgrq;
	}

	public void setJgrq(String jgrq) {
		this.jgrq = jgrq;
	}

	public String getSfagdyxsg() {
		return sfagdyxsg;
	}

	public void setSfagdyxsg(String sfagdyxsg) {
		this.sfagdyxsg = sfagdyxsg;
	}

	public String getSfcfwth() {
		return sfcfwth;
	}

	public void setSfcfwth(String sfcfwth) {
		this.sfcfwth = sfcfwth;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getSfydg() {
		return sfydg;
	}

	public void setSfydg(String sfydg) {
		this.sfydg = sfydg;
	}

	public String getYdyqwz() {
		return ydyqwz;
	}

	public void setYdyqwz(String ydyqwz) {
		this.ydyqwz = ydyqwz;
	}

	public String getYhfs() {
		return yhfs;
	}

	public void setYhfs(String yhfs) {
		this.yhfs = yhfs;
	}

	public String getSjyt() {
		return sjyt;
	}

	public void setSjyt(String sjyt) {
		this.sjyt = sjyt;
	}

	public String getSfwgyh() {
		return sfwgyh;
	}

	public void setSfwgyh(String sfwgyh) {
		this.sfwgyh = sfwgyh;
	}

	public String getHcdwmc() {
		return hcdwmc;
	}

	public void setHcdwmc(String hcdwmc) {
		this.hcdwmc = hcdwmc;
	}

	public String getHcrymd() {
		return hcrymd;
	}

	public void setHcrymd(String hcrymd) {
		this.hcrymd = hcrymd;
	}

	public String getRwmc() {
		return rwmc;
	}

	public void setRwmc(String rwmc) {
		this.rwmc = rwmc;
	}
	   
}
