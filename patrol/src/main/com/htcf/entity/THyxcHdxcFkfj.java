package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 海域巡查_海岛巡查_海岛巡查反馈基础信息表-附件
 * @author yinying
 *
 */
@Entity
@Table(name="T_HYXC_HDXC_FKFJ")
public class THyxcHdxcFkfj  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Long id;

	@Column
	private String patrolid;
	
	@Column
	private String fkid;
	
	@Column
	private byte[] photo;
	
	@Column
	private String filetype;
	
	@Column
	private String filename;
	
	@Column
	private String filepath;
	
	@Column
	private String feedbacktime;
	
	@Column
	private String feedbackname;
	
	@Column
	private String feedbackid;
	
	@Column
	private String updatetime;
	
	@Column
	private String updateuser;
	
	@Column
	private String bz;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPatrolid() {
		return patrolid;
	}

	public void setPatrolid(String patrolid) {
		this.patrolid = patrolid;
	}

	public String getFkid() {
		return fkid;
	}

	public void setFkid(String fkid) {
		this.fkid = fkid;
	}

	public byte[] getPhoto() {
		return photo;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}

	public String getFiletype() {
		return filetype;
	}

	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getFeedbacktime() {
		return feedbacktime;
	}

	public void setFeedbacktime(String feedbacktime) {
		this.feedbacktime = feedbacktime;
	}

	public String getFeedbackname() {
		return feedbackname;
	}

	public void setFeedbackname(String feedbackname) {
		this.feedbackname = feedbackname;
	}

	public String getFeedbackid() {
		return feedbackid;
	}

	public void setFeedbackid(String feedbackid) {
		this.feedbackid = feedbackid;
	}

	public String getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}

	public String getUpdateuser() {
		return updateuser;
	}

	public void setUpdateuser(String updateuser) {
		this.updateuser = updateuser;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}
	
	
	
	
}

	
