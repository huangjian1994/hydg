package com.htcf.entity;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 功能区划管理 海洋功能区辅助划分
 * @author hj
 *
 */
@Entity
@Table(name="T_HYSYYW_HYGNQH_FZHF")
public class THysyywHygnqhFzhf implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Long id;

	@Column
	private String addtime;//新增时间

	@Column
	private String lastupdatetime;//最后修改时间
	
	@Column
	private String addusername;//新增用户姓名
	
	@Column
	private String adduserid;//新增用户唯一标识
	
	@Column
	private Long gnqhid;//功能区划ID：T_HYSYYW_HYGNQH_XXGL
	
	@Column
	private String gnqhmc;//功能区划名称
	
	@Column
	private String ghqx;//规划期限
	
	@Column
	private String ghlx;//规划类型
	
	@Column
	private String ghyhmj;//规划用海面积
	
	@Column
	private String ghthmj;//规划填海面积
	
	@Column
	private String ghyhgndw;//规划用海功能定位
	
	@Column
	private String ghjj;//规划简介
	
	@Column
	private String fzhfmc;//辅助划分名称
	
	@Column
	private String sfyxjlss;//是否允许建立设施

	@Column
	private String ssnr;//设施内容

	@Column
	private String sfyxryzy;//是否允许人员作业

	@Column
	private String zynr;//作业内容

	@Column
	private String jzx;//禁止项

	@Column
	private String syx;//适宜项

	@Column
	private String bsyx;//不适宜项

	@Column
	private String ms;//描述

	@Column
	private String bz;//编制：定期、不定期

    @Column
    private String updateusername;

    @Column
    private String updateuserid;



	/*-----------------------------------------------*/

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

    public Long getGnqhid() {
        return gnqhid;
    }

    public void setGnqhid(Long gnqhid) {
        this.gnqhid = gnqhid;
    }

    public String getGnqhmc() {
        return gnqhmc;
    }

    public void setGnqhmc(String gnqhmc) {
        this.gnqhmc = gnqhmc;
    }

    public String getGhqx() {
        return ghqx;
    }

    public void setGhqx(String ghqx) {
        this.ghqx = ghqx;
    }

    public String getGhlx() {
        return ghlx;
    }

    public void setGhlx(String ghlx) {
        this.ghlx = ghlx;
    }

    public String getGhyhmj() {
        return ghyhmj;
    }

    public void setGhyhmj(String ghyhmj) {
        this.ghyhmj = ghyhmj;
    }

    public String getGhthmj() {
        return ghthmj;
    }

    public void setGhthmj(String ghthmj) {
        this.ghthmj = ghthmj;
    }

    public String getGhyhgndw() {
        return ghyhgndw;
    }

    public void setGhyhgndw(String ghyhgndw) {
        this.ghyhgndw = ghyhgndw;
    }

    public String getGhjj() {
        return ghjj;
    }

    public void setGhjj(String ghjj) {
        this.ghjj = ghjj;
    }

    public String getFzhfmc() {
        return fzhfmc;
    }

    public void setFzhfmc(String fzhfmc) {
        this.fzhfmc = fzhfmc;
    }

    public String getSfyxjlss() {
        return sfyxjlss;
    }

    public void setSfyxjlss(String sfyxjlss) {
        this.sfyxjlss = sfyxjlss;
    }

    public String getSsnr() {
        return ssnr;
    }

    public void setSsnr(String ssnr) {
        this.ssnr = ssnr;
    }

    public String getSfyxryzy() {
        return sfyxryzy;
    }

    public void setSfyxryzy(String sfyxryzy) {
        this.sfyxryzy = sfyxryzy;
    }

    public String getZynr() {
        return zynr;
    }

    public void setZynr(String zynr) {
        this.zynr = zynr;
    }

    public String getJzx() {
        return jzx;
    }

    public void setJzx(String jzx) {
        this.jzx = jzx;
    }

    public String getSyx() {
        return syx;
    }

    public void setSyx(String syx) {
        this.syx = syx;
    }

    public String getBsyx() {
        return bsyx;
    }

    public void setBsyx(String bsyx) {
        this.bsyx = bsyx;
    }

    public String getMs() {
        return ms;
    }

    public void setMs(String ms) {
        this.ms = ms;
    }

    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }

    public String getUpdateusername() {
        return updateusername;
    }

    public void setUpdateusername(String updateusername) {
        this.updateusername = updateusername;
    }

    public String getUpdateuserid() {
        return updateuserid;
    }

    public void setUpdateuserid(String updateuserid) {
        this.updateuserid = updateuserid;
    }
}

	
