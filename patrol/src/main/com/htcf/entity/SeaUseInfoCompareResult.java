package com.htcf.entity;
// default package

import java.util.List;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import org.hibernate.annotations.GenericGenerator;


/**
 * 用海信息比对结果(用于展示)
 * ********注意：字段名必须与SeaUseInfoCompare类保持一致*******
 * @author lwb
 *
 */
public class SeaUseInfoCompareResult {


     private Long id;
     private String addtime;
     private String lastupdatetime;
     private String addusername;
     private String adduserid;
     private String projectId;
     private String projectName;
     /**
      * 项目性质
      */
     private List<String> projectNature;
     /**
      * 海域用途
      */
     private List<String> seaAreaUse;
     /**
      * 用海方式
      */
     private List<String> seaUseWay;
     /**
      * 用海范围
      */
     private List<String> seaUseRange;
     /**
      * 用海面积
      */
     private List<String> seaUseAreage;
     /**
      * 用海期限
      */
     private List<String> seaUseDeadline;
     /**
      * 是否缴纳海域使用金
      */
     private List<String> isPay;


    public SeaUseInfoCompareResult() {
    }
    

	public SeaUseInfoCompareResult(Long id, String addtime,
			String lastupdatetime, String addusername, String adduserid,
			String projectId, String projectName, List<String> projectNature,
			List<String> seaAreaUse, List<String> seaUseWay,
			List<String> seaUseRange, List<String> seaUseAreage,
			List<String> seaUseDeadline, List<String> isPay) {
		super();
		this.id = id;
		this.addtime = addtime;
		this.lastupdatetime = lastupdatetime;
		this.addusername = addusername;
		this.adduserid = adduserid;
		this.projectId = projectId;
		this.projectName = projectName;
		this.projectNature = projectNature;
		this.seaAreaUse = seaAreaUse;
		this.seaUseWay = seaUseWay;
		this.seaUseRange = seaUseRange;
		this.seaUseAreage = seaUseAreage;
		this.seaUseDeadline = seaUseDeadline;
		this.isPay = isPay;
	}




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


	public String getProjectId() {
		return projectId;
	}


	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}


	public String getProjectName() {
		return projectName;
	}


	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}


	public List<String> getProjectNature() {
		return projectNature;
	}


	public void setProjectNature(List<String> projectNature) {
		this.projectNature = projectNature;
	}


	public List<String> getSeaAreaUse() {
		return seaAreaUse;
	}


	public void setSeaAreaUse(List<String> seaAreaUse) {
		this.seaAreaUse = seaAreaUse;
	}


	public List<String> getSeaUseWay() {
		return seaUseWay;
	}


	public void setSeaUseWay(List<String> seaUseWay) {
		this.seaUseWay = seaUseWay;
	}


	public List<String> getSeaUseRange() {
		return seaUseRange;
	}


	public void setSeaUseRange(List<String> seaUseRange) {
		this.seaUseRange = seaUseRange;
	}


	public List<String> getSeaUseAreage() {
		return seaUseAreage;
	}


	public void setSeaUseAreage(List<String> seaUseAreage) {
		this.seaUseAreage = seaUseAreage;
	}


	public List<String> getSeaUseDeadline() {
		return seaUseDeadline;
	}


	public void setSeaUseDeadline(List<String> seaUseDeadline) {
		this.seaUseDeadline = seaUseDeadline;
	}


	public List<String> getIsPay() {
		return isPay;
	}


	public void setIsPay(List<String> isPay) {
		this.isPay = isPay;
	}

    


}