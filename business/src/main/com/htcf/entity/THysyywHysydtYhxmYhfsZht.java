package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 用海项目信息管理 宗海图
 * @author yinying
 *
 */
@Entity
@Table(name="T_HYSYYW_HYSYDT_YHXM_ZHT")
public class THysyywHysydtYhxmYhfsZht  implements Serializable{

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
	private byte[] yhwzt;
	
	@Column
	private byte[] jzt;
	
	@Column
	private Long zsid;

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

	public byte[] getYhwzt() {
		return yhwzt;
	}

	public void setYhwzt(byte[] yhwzt) {
		this.yhwzt = yhwzt;
	}

	public byte[] getJzt() {
		return jzt;
	}

	public void setJzt(byte[] jzt) {
		this.jzt = jzt;
	}

	public Long getZsid() {
		return zsid;
	}

	public void setZsid(Long zsid) {
		this.zsid = zsid;
	}
	
	
	
}
