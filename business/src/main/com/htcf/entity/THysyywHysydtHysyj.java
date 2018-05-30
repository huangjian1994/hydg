package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 海域使用金征收管理：废弃   用THysyywHysydtYhxmHysyj
 * @author yinying
 *
 */
@Entity
@Table(name="T_HYSYYW_HYSYDT_HYSYJZS")
public class THysyywHysydtHysyj  implements Serializable{

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
	private String yhfs_ej;
	
	@Column
	private String yhmj;
	
	@Column
	private String yzje_zygk;
	
	@Column
	private String yzje_dfgk;

	@Column
	private String zsje_zygk;

	@Column
	private String zsje_dfgk;

	@Column
	private String zsje_xj;

	@Column
	private String jmje_zygk;

	@Column
	private String jmje_dfgk;

	@Column
	private String jmje_xj;

	@Column
	private String jnrq;

	@Column
	private String djr;

	@Column
	private String djsj;

	@Column
	private String xmlx;

	@Column
	private String sfwlsyh;

	@Column
	private String yhsx;

	@Column
	private String type;

	@Column
	private String zsbh;
	
	@Column
	private String jnlx;

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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getZsbh() {
		return zsbh;
	}

	public void setZsbh(String zsbh) {
		this.zsbh = zsbh;
	}

	public String getJnlx() {
		return jnlx;
	}

	public void setJnlx(String jnlx) {
		this.jnlx = jnlx;
	}

	
	
}
