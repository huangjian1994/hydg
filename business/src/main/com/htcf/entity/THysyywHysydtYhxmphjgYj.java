package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 用海项目批后监管 用海项目变化预警
 * @author yinying
 *
 */
@Entity
@Table(name="T_HYSYYW_HYSYDT_YHXMPHJG_YJ")
public class THysyywHysydtYhxmphjgYj  implements Serializable{

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
	private String xmmc;
	
	@Column
	private String yhjzsfgb;
	
	@Column
	private String yhmjsfgb;
	
	@Column
	private String sjytsfgb;
	
	@Column
	private String sfzyhy;
	
	@Column
	private String sfffwth;
	
	@Column
	private String sfszgbhyyt;
	
	@Column
	private String yjjkqsrq;
	
	@Column
	private String yjjkzzrq;
	
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

	public String getXmmc() {
		return xmmc;
	}

	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
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

	public String getSjytsfgb() {
		return sjytsfgb;
	}

	public void setSjytsfgb(String sjytsfgb) {
		this.sjytsfgb = sjytsfgb;
	}

	public String getSfzyhy() {
		return sfzyhy;
	}

	public void setSfzyhy(String sfzyhy) {
		this.sfzyhy = sfzyhy;
	}

	public String getSfffwth() {
		return sfffwth;
	}

	public void setSfffwth(String sfffwth) {
		this.sfffwth = sfffwth;
	}

	public String getSfszgbhyyt() {
		return sfszgbhyyt;
	}

	public void setSfszgbhyyt(String sfszgbhyyt) {
		this.sfszgbhyyt = sfszgbhyyt;
	}

	public String getYjjkqsrq() {
		return yjjkqsrq;
	}

	public void setYjjkqsrq(String yjjkqsrq) {
		this.yjjkqsrq = yjjkqsrq;
	}

	public String getYjjkzzrq() {
		return yjjkzzrq;
	}

	public void setYjjkzzrq(String yjjkzzrq) {
		this.yjjkzzrq = yjjkzzrq;
	}

	
	   
}
