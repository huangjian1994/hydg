package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 用海项目批后监管 用海项目动态管理 附件：照片影像
 * @author yinying
 *
 */
@Entity
@Table(name="T_HYSYYW_HYSYDT_YHXMPHJG_DTFJ")
public class THysyywHysydtYhxmphjgDtfj  implements Serializable{

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
	private Long dtid;

	@Column
	private byte[] xczp;
	
	@Column
	private String xcyxmc;
	
	@Column
	private String yxjtmc;
	
	@Column
	private String type;
	
	@Column
	private String wjlx;
	

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
	
	public Long getDtid() {
		return dtid;
	}

	public void setDtid(Long dtid) {
		this.dtid = dtid;
	}

	public byte[] getXczp() {
		return xczp;
	}

	public void setXczp(byte[] xczp) {
		this.xczp = xczp;
	}

	public String getXcyxmc() {
		return xcyxmc;
	}

	public void setXcyxmc(String xcyxmc) {
		this.xcyxmc = xcyxmc;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getYxjtmc() {
		return yxjtmc;
	}

	public void setYxjtmc(String yxjtmc) {
		this.yxjtmc = yxjtmc;
	}

	public String getWjlx() {
		return wjlx;
	}

	public void setWjlx(String wjlx) {
		this.wjlx = wjlx;
	}


	
}
