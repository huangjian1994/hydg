package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 海域巡查_海岛巡查_海岛巡查反馈基础信息表
 * @author yinying
 *
 */
@Entity
@Table(name="T_HYXC_HDXC_FKJCXX")
public class THyxcHdxcFkjcxx  implements Serializable{

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
	private String fillingunit;
	
	@Column
	private String begintime;
	
	@Column
	private String endtime;
	
	@Column
	private String leaderid;
	
	@Column
	private String leadername;
	
	@Column
	private String peoplename;
	
	@Column
	private String peopleid;
	
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
	private String datasource;
	
	@Column
	private String recorddevice;
	
	@Column
	private String substance;
	
	@Column
	private String classify;
	
	@Column
	private String represent;
	
	@Column
	private String bz;
	
	@Column
	private String addtime;

	@Column
	private String updateuserid;
	
	
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

	public String getFillingunit() {
		return fillingunit;
	}

	public void setFillingunit(String fillingunit) {
		this.fillingunit = fillingunit;
	}

	public String getBegintime() {
		return begintime;
	}

	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public String getLeaderid() {
		return leaderid;
	}

	public void setLeaderid(String leaderid) {
		this.leaderid = leaderid;
	}

	public String getLeadername() {
		return leadername;
	}

	public void setLeadername(String leadername) {
		this.leadername = leadername;
	}

	public String getPeoplename() {
		return peoplename;
	}

	public void setPeoplename(String peoplename) {
		this.peoplename = peoplename;
	}

	public String getPeopleid() {
		return peopleid;
	}

	public void setPeopleid(String peopleid) {
		this.peopleid = peopleid;
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

	public String getDatasource() {
		return datasource;
	}

	public void setDatasource(String datasource) {
		this.datasource = datasource;
	}

	public String getRecorddevice() {
		return recorddevice;
	}

	public void setRecorddevice(String recorddevice) {
		this.recorddevice = recorddevice;
	}

	public String getSubstance() {
		return substance;
	}

	public void setSubstance(String substance) {
		this.substance = substance;
	}

	public String getClassify() {
		return classify;
	}

	public void setClassify(String classify) {
		this.classify = classify;
	}

	public String getRepresent() {
		return represent;
	}

	public void setRepresent(String represent) {
		this.represent = represent;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getAddtime() {
		return addtime;
	}

	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}

	public String getUpdateuserid() {
		return updateuserid;
	}

	public void setUpdateuserid(String updateuserid) {
		this.updateuserid = updateuserid;
	}

	     
}

	
