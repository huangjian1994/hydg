package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 内外部接口-资质管理
 * @author yinying
 *
 */
@Entity
@Table(name="T_HYSYYW_NWBJK_ZZGL")
public class THysyywNwbjkZzgl  implements Serializable{

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
	
	//海域使用论证资质证书
	@Column
	private String zzlx;
	
	@Column
	private String zsbh;
	
	@Column
	private String dwmc;
	
	@Column
	private String fddbr;
	
	@Column
	private String zsdj;
	
	@Column
	private String ywfw;
	
	@Column
	private String yxqz;
	
	@Column
	private String fzjg;
	
	@Column
	private String fzrq;
	
	@Column
	private String lxdz;
	
	@Column
	private String lxbm;
	
	@Column
	private String lxr;
	
	@Column
	private String dh;
	
	@Column
	private String e_mail;
	
	//测绘资质证书
	@Column
	private String zcdz;
	
	@Column
	private String zyfw;
	
	@Column
	private String chzlfcfzr;
	
	@Column
	private String fjtpmc;
	
	@Column
	private byte[] fjtp;
	
	@Column
	private String fjwj;
	
	@Column
	private String shxydm;//社会信用代码
	
	
	
	//海籍调查信息
	@Column
	private String chfzr;
	@Column
	private String chdw;
	@Column
	private String chrq;
	@Column
	private String chds;
	@Column
	private String ty;
	@Column
	private String glblc;
	@Column
	private String zbxmc;
	
	//论证报告
	@Column
	private String lzbgmc;
	@Column
	private String lzdw;
	@Column
	private String zzdj;
	@Column
	private String xmfzr;
	@Column
	private String zzpsbm;
	@Column
	private String pszjzzz;
	@Column
	private String psrq;
	@Column
	private String zlpgf;
	
	@Column
	private String istp;
	
	
	
	
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
	public String getZzlx() {
		return zzlx;
	}
	public void setZzlx(String zzlx) {
		this.zzlx = zzlx;
	}
	public String getZsbh() {
		return zsbh;
	}
	public void setZsbh(String zsbh) {
		this.zsbh = zsbh;
	}
	public String getDwmc() {
		return dwmc;
	}
	public void setDwmc(String dwmc) {
		this.dwmc = dwmc;
	}
	public String getFddbr() {
		return fddbr;
	}
	public void setFddbr(String fddbr) {
		this.fddbr = fddbr;
	}
	public String getZsdj() {
		return zsdj;
	}
	public void setZsdj(String zsdj) {
		this.zsdj = zsdj;
	}
	public String getYwfw() {
		return ywfw;
	}
	public void setYwfw(String ywfw) {
		this.ywfw = ywfw;
	}
	public String getYxqz() {
		return yxqz;
	}
	public void setYxqz(String yxqz) {
		this.yxqz = yxqz;
	}
	public String getFzjg() {
		return fzjg;
	}
	public void setFzjg(String fzjg) {
		this.fzjg = fzjg;
	}
	public String getFzrq() {
		return fzrq;
	}
	public void setFzrq(String fzrq) {
		this.fzrq = fzrq;
	}
	public String getLxdz() {
		return lxdz;
	}
	public void setLxdz(String lxdz) {
		this.lxdz = lxdz;
	}
	public String getLxr() {
		return lxr;
	}
	public void setLxr(String lxr) {
		this.lxr = lxr;
	}
	public String getDh() {
		return dh;
	}
	public void setDh(String dh) {
		this.dh = dh;
	}
	public String getE_mail() {
		return e_mail;
	}
	public void setE_mail(String eMail) {
		e_mail = eMail;
	}
	public String getZcdz() {
		return zcdz;
	}
	public void setZcdz(String zcdz) {
		this.zcdz = zcdz;
	}
	public String getZyfw() {
		return zyfw;
	}
	public void setZyfw(String zyfw) {
		this.zyfw = zyfw;
	}
	public String getChzlfcfzr() {
		return chzlfcfzr;
	}
	public void setChzlfcfzr(String chzlfcfzr) {
		this.chzlfcfzr = chzlfcfzr;
	}
	
	public String getFjwj() {
		return fjwj;
	}
	public void setFjwj(String fjwj) {
		this.fjwj = fjwj;
	}
	public String getChfzr() {
		return chfzr;
	}
	public void setChfzr(String chfzr) {
		this.chfzr = chfzr;
	}
	public String getChdw() {
		return chdw;
	}
	public void setChdw(String chdw) {
		this.chdw = chdw;
	}
	public String getChrq() {
		return chrq;
	}
	public void setChrq(String chrq) {
		this.chrq = chrq;
	}
	public String getChds() {
		return chds;
	}
	public void setChds(String chds) {
		this.chds = chds;
	}
	public String getTy() {
		return ty;
	}
	public void setTy(String ty) {
		this.ty = ty;
	}
	public String getGlblc() {
		return glblc;
	}
	public void setGlblc(String glblc) {
		this.glblc = glblc;
	}
	public String getZbxmc() {
		return zbxmc;
	}
	public void setZbxmc(String zbxmc) {
		this.zbxmc = zbxmc;
	}
	public String getLzbgmc() {
		return lzbgmc;
	}
	public void setLzbgmc(String lzbgmc) {
		this.lzbgmc = lzbgmc;
	}
	public String getLzdw() {
		return lzdw;
	}
	public void setLzdw(String lzdw) {
		this.lzdw = lzdw;
	}
	public String getZzdj() {
		return zzdj;
	}
	public void setZzdj(String zzdj) {
		this.zzdj = zzdj;
	}
	public String getXmfzr() {
		return xmfzr;
	}
	public void setXmfzr(String xmfzr) {
		this.xmfzr = xmfzr;
	}
	public String getZzpsbm() {
		return zzpsbm;
	}
	public void setZzpsbm(String zzpsbm) {
		this.zzpsbm = zzpsbm;
	}
	public String getPszjzzz() {
		return pszjzzz;
	}
	public void setPszjzzz(String pszjzzz) {
		this.pszjzzz = pszjzzz;
	}
	public String getPsrq() {
		return psrq;
	}
	public void setPsrq(String psrq) {
		this.psrq = psrq;
	}
	public String getZlpgf() {
		return zlpgf;
	}
	public void setZlpgf(String zlpgf) {
		this.zlpgf = zlpgf;
	}
	public String getLxbm() {
		return lxbm;
	}
	public void setLxbm(String lxbm) {
		this.lxbm = lxbm;
	}
	public String getFjtpmc() {
		return fjtpmc;
	}
	public void setFjtpmc(String fjtpmc) {
		this.fjtpmc = fjtpmc;
	}
	public byte[] getFjtp() {
		return fjtp;
	}
	public void setFjtp(byte[] fjtp) {
		this.fjtp = fjtp;
	}
	public String getIstp() {
		return istp;
	}
	public void setIstp(String istp) {
		this.istp = istp;
	}
	public String getShxydm() {
		return shxydm;
	}
	public void setShxydm(String shxydm) {
		this.shxydm = shxydm;
	}
	
	
	
}
