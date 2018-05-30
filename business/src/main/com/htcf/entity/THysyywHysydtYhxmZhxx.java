package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 用海项目信息管理  宗海信息
 * @author yinying
 *
 */
@Entity
@Table(name="T_HYSYYW_HYSYDT_YHXM_ZHXX")
public class THysyywHysydtYhxmZhxx  implements Serializable{

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
	//项目基本信息
	@Column
	private String yhxmmc;
	@Column
	private String hysyqr;
	
	@Column
	private String yhmj;
	@Column
	private String hydb;
	
	@Column
	private String fddbr;
	@Column
	private String txdz;
	@Column
	private String fzjg;
	@Column
	private String fzjgjb;
	@Column
	private String wjcl;
	//登记信息
	@Column
	private String djbh;
	@Column
	private String csdjrq;
	@Column
	private String djr;
	@Column
	private String shrxm;
	@Column
	private String bdcqzsbh;
	@Column
	private String bdcdyh;
	@Column
	private String djlx;
	
	//宗海信息
	@Column
	private String yhqsnx;

	@Column
	private String yhzznx;
	@Column
	private String yhnx;
	
	@Column
	private String zhmj;
	@Column
	private String mjdw;

	@Column
	private String yhlxa;
	
	@Column
	private String yhlxb;

	@Column
	private String yhxz;
	
	@Column
	private String qqfs;
	
	@Column
	private String syjze;
	@Column
	private String syjzsbz;
	@Column
	private String syjjnfs;
	@Column
	private String syjzsbzyj;
	@Column
	private String yhssgzw;
	@Column
	private String sshy;

	@Column
	private String yhwzwzsm;
	//海籍管理文书图件
	
	@Column
	private String hjdcbh;
	
	@Column
	private String spbh;
	
	@Column
	private String hjbh;
	
	@Column
	private String hjth;
	@Column
	private String hyglh;//海域管理号
	@Column
	private String fzrq;
	@Column
	private String pwmc;
	@Column
	private String fwdw;
	
	@Column
	private String bz;
	@Column
	private String cdxx;
	@Column
	private String bdcqzsfzrq;



	
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

	public String getHysyqr() {
		return hysyqr;
	}

	public void setHysyqr(String hysyqr) {
		this.hysyqr = hysyqr;
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

	public String getYhxmmc() {
		return yhxmmc;
	}

	public void setYhxmmc(String yhxmmc) {
		this.yhxmmc = yhxmmc;
	}

	public String getYhmj() {
		return yhmj;
	}

	public void setYhmj(String yhmj) {
		this.yhmj = yhmj;
	}

	public String getHydb() {
		return hydb;
	}

	public void setHydb(String hydb) {
		this.hydb = hydb;
	}

	public String getFddbr() {
		return fddbr;
	}

	public void setFddbr(String fddbr) {
		this.fddbr = fddbr;
	}

	public String getTxdz() {
		return txdz;
	}

	public void setTxdz(String txdz) {
		this.txdz = txdz;
	}

	public String getFzjg() {
		return fzjg;
	}

	public void setFzjg(String fzjg) {
		this.fzjg = fzjg;
	}

	public String getFzjgjb() {
		return fzjgjb;
	}

	public void setFzjgjb(String fzjgjb) {
		this.fzjgjb = fzjgjb;
	}

	public String getWjcl() {
		return wjcl;
	}

	public void setWjcl(String wjcl) {
		this.wjcl = wjcl;
	}

	public String getDjbh() {
		return djbh;
	}

	public void setDjbh(String djbh) {
		this.djbh = djbh;
	}

	public String getCsdjrq() {
		return csdjrq;
	}

	public void setCsdjrq(String csdjrq) {
		this.csdjrq = csdjrq;
	}

	public String getDjr() {
		return djr;
	}

	public void setDjr(String djr) {
		this.djr = djr;
	}

	public String getShrxm() {
		return shrxm;
	}

	public void setShrxm(String shrxm) {
		this.shrxm = shrxm;
	}

	public String getBdcqzsbh() {
		return bdcqzsbh;
	}

	public void setBdcqzsbh(String bdcqzsbh) {
		this.bdcqzsbh = bdcqzsbh;
	}

	public String getBdcdyh() {
		return bdcdyh;
	}

	public void setBdcdyh(String bdcdyh) {
		this.bdcdyh = bdcdyh;
	}

	public String getDjlx() {
		return djlx;
	}

	public void setDjlx(String djlx) {
		this.djlx = djlx;
	}

	public String getMjdw() {
		return mjdw;
	}

	public void setMjdw(String mjdw) {
		this.mjdw = mjdw;
	}

	public String getSyjze() {
		return syjze;
	}

	public void setSyjze(String syjze) {
		this.syjze = syjze;
	}

	public String getSyjzsbz() {
		return syjzsbz;
	}

	public void setSyjzsbz(String syjzsbz) {
		this.syjzsbz = syjzsbz;
	}

	public String getSyjjnfs() {
		return syjjnfs;
	}

	public void setSyjjnfs(String syjjnfs) {
		this.syjjnfs = syjjnfs;
	}

	public String getSyjzsbzyj() {
		return syjzsbzyj;
	}

	public void setSyjzsbzyj(String syjzsbzyj) {
		this.syjzsbzyj = syjzsbzyj;
	}

	public String getYhssgzw() {
		return yhssgzw;
	}

	public void setYhssgzw(String yhssgzw) {
		this.yhssgzw = yhssgzw;
	}

	public String getSshy() {
		return sshy;
	}

	public void setSshy(String sshy) {
		this.sshy = sshy;
	}

	public String getHyglh() {
		return hyglh;
	}

	public void setHyglh(String hyglh) {
		this.hyglh = hyglh;
	}

	public String getFzrq() {
		return fzrq;
	}

	public void setFzrq(String fzrq) {
		this.fzrq = fzrq;
	}

	public String getPwmc() {
		return pwmc;
	}

	public void setPwmc(String pwmc) {
		this.pwmc = pwmc;
	}

	public String getFwdw() {
		return fwdw;
	}

	public void setFwdw(String fwdw) {
		this.fwdw = fwdw;
	}

	public String getCdxx() {
		return cdxx;
	}

	public void setCdxx(String cdxx) {
		this.cdxx = cdxx;
	}

	public String getBdcqzsfzrq() {
		return bdcqzsfzrq;
	}

	public void setBdcqzsfzrq(String bdcqzsfzrq) {
		this.bdcqzsfzrq = bdcqzsfzrq;
	}
}
