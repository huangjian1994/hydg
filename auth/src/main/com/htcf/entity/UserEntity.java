package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by hj on 2017-8-9.
 */

@Entity
@Table(name="dg_user")
public class UserEntity implements Serializable {


	@Id
	@GeneratedValue
	@Column(name="id")
	private String id;

    //用户名
    @Column(name="Name")
    private String Name;


    //密码
    @Column(name="password")
    private String password;


    //身份证id
    @Column(name="id_card")
    private String id_card;


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getName() {
		return Name;
	}


	public void setName(String name) {
		Name = name;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getId_card() {
		return id_card;
	}


	public void setId_card(String idCard) {
		id_card = idCard;
	}
    
    
    
    
    
    

}
