package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 海域使用金管理  海域使用金缴纳通知
 * @author yinying
 *
 */
@Entity
@Table(name="T_HYSYYW_HYSYDT_YHXM_HYSYJJNTZ")
public class THysyywHysydtYhxmHysyjJntz  implements Serializable{

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
	private Long zsid;
	@Column
	private String hyglh;
	
	
	@Column
	private String hysyqr;
	
	@Column
	private String yhmj;
	
	@Column
	private String slsj;
	
	@Column
	private String pzdw;
	
	@Column
	private String yhqssj;
	
	@Column
	private String yhzzsj;
	
	@Column
	private String syjze;
	
	@Column
	private String syjjnfs;
	
	@Column
	private String syjzsbz;
	
	@Column
	private String syjzsbzyj;
	
	@Column
	private String tzrq;
	
	@Column
	private String jndd;
	
	@Column
	private String jnksrq;
	
	@Column
	private String jnjsrq;
	
	@Column
	private String khh;
	
	@Column
	private String hm;
	
	@Column
	private String zh;
	
	@Column
	private String tzjg;
	          
	@Column
	private String djksrq;
	           
	@Column
	private String djjsrq;
	 
	@Column
	private String djdd;
	
	@Column
	private String zt;

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

	public Long getZsid() {
		return zsid;
	}

	public void setZsid(Long zsid) {
		this.zsid = zsid;
	}

	public String getHyglh() {
		return hyglh;
	}

	public void setHyglh(String hyglh) {
		this.hyglh = hyglh;
	}

	public String getHysyqr() {
		return hysyqr;
	}

	public void setHysyqr(String hysyqr) {
		this.hysyqr = hysyqr;
	}

	public String getYhmj() {
		return yhmj;
	}

	public void setYhmj(String yhmj) {
		this.yhmj = yhmj;
	}

	public String getSlsj() {
		return slsj;
	}

	public void setSlsj(String slsj) {
		this.slsj = slsj;
	}

	public String getPzdw() {
		return pzdw;
	}

	public void setPzdw(String pzdw) {
		this.pzdw = pzdw;
	}

	public String getYhqssj() {
		return yhqssj;
	}

	public void setYhqssj(String yhqssj) {
		this.yhqssj = yhqssj;
	}

	public String getYhzzsj() {
		return yhzzsj;
	}

	public void setYhzzsj(String yhzzsj) {
		this.yhzzsj = yhzzsj;
	}

	public String getSyjze() {
		return syjze;
	}

	public void setSyjze(String syjze) {
		this.syjze = syjze;
	}

	public String getSyjjnfs() {
		return syjjnfs;
	}

	public void setSyjjnfs(String syjjnfs) {
		this.syjjnfs = syjjnfs;
	}

	public String getSyjzsbz() {
		return syjzsbz;
	}

	public void setSyjzsbz(String syjzsbz) {
		this.syjzsbz = syjzsbz;
	}

	public String getSyjzsbzyj() {
		return syjzsbzyj;
	}

	public void setSyjzsbzyj(String syjzsbzyj) {
		this.syjzsbzyj = syjzsbzyj;
	}

	public String getTzrq() {
		return tzrq;
	}

	public void setTzrq(String tzrq) {
		this.tzrq = tzrq;
	}

	public String getJndd() {
		return jndd;
	}

	public void setJndd(String jndd) {
		this.jndd = jndd;
	}

	public String getJnksrq() {
		return jnksrq;
	}

	public void setJnksrq(String jnksrq) {
		this.jnksrq = jnksrq;
	}

	public String getJnjsrq() {
		return jnjsrq;
	}

	public void setJnjsrq(String jnjsrq) {
		this.jnjsrq = jnjsrq;
	}

	public String getKhh() {
		return khh;
	}

	public void setKhh(String khh) {
		this.khh = khh;
	}

	public String getHm() {
		return hm;
	}

	public void setHm(String hm) {
		this.hm = hm;
	}

	public String getZh() {
		return zh;
	}

	public void setZh(String zh) {
		this.zh = zh;
	}

	public String getTzjg() {
		return tzjg;
	}

	public void setTzjg(String tzjg) {
		this.tzjg = tzjg;
	}

	public String getDjksrq() {
		return djksrq;
	}

	public void setDjksrq(String djksrq) {
		this.djksrq = djksrq;
	}

	public String getDjjsrq() {
		return djjsrq;
	}

	public void setDjjsrq(String djjsrq) {
		this.djjsrq = djjsrq;
	}

	public String getDjdd() {
		return djdd;
	}

	public void setDjdd(String djdd) {
		this.djdd = djdd;
	}

	public String getZt() {
		return zt;
	}

	public void setZt(String zt) {
		this.zt = zt;
	}
	
	    
	
}
