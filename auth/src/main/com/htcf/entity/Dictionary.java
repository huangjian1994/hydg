package com.htcf.entity;


import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;



/**
 * 数据字典表
 * @author LIUYL
 *
 */

@Entity
@Table(name="BASE_DICTIONARY")
public class Dictionary implements Serializable {




	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;



	@Id
	@GeneratedValue
	private Long id;
	
	
	
	@Column
	private String key;
	
	
	@Column
	private String value;
	
	@Column
	private String dm;
	
	@Column
	private String bm;
	
	@Column
	private String xs;


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getKey() {
		return key;
	}


	public void setKey(String key) {
		this.key = key;
	}


	public String getValue() {
		return value;
	}


	public void setValue(String value) {
		this.value = value;
	}



	public String getDm() {
		return dm;
	}


	public void setDm(String dm) {
		this.dm = dm;
	}


	public String getBm() {
		return bm;
	}


	public void setBm(String bm) {
		this.bm = bm;
	}


	public String getXs() {
		return xs;
	}


	public void setXs(String xs) {
		this.xs = xs;
	}
	
	

}
