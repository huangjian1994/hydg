package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="BASE_OPERATELOG")
public class OperateLog implements Serializable{

	private static final long serialVersionUID = 3166791392798655660L;


	@Id
	@GeneratedValue
	@Column(name="Num_ID",length=32)
	private Long id;
	
	
	//用户身份证号
	@Column(name="User_ID")
	private String userId;
	
	
	@Column(name="User_Name")
	private String userName;
	
	//单位名称
	@Column(length=100)
	private String organization;
	
	
	//单位机构代码
	@Column(length=20,name="Organization_ID")
	private String organizationId;
	
	
	//终端标识
	@Column(name="Terminal_ID",length=40)
	private String terminalId;
	
	//操作类型
	@Column(length=1,name="operate_Type")
	private Long operateType;
	
	
	//操作时间
	@Column(name="Operate_Time")
	private String opTime;
	
	
	public void setOpTime(String opTime) {
		this.opTime = opTime;
	}



	//操作条件
	@Column(length=1000,name="Operate_Condition")
	private String operateCondition;
	
	
	//操作结果
	@Column(length=1,name="Operate_Result")
	private Long operateResult;
	
	
	//失败原因代码
	@Column(name="Error_Code",length=20)
	private String  errorCode;
	
	
	//功能模块名称
	@Column(name="Operate_Name",length=30)
	private String operateName;



	public Long getId() {
		return id;
	}



	public void setId(Long id) {
		this.id = id;
	}


	public String getUserName() {
		return userName;
	}



	public void setUserName(String userName) {
		this.userName = userName;
	}



	public String getOrganization() {
		return organization;
	}



	public void setOrganization(String organization) {
		this.organization = organization;
	}



	public String getOrganizationId() {
		return organizationId;
	}



	public void setOrganizationId(String organizationId) {
		this.organizationId = organizationId;
	}



	public String getTerminalId() {
		return terminalId;
	}



	public void setTerminalId(String terminalId) {
		this.terminalId = terminalId;
	}



	public String getOpTime() {
		return opTime;
	}



	public Long getOperateType() {
		return operateType;
	}



	public void setOperateType(Long operateType) {
		this.operateType = operateType;
	}




	public String getOperateCondition() {
		return operateCondition;
	}



	public void setOperateCondition(String operateCondition) {
		this.operateCondition = operateCondition;
	}



	public Long getOperateResult() {
		return operateResult;
	}



	public void setOperateResult(Long operateResult) {
		this.operateResult = operateResult;
	}



	public String getErrorCode() {
		return errorCode;
	}



	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}



	public String getOperateName() {
		return operateName;
	}



	public void setOperateName(String operateName) {
		this.operateName = operateName;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
	}

}
