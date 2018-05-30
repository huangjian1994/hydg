package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 用海项目信息管理 海域使用金
 * @author yinying
 *
 */
@Entity
@Table(name="T_HYSYYW_HYSYDT_YHXM_HYSYJ")
public class THysyywHysydtYhxmHysyj  implements Serializable{

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
	private String xmmc;
	
	@Column
	private String xmwz;
	
	@Column
	private String hysyqr;
	
	@Column
	private String qqfs;
	
	@Column
	private String yhlxa;
	
	@Column
	private String yhlxb;
	@Column
	private String sfwlsyh;

	@Column
	private String yhsx;
	@Column
	private String jnrq;
	@Column
	private String xmlx;

	@Column
	private String djr;

	@Column
	private String djsj;
	@Column
	private String sm;

	@Column
	private String yhfs_ej;
	
	@Column
	private String yhmj;
	@Column
	private String syjdqrq;
	@Column
	private String jnfs;
	
	@Column
	private String yzje_ze;

	@Column
	private String yzje_zygk;
	
	@Column
	private String yzje_dfgk;
	@Column
	private String yzje_s;
	@Column
	private String yzje_shi;
	
	@Column
	private String yzje_q;
	
	@Column
	private String zsje_xj;
	@Column
	private String zsje_zygk;

	@Column
	private String zsje_dfgk;
	@Column
	private String zsje_s;
	@Column
	private String zsje_shi;
	@Column
	private String zsje_q;
	
	@Column
	private String jmje_xj;
	@Column
	private String jmje_zygk;

	@Column
	private String jmje_dfgk;
	@Column
	private String jmje_s;
	@Column
	private String jmje_shi;
	@Column
	private String jmje_q;
	@Column
	private String skr;
	@Column
	private String skje;
	

	

	


	

	
	
	
	

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

	public String getYhfs_ej() {
		return yhfs_ej;
	}

	public void setYhfs_ej(String yhfsEj) {
		yhfs_ej = yhfsEj;
	}

	public String getYhmj() {
		return yhmj;
	}

	public void setYhmj(String yhmj) {
		this.yhmj = yhmj;
	}

	public String getYzje_zygk() {
		return yzje_zygk;
	}

	public void setYzje_zygk(String yzjeZygk) {
		yzje_zygk = yzjeZygk;
	}

	public String getYzje_dfgk() {
		return yzje_dfgk;
	}

	public void setYzje_dfgk(String yzjeDfgk) {
		yzje_dfgk = yzjeDfgk;
	}

	public String getZsje_zygk() {
		return zsje_zygk;
	}

	public void setZsje_zygk(String zsjeZygk) {
		zsje_zygk = zsjeZygk;
	}

	public String getZsje_dfgk() {
		return zsje_dfgk;
	}

	public void setZsje_dfgk(String zsjeDfgk) {
		zsje_dfgk = zsjeDfgk;
	}

	public String getZsje_xj() {
		return zsje_xj;
	}

	public void setZsje_xj(String zsjeXj) {
		zsje_xj = zsjeXj;
	}

	public String getJmje_zygk() {
		return jmje_zygk;
	}

	public void setJmje_zygk(String jmjeZygk) {
		jmje_zygk = jmjeZygk;
	}

	public String getJmje_dfgk() {
		return jmje_dfgk;
	}

	public void setJmje_dfgk(String jmjeDfgk) {
		jmje_dfgk = jmjeDfgk;
	}

	public String getJmje_xj() {
		return jmje_xj;
	}

	public void setJmje_xj(String jmjeXj) {
		jmje_xj = jmjeXj;
	}

	public String getJnrq() {
		return jnrq;
	}

	public void setJnrq(String jnrq) {
		this.jnrq = jnrq;
	}

	public String getDjr() {
		return djr;
	}

	public void setDjr(String djr) {
		this.djr = djr;
	}

	public String getDjsj() {
		return djsj;
	}

	public void setDjsj(String djsj) {
		this.djsj = djsj;
	}

	public String getXmlx() {
		return xmlx;
	}

	public void setXmlx(String xmlx) {
		this.xmlx = xmlx;
	}

	public String getSfwlsyh() {
		return sfwlsyh;
	}

	public void setSfwlsyh(String sfwlsyh) {
		this.sfwlsyh = sfwlsyh;
	}

	public String getYhsx() {
		return yhsx;
	}

	public void setYhsx(String yhsx) {
		this.yhsx = yhsx;
	}


	public String getXmmc() {
		return xmmc;
	}

	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}

	public String getXmwz() {
		return xmwz;
	}

	public void setXmwz(String xmwz) {
		this.xmwz = xmwz;
	}

	public String getHysyqr() {
		return hysyqr;
	}

	public void setHysyqr(String hysyqr) {
		this.hysyqr = hysyqr;
	}

	public String getQqfs() {
		return qqfs;
	}

	public void setQqfs(String qqfs) {
		this.qqfs = qqfs;
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

	public String getHyglh() {
		return hyglh;
	}

	public void setHyglh(String hyglh) {
		this.hyglh = hyglh;
	}

	public String getSm() {
		return sm;
	}

	public void setSm(String sm) {
		this.sm = sm;
	}

	public String getSyjdqrq() {
		return syjdqrq;
	}

	public void setSyjdqrq(String syjdqrq) {
		this.syjdqrq = syjdqrq;
	}

	public String getJnfs() {
		return jnfs;
	}

	public void setJnfs(String jnfs) {
		this.jnfs = jnfs;
	}

	public String getYzje_ze() {
		return yzje_ze;
	}

	public void setYzje_ze(String yzjeZe) {
		yzje_ze = yzjeZe;
	}

	public String getYzje_s() {
		return yzje_s;
	}

	public void setYzje_s(String yzjeS) {
		yzje_s = yzjeS;
	}

	public String getYzje_shi() {
		return yzje_shi;
	}

	public void setYzje_shi(String yzjeShi) {
		yzje_shi = yzjeShi;
	}

	public String getYzje_q() {
		return yzje_q;
	}

	public void setYzje_q(String yzjeQ) {
		yzje_q = yzjeQ;
	}

	public String getZsje_s() {
		return zsje_s;
	}

	public void setZsje_s(String zsjeS) {
		zsje_s = zsjeS;
	}

	public String getZsje_shi() {
		return zsje_shi;
	}

	public void setZsje_shi(String zsjeShi) {
		zsje_shi = zsjeShi;
	}

	public String getZsje_q() {
		return zsje_q;
	}

	public void setZsje_q(String zsjeQ) {
		zsje_q = zsjeQ;
	}

	public String getJmje_s() {
		return jmje_s;
	}

	public void setJmje_s(String jmjeS) {
		jmje_s = jmjeS;
	}

	public String getJmje_shi() {
		return jmje_shi;
	}

	public void setJmje_shi(String jmjeShi) {
		jmje_shi = jmjeShi;
	}

	public String getJmje_q() {
		return jmje_q;
	}

	public void setJmje_q(String jmjeQ) {
		jmje_q = jmjeQ;
	}

	public String getSkr() {
		return skr;
	}

	public void setSkr(String skr) {
		this.skr = skr;
	}

	public String getSkje() {
		return skje;
	}

	public void setSkje(String skje) {
		this.skje = skje;
	}

	
	
}
