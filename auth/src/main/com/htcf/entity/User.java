package com.htcf.entity;



import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;



@Entity
@Table(name="BASE_USER")
public class User implements Serializable{
	
	private static final long serialVersionUID = -2719156154119271559L;


	@Id
	@GeneratedValue
	private String id;
	
	
	//用户名
	@Column(nullable = false,length=20,unique=true)
	private String userName;
	
	
	//密码
	@Column(nullable = false,length=20)
	private String password;
	
	
	//真实名称
	@Column(nullable = false,length=20)
	private String name;
	
	
	
	//身份证号
	@Column(name="User_ID",length=18)
	private String userId;
	
	
	



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}



	//警号
	@Column(length=30)
	private String policeNo;
	
	
	//单位编号
	@Column(length=20,name="organization_Id")
	private String organizationId;
	
	
	//单位
	@Column(length=50)
	private String organization;
	
	
	//部门编号
	@Column(length=20,name="department_Id")
	private String departmentId;
	
	
	
	//所属部门
	@Column(length=50)
	private String department;
	
	
	
	
	
	
	
	
	//联系方式
	@Column(length = 20)
	private String mphone;
	
	//邮箱
	@Column(length = 30)
	private String email;
	

	
	
	//地址信息
	@Column(length = 100)
	private String address;
	

	
	//专家字段
	
	//专业
	private String specialty;
	
	//学历
	private String edubackground;
	
	//性别
	private String gender;
	
	//职称
	private String  position;
	
	//所属领域
	private String professionalArea;
	

	
	

	//辅助字段

	//是否是系统的
	@Column(length=1)
	private String isSystem;
	
	
	//是否启用
	@Column(length=1)
	private String isenabled;
	
	//描述
	@Column
	private String description;
	
	
	public String getDescription() {
		return description;
	}


	
	public String getId() {
		return id;
	}



	@Transient
	private List<Role> roleList;
	
	@Transient
	private String roleId;
	
	@ManyToOne
	private Role role;
	

	public Role getRole() {
		return role;
	}



	public void setRole(Role role) {
		this.role = role;
	}



	public void setDescription(String description) {
		this.description = description;
	}

	public String getIsSystem() {
		return isSystem;
	}


	public void setIsSystem(String isSystem) {
		this.isSystem = isSystem;
	}


	public String getIsenabled() {
		return isenabled;
	}


	public void setIsenabled(String isenabled) {
		this.isenabled = isenabled;
	}
	
	
	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}




	public String getMphone() {
		return mphone;
	}


	public void setMphone(String mphone) {
		this.mphone = mphone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}




	public String getDepartment() {
		return department;
	}


	public void setDepartment(String department) {
		this.department = department;
	}
	
	public String getPoliceNo() {
		return policeNo;
	}


	public void setPoliceNo(String policeNo) {
		this.policeNo = policeNo;
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


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getDepartmentId() {
		return departmentId;
	}


	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getRoleId() {
		return roleId;
	}


	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}


	public List<Role> getRoleList() {
		return roleList;
	}


	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}




	public void setId(String id) {
		this.id = id;
	}

	public String getSpecialty() {
		return specialty;
	}



	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}



	public String getEdubackground() {
		return edubackground;
	}



	public void setEdubackground(String edubackground) {
		this.edubackground = edubackground;
	}



	public String getPosition() {
		return position;
	}



	public void setPosition(String position) {
		this.position = position;
	}



	public String getProfessionalArea() {
		return professionalArea;
	}



	public void setProfessionalArea(String professionalArea) {
		this.professionalArea = professionalArea;
	}

}
