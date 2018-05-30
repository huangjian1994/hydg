package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 用海项目信息管理 项目信息
 * @author yinying
 *
 */
@Entity
@Table(name="T_HYSYYW_HYSYDT_YHXM")
public class THysyywHysydtYhxm  implements Serializable{

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
	
	//基本信息
	@Column
	private String yhxmmc;
	
	@Column
	private String xmwz;
	
	@Column
	private String zssl;
	
	@Column
	private String yhzmj;
	
	@Column
	private String mjdw;
	
	@Column
	private String tze;
	
	@Column
	private String tzedw;
	
	@Column
	private String zyax;
	
	@Column
	private String zyax_zr;
	@Column
	private String zyax_rg;
	
	@Column
	private String xzax;
	
	@Column
	private String hydb;
	
	@Column
	private String djjg;
	
	@Column
	private String sljgjb;
	
	@Column
	private String slrq;
	
	@Column
	private String xmwjcl;
	
	@Column
	private String fzjgjb;
	@Column
	private String fzjg;
	@Column
	private String spjg;
//	@Column
//	private String yhwzwzsm;//用海位置文字说明
	@Column
	private String yhpzrq;//用海批准日期

	@Column
	private String fgwxmdm;//发改委项目代码
	
	@Column
	private String bz;
	@Column
	private String xmxz;//项目性质：经营性、公益性
	@Column
	private String zt;
	@Column
	private String dczt;//导出状态
	
	
	//使用权人信息
	@Column
	private String hysyqr;
	
	@Column
	private String fddbr;
	
	@Column
	private String fddbrzw;
	
	@Column
	private String fddbrsfz;
	
	@Column
	private String txdz;
	
	@Column
	private String yzbm;
	
	@Column
	private String lxrxm;
	
	@Column
	private String lxrdh;
	
	@Column
	private String sj;
	
	@Column
	private String cz;

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
	private String yjjyrs;
	@Column
	private String yjldqyjjcz;
	@Column
	private String ljtdpjjg;
	@Column
	private String thcb;
	
	
	@Column
	private String shxydm;//社会信用代码
	
	
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

	public String getYhxmmc() {
		return yhxmmc;
	}

	public void setYhxmmc(String yhxmmc) {
		this.yhxmmc = yhxmmc;
	}

	public String getXmwz() {
		return xmwz;
	}

	public void setXmwz(String xmwz) {
		this.xmwz = xmwz;
	}

	public String getZssl() {
		return zssl;
	}

	public void setZssl(String zssl) {
		this.zssl = zssl;
	}

	public String getYhzmj() {
		return yhzmj;
	}

	public void setYhzmj(String yhzmj) {
		this.yhzmj = yhzmj;
	}

	public String getTze() {
		return tze;
	}

	public void setTze(String tze) {
		this.tze = tze;
	}

	public String getTzedw() {
		return tzedw;
	}

	public void setTzedw(String tzedw) {
		this.tzedw = tzedw;
	}

	public String getZyax() {
		return zyax;
	}

	public void setZyax(String zyax) {
		this.zyax = zyax;
	}

	public String getXzax() {
		return xzax;
	}

	public void setXzax(String xzax) {
		this.xzax = xzax;
	}

	public String getHydb() {
		return hydb;
	}

	public void setHydb(String hydb) {
		this.hydb = hydb;
	}

	public String getDjjg() {
		return djjg;
	}

	public void setDjjg(String djjg) {
		this.djjg = djjg;
	}

	public String getSljgjb() {
		return sljgjb;
	}

	public void setSljgjb(String sljgjb) {
		this.sljgjb = sljgjb;
	}

	public String getSlrq() {
		return slrq;
	}

	public void setSlrq(String slrq) {
		this.slrq = slrq;
	}

	public String getXmwjcl() {
		return xmwjcl;
	}

	public void setXmwjcl(String xmwjcl) {
		this.xmwjcl = xmwjcl;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}


	public String getZt() {
		return zt;
	}

