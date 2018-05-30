package com.htcf.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 内外部接口-市不动产平台反馈
 * @author yinying
 *
 */
@Entity
@Table(name="T_HYSYYW_NWBJK_SBDCPT_FK")
public class THysyywNwbjkSbdcptFk  implements Serializable{

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
	
	@Column
	private String legalname;
	
	@Column
	private String legalposition;
	
	@Column
	private String legalcardno;
	
	@Column
	private String agentaddress;
	
	@Column
	private String agentzip;
	
	@Column
	private String agentname;
	
	@Column
	private String agenttel;
	
	@Column
	private String projectname;
	
	@Column
	private String name;
	
	@Column
	private String tel;
	
	@Column
	private String seausekind;
	
	@Column
	private String approvalnum;
	
	@Column
	private String usedarea;
	
	@Column
	private String area;
	
	@Column
	private String seausetypea;
	
	@Column
	private String seausetypeb;
	
	@Column
	private String seausemode;
	
	@Column
	private String applyyear;
	
	@Column
	private String begindate;
	
	@Column
	private String duedate;
	
	@Column
	private String other;
	
	@Column
	private String other_passdate;
	
	@Column
	private String limit;
	
	@Column
	private String limit_passdate;
	
	@Column
	private String dissent;
	
	@Column
	private String dissent_passdate;
	
	@Column
	private String correct;
	
	@Column
	private String realno;
	
	@Column
	private String unitcode;
	
	@Column
	private String passdate;
	
	@Column
	private String enddate;
	
	@Column
	private String acceptuser;
	
	@Column
	private String audituser;

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

	public String getLegalname() {
		return legalname;
	}

	public void setLegalname(String legalname) {
		this.legalname = legalname;
	}

	public String getLegalposition() {
		return legalposition;
	}

	public void setLegalposition(String legalposition) {
		this.legalposition = legalposition;
	}

	public String getLegalcardno() {
		return legalcardno;
	}

	public void setLegalcardno(String legalcardno) {
		this.legalcardno = legalcardno;
	}

	public String getAgentaddress() {
		return agentaddress;
	}

	public void setAgentaddress(String agentaddress) {
		this.agentaddress = agentaddress;
	}

	public String getAgentzip() {
		return agentzip;
	}

	public void setAgentzip(String agentzip) {
		this.agentzip = agentzip;
	}

	public String getAgentname() {
		return agentname;
	}

	public void setAgentname(String agentname) {
		this.agentname = agentname;
	}

	public String getAgenttel() {
		return agenttel;
	}

	public void setAgenttel(String agenttel) {
		this.agenttel = agenttel;
	}

	public String getProjectname() {
		return projectname;
	}

	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getSeausekind() {
		return seausekind;
	}

	public void setSeausekind(String seausekind) {
		this.seausekind = seausekind;
	}

	public String getApprovalnum() {
		return approvalnum;
	}

	public void setApprovalnum(String approvalnum) {
		this.approvalnum = approvalnum;
	}

	public String getUsedarea() {
		return usedarea;
	}

	public void setUsedarea(String usedarea) {
		this.usedarea = usedarea;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getSeausetypea() {
		return seausetypea;
	}

	public void setSeausetypea(String seausetypea) {
		this.seausetypea = seausetypea;
	}

	public String getSeausetypeb() {
		return seausetypeb;
	}

	public void setSeausetypeb(String seausetypeb) {
		this.seausetypeb = seausetypeb;
	}

	public String getSeausemode() {
		return seausemode;
	}

	public void setSeausemode(String seausemode) {
		this.seausemode = seausemode;
	}

	public String getApplyyear() {
		return applyyear;
	}

	public void setApplyyear(String applyyear) {
		this.applyyear = applyyear;
	}

	public String getBegindate() {
		return begindate;
	}

	public void setBegindate(String begindate) {
		this.begindate = begindate;
	}

	public String getDuedate() {
		return duedate;
	}

	public void setDuedate(String duedate) {
		this.duedate = duedate;
	}

	public String getOther() {
		return other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	public String getOther_passdate() {
		return other_passdate;
	}

	public void setOther_passdate(String otherPassdate) {
		other_passdate = otherPassdate;
	}

	public String getLimit() {
		return limit;
	}

	public void setLimit(String limit) {
		this.limit = limit;
	}

	public String getLimit_passdate() {
		return limit_passdate;
	}

	public void setLimit_passdate(String limitPassdate) {
		limit_passdate = limitPassdate;
	}

	public String getDissent() {
		return dissent;
	}

	public void setDissent(String dissent) {
		this.dissent = dissent;
	}

	public String getDissent_passdate() {
		return dissent_passdate;
	}

	public void setDissent_passdate(String dissentPassdate) {
		dissent_passdate = dissentPassdate;
	}

	public String getCorrect() {
		return correct;
	}

	public void setCorrect(String correct) {
		this.correct = correct;
	}

	public String getRealno() {
		return realno;
	}

	public void setRealno(String realno) {
		this.realno = realno;
	}

	public String getUnitcode() {
		return unitcode;
	}

	public void setUnitcode(String unitcode) {
		this.unitcode = unitcode;
	}

	public String getPassdate() {
		return passdate;
	}

	public void setPassdate(String passdate) {
		this.passdate = passdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public String getAcceptuser() {
		return acceptuser;
	}

	public void setAcceptuser(String acceptuser) {
		this.acceptuser = acceptuser;
	}

	public String getAudituser() {
		return audituser;
	}

	public void setAudituser(String audituser) {
		this.audituser = audituser;
	}
	
	
	
}