	public void setZt(String zt) {
		this.zt = zt;
	}

	public String getHysyqr() {
		return hysyqr;
	}

	public void setHysyqr(String hysyqr) {
		this.hysyqr = hysyqr;
	}

	public String getFddbr() {
		return fddbr;
	}

	public void setFddbr(String fddbr) {
		this.fddbr = fddbr;
	}

	public String getFddbrzw() {
		return fddbrzw;
	}

	public void setFddbrzw(String fddbrzw) {
		this.fddbrzw = fddbrzw;
	}

	public String getFddbrsfz() {
		return fddbrsfz;
	}

	public void setFddbrsfz(String fddbrsfz) {
		this.fddbrsfz = fddbrsfz;
	}

	public String getTxdz() {
		return txdz;
	}

	public void setTxdz(String txdz) {
		this.txdz = txdz;
	}

	public String getYzbm() {
		return yzbm;
	}

	public void setYzbm(String yzbm) {
		this.yzbm = yzbm;
	}

	public String getLxrxm() {
		return lxrxm;
	}

	public void setLxrxm(String lxrxm) {
		this.lxrxm = lxrxm;
	}

	public String getLxrdh() {
		return lxrdh;
	}

	public void setLxrdh(String lxrdh) {
		this.lxrdh = lxrdh;
	}

	public String getSj() {
		return sj;
	}

	public void setSj(String sj) {
		this.sj = sj;
	}

	public String getCz() {
		return cz;
	}

	public void setCz(String cz) {
		this.cz = cz;
	}

	

	public String getFzjgjb() {
		return fzjgjb;
	}

	public void setFzjgjb(String fzjgjb) {
		this.fzjgjb = fzjgjb;
	}

	public String getFzjg() {
		return fzjg;
	}

	public void setFzjg(String fzjg) {
		this.fzjg = fzjg;
	}

	public String getSpjg() {
		return spjg;
	}

	public void setSpjg(String spjg) {
		this.spjg = spjg;
	}

	public String getZyax_zr() {
		return zyax_zr;
	}

	public void setZyax_zr(String zyaxZr) {
		zyax_zr = zyaxZr;
	}

	public String getZyax_rg() {
		return zyax_rg;
	}

	public void setZyax_rg(String zyaxRg) {
		zyax_rg = zyaxRg;
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

	public String getXmxz() {
		return xmxz;
	}

	public void setXmxz(String xmxz) {
		this.xmxz = xmxz;
	}

	public String getMjdw() {
		return mjdw;
	}

	public void setMjdw(String mjdw) {
		this.mjdw = mjdw;
	}

	public String getDczt() {
		return dczt;
	}

	public void setDczt(String dczt) {
		this.dczt = dczt;
	}

	public String getYhpzrq() {
		return yhpzrq;
	}

	public void setYhpzrq(String yhpzrq) {
		this.yhpzrq = yhpzrq;
	}

	public String getFgwxmdm() {
		return fgwxmdm;
	}

	public void setFgwxmdm(String fgwxmdm) {
		this.fgwxmdm = fgwxmdm;
	}

	public String getYjjyrs() {
		return yjjyrs;
	}

	public void setYjjyrs(String yjjyrs) {
		this.yjjyrs = yjjyrs;
	}

	public String getYjldqyjjcz() {
		return yjldqyjjcz;
	}

	public void setYjldqyjjcz(String yjldqyjjcz) {
		this.yjldqyjjcz = yjldqyjjcz;
	}

	public String getLjtdpjjg() {
		return ljtdpjjg;
	}

	public void setLjtdpjjg(String ljtdpjjg) {
		this.ljtdpjjg = ljtdpjjg;
	}

	public String getThcb() {
		return thcb;
	}

	public void setThcb(String thcb) {
		this.thcb = thcb;
	}

	public String getShxydm() {
		return shxydm;
	}

	public void setShxydm(String shxydm) {
		this.shxydm = shxydm;
	}
	
}
