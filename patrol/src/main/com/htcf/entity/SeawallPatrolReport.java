package com.htcf.entity;
// default package

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;


/**
 * 海塘巡查上报
 * @author lwb
 *
 */
@Entity
@Table(name="T_HYSYYW_HTXCSB"
   // ,schema="HYDGCF"
)

public class SeawallPatrolReport  implements java.io.Serializable {


    // Fields    
	 /**
	  * 附件
	  */
	 private List<SeawallPatrolAttachment> attachments;
	 
     private Long id;
     private String addtime;
     private String lastupdatetime;
     private String addusername;
     private String adduserid;
     private String stPatrolPerson;
     private String stPatrolPersonId;
     /**
      * 上报方式
      */
     private String stReportType;
     /**
      * 上报单位id
      */
     private String stReportDepartmentId;
     /**
      * 上报单位
      */
     private String stReportDepartment;
     /**
      * 问题桩号范围
      */
     private String stScopeKm;
     private String stScopem;
     /**
      * 岸段属性
      */
     private String stCoastSegmentAttr;
     private String stEventsn;
     private Date dtDiscovertime;
     private String stKeepersn;
     private String stClaimsource;
     private String stClaimperson;
     private String stPhoneno;
     private String stComponentsn;
     /**
      * 市辖区
      */
     private String stAreacode;
     private String stStreetcode;
     private String stCommunitycode;
     private String stGridcode;
     /**
      * 问题类别（大类）
      */
     private String stEbclass;
     /**
      * 问题类别（小类）
      */
     private String stEsclass;
     private String stAddress;
     private String nmPosx;
     private String nmPosy;
     /**
      * 问题描述
      */
     private String stDescription;
     private String stImagefileno;
     private String stWavfileno;
     private String stEventsource;
     private String stEventtype;
     private Date dtDinserttime;
     private Date dtDupdatetime;
     private String stHotlinesn;
     private Date dtCreatetime;
     private String stCreateperson;
     private String stCreatenote;
     private Date dtRinserttime;
     private Date dtRupdatetime;
     private String stCasesn;
     private Short nmState;
     private String stIscancel;
     private Date dtCanceldatetime;
     private String stCancelnote;
     private String stCanceluser;
     private Integer nmDhtype;
     private String stEvsclass;
     private String stZdevent;
     private String stCqevevt;
     private String stDbevent;


    // Constructors

    /** default constructor */
    public SeawallPatrolReport() {
    }

    
    /** full constructor */
    public SeawallPatrolReport(String addtime, String lastupdatetime, String addusername, String adduserid, String stPatrolPerson, String stPatrolPersonId, String stReportType, String stScopeKm, String stScopem, String stCoastSegmentAttr, String stEventsn, Date dtDiscovertime, String stKeepersn, String stClaimsource, String stClaimperson, String stPhoneno, String stComponentsn, String stAreacode, String stStreetcode, String stCommunitycode, String stGridcode, String stEbclass, String stEsclass, String stAddress, String nmPosx, String nmPosy, String stDescription, String stImagefileno, String stReportDepartmentId, String stReportDepartment, String stWavfileno, String stEventsource, String stEventtype, Date dtDinserttime, Date dtDupdatetime, String stHotlinesn, Date dtCreatetime, String stCreateperson, String stCreatenote, Date dtRinserttime, Date dtRupdatetime, String stCasesn, Short nmState, String stIscancel, Date dtCanceldatetime, String stCancelnote, String stCanceluser, Integer nmDhtype, String stEvsclass, String stZdevent, String stCqevevt, String stDbevent) {
    	this.stReportDepartmentId = stReportDepartmentId;
    	this.stReportDepartment = stReportDepartment;
        this.addtime = addtime;
        this.lastupdatetime = lastupdatetime;
        this.addusername = addusername;
        this.adduserid = adduserid;
        this.stPatrolPerson = stPatrolPerson;
        this.stPatrolPersonId = stPatrolPersonId;
        this.stReportType = stReportType;
        this.stScopeKm = stScopeKm;
        this.stScopem = stScopem;
        this.stCoastSegmentAttr = stCoastSegmentAttr;
        this.stEventsn = stEventsn;
        this.dtDiscovertime = dtDiscovertime;
        this.stKeepersn = stKeepersn;
        this.stClaimsource = stClaimsource;
        this.stClaimperson = stClaimperson;
        this.stPhoneno = stPhoneno;
        this.stComponentsn = stComponentsn;
        this.stAreacode = stAreacode;
        this.stStreetcode = stStreetcode;
        this.stCommunitycode = stCommunitycode;
        this.stGridcode = stGridcode;
        this.stEbclass = stEbclass;
        this.stEsclass = stEsclass;
        this.stAddress = stAddress;
        this.nmPosx = nmPosx;
        this.nmPosy = nmPosy;
        this.stDescription = stDescription;
        this.stImagefileno = stImagefileno;
        this.stWavfileno = stWavfileno;
        this.stEventsource = stEventsource;
        this.stEventtype = stEventtype;
        this.dtDinserttime = dtDinserttime;
        this.dtDupdatetime = dtDupdatetime;
        this.stHotlinesn = stHotlinesn;
        this.dtCreatetime = dtCreatetime;
        this.stCreateperson = stCreateperson;
        this.stCreatenote = stCreatenote;
        this.dtRinserttime = dtRinserttime;
        this.dtRupdatetime = dtRupdatetime;
        this.stCasesn = stCasesn;
        this.nmState = nmState;
        this.stIscancel = stIscancel;
        this.dtCanceldatetime = dtCanceldatetime;
        this.stCancelnote = stCancelnote;
        this.stCanceluser = stCanceluser;
        this.nmDhtype = nmDhtype;
        this.stEvsclass = stEvsclass;
        this.stZdevent = stZdevent;
        this.stCqevevt = stCqevevt;
        this.stDbevent = stDbevent;
    }

   
    // Property accessors
    @GenericGenerator(name="generator", strategy="increment")@Id @GeneratedValue(generator="generator")
    
    @Column(name="ID", unique=true, nullable=false, precision=18, scale=0)

    public Long getId() {
        return this.id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    @Column(name="ADDTIME", length=50)

    public String getAddtime() {
        return this.addtime;
    }
    
    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }
    
    @Column(name="LASTUPDATETIME", length=50)

    public String getLastupdatetime() {
        return this.lastupdatetime;
    }
    
    public void setLastupdatetime(String lastupdatetime) {
        this.lastupdatetime = lastupdatetime;
    }
    
    @Column(name="ADDUSERNAME", length=50)

    public String getAddusername() {
        return this.addusername;
    }
    
    public void setAddusername(String addusername) {
        this.addusername = addusername;
    }
    
    @Column(name="ADDUSERID", length=50)

    public String getAdduserid() {
        return this.adduserid;
    }
    
    public void setAdduserid(String adduserid) {
        this.adduserid = adduserid;
    }
    
    @Column(name="ST_PATROL_PERSON", length=500)

    public String getStPatrolPerson() {
        return this.stPatrolPerson;
    }
    
    public void setStPatrolPerson(String stPatrolPerson) {
        this.stPatrolPerson = stPatrolPerson;
    }
    
    @Column(name="ST_PATROL_PERSON_ID", length=500)

    public String getStPatrolPersonId() {
        return this.stPatrolPersonId;
    }
    
    public void setStPatrolPersonId(String stPatrolPersonId) {
        this.stPatrolPersonId = stPatrolPersonId;
    }
    
    @Column(name="ST_REPORT_TYPE", length=4)

    public String getStReportType() {
        return this.stReportType;
    }
    
    public void setStReportType(String stReportType) {
        this.stReportType = stReportType;
    }
    
    @Column(name="ST_SCOPE_KM", length=8)

    public String getStScopeKm() {
        return this.stScopeKm;
    }
    
    public void setStScopeKm(String stScopeKm) {
        this.stScopeKm = stScopeKm;
    }
    
    @Column(name="ST_SCOPE_M", length=8)

    public String getStScopem() {
        return this.stScopem;
    }
    
    public void setStScopem(String stScopem) {
        this.stScopem = stScopem;
    }
    
    @Column(name="ST_COAST_SEGMENT_ATTR", length=4)

    public String getStCoastSegmentAttr() {
        return this.stCoastSegmentAttr;
    }
    
    public void setStCoastSegmentAttr(String stCoastSegmentAttr) {
        this.stCoastSegmentAttr = stCoastSegmentAttr;
    }
    
    @Column(name="ST_EVENTSN", length=30)

    public String getStEventsn() {
        return this.stEventsn;
    }
    
    public void setStEventsn(String stEventsn) {
        this.stEventsn = stEventsn;
    }
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="DT_DISCOVERTIME", length=7)

    public Date getDtDiscovertime() {
        return this.dtDiscovertime;
    }
    
    public void setDtDiscovertime(Date dtDiscovertime) {
        this.dtDiscovertime = dtDiscovertime;
    }
    
    @Column(name="ST_KEEPERSN", length=30)

    public String getStKeepersn() {
        return this.stKeepersn;
    }
    
    public void setStKeepersn(String stKeepersn) {
        this.stKeepersn = stKeepersn;
    }
    
    @Column(name="ST_CLAIMSOURCE", length=40)

    public String getStClaimsource() {
        return this.stClaimsource;
    }
    
    public void setStClaimsource(String stClaimsource) {
        this.stClaimsource = stClaimsource;
    }
    
    @Column(name="ST_CLAIMPERSON", length=20)

    public String getStClaimperson() {
        return this.stClaimperson;
    }
    
    public void setStClaimperson(String stClaimperson) {
        this.stClaimperson = stClaimperson;
    }
    
    @Column(name="ST_PHONENO", length=20)

    public String getStPhoneno() {
        return this.stPhoneno;
    }
    
    public void setStPhoneno(String stPhoneno) {
        this.stPhoneno = stPhoneno;
    }
    
    @Column(name="ST_COMPONENTSN", length=14)

    public String getStComponentsn() {
        return this.stComponentsn;
    }
    
    public void setStComponentsn(String stComponentsn) {
        this.stComponentsn = stComponentsn;
    }
    
    @Column(name="ST_AREACODE", length=4)

    public String getStAreacode() {
        return this.stAreacode;
    }
    
    public void setStAreacode(String stAreacode) {
        this.stAreacode = stAreacode;
    }
    
    @Column(name="ST_STREETCODE", length=4)

    public String getStStreetcode() {
        return this.stStreetcode;
    }
    
    public void setStStreetcode(String stStreetcode) {
        this.stStreetcode = stStreetcode;
    }
    
    @Column(name="ST_COMMUNITYCODE", length=8)

    public String getStCommunitycode() {
        return this.stCommunitycode;
    }
    
    public void setStCommunitycode(String stCommunitycode) {
        this.stCommunitycode = stCommunitycode;
    }
    
    @Column(name="ST_GRIDCODE", length=12)

    public String getStGridcode() {
        return this.stGridcode;
    }
    
    public void setStGridcode(String stGridcode) {
        this.stGridcode = stGridcode;
    }
    
    @Column(name="ST_EBCLASS", length=100)

    public String getStEbclass() {
        return this.stEbclass;
    }
    
    public void setStEbclass(String stEbclass) {
        this.stEbclass = stEbclass;
    }
    
    @Column(name="ST_ESCLASS", length=100)

    public String getStEsclass() {
        return this.stEsclass;
    }
    
    public void setStEsclass(String stEsclass) {
        this.stEsclass = stEsclass;
    }
    
    @Column(name="ST_ADDRESS", length=200)

    public String getStAddress() {
        return this.stAddress;
    }
    
    public void setStAddress(String stAddress) {
        this.stAddress = stAddress;
    }
    
    @Column(name="NM_POSX", length=50)

    public String getNmPosx() {
        return this.nmPosx;
    }
    
    public void setNmPosx(String nmPosx) {
        this.nmPosx = nmPosx;
    }
    
    @Column(name="NM_POSY", length=50)

    public String getNmPosy() {
        return this.nmPosy;
    }
    
    public void setNmPosy(String nmPosy) {
        this.nmPosy = nmPosy;
    }
    
    @Column(name="ST_DESCRIPTION", length=1024)

    public String getStDescription() {
        return this.stDescription;
    }
    
    public void setStDescription(String stDescription) {
        this.stDescription = stDescription;
    }
    
    @Column(name="ST_IMAGEFILENO", length=1024)

    public String getStImagefileno() {
        return this.stImagefileno;
    }
    
    public void setStImagefileno(String stImagefileno) {
        this.stImagefileno = stImagefileno;
    }
    
    @Column(name="ST_WAVFILENO", length=1024)

    public String getStWavfileno() {
        return this.stWavfileno;
    }
    
    public void setStWavfileno(String stWavfileno) {
        this.stWavfileno = stWavfileno;
    }
    
    @Column(name="ST_EVENTSOURCE", length=20)

    public String getStEventsource() {
        return this.stEventsource;
    }
    
    public void setStEventsource(String stEventsource) {
        this.stEventsource = stEventsource;
    }
    
    @Column(name="ST_EVENTTYPE", length=20)

    public String getStEventtype() {
        return this.stEventtype;
    }
    
    public void setStEventtype(String stEventtype) {
        this.stEventtype = stEventtype;
    }
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="DT_DINSERTTIME", length=7)

    public Date getDtDinserttime() {
        return this.dtDinserttime;
    }
    
    public void setDtDinserttime(Date dtDinserttime) {
        this.dtDinserttime = dtDinserttime;
    }
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="DT_DUPDATETIME", length=7)

    public Date getDtDupdatetime() {
        return this.dtDupdatetime;
    }
    
    public void setDtDupdatetime(Date dtDupdatetime) {
        this.dtDupdatetime = dtDupdatetime;
    }
    
    @Column(name="ST_HOTLINESN", length=15)

    public String getStHotlinesn() {
        return this.stHotlinesn;
    }
    
    public void setStHotlinesn(String stHotlinesn) {
        this.stHotlinesn = stHotlinesn;
    }
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="DT_CREATETIME", length=7)

    public Date getDtCreatetime() {
        return this.dtCreatetime;
    }
    
    public void setDtCreatetime(Date dtCreatetime) {
        this.dtCreatetime = dtCreatetime;
    }
    
    @Column(name="ST_CREATEPERSON", length=15)

    public String getStCreateperson() {
        return this.stCreateperson;
    }
    
    public void setStCreateperson(String stCreateperson) {
        this.stCreateperson = stCreateperson;
    }
    
    @Column(name="ST_CREATENOTE", length=1024)

    public String getStCreatenote() {
        return this.stCreatenote;
    }
    
    public void setStCreatenote(String stCreatenote) {
        this.stCreatenote = stCreatenote;
    }
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="DT_RINSERTTIME", length=7)

    public Date getDtRinserttime() {
        return this.dtRinserttime;
    }
    
    public void setDtRinserttime(Date dtRinserttime) {
        this.dtRinserttime = dtRinserttime;
    }
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="DT_RUPDATETIME", length=7)

    public Date getDtRupdatetime() {
        return this.dtRupdatetime;
    }
    
    public void setDtRupdatetime(Date dtRupdatetime) {
        this.dtRupdatetime = dtRupdatetime;
    }
    
    @Column(name="ST_CASESN", length=30)

    public String getStCasesn() {
        return this.stCasesn;
    }
    
    public void setStCasesn(String stCasesn) {
        this.stCasesn = stCasesn;
    }
    
    @Column(name="NM_STATE", precision=4, scale=0)

    public Short getNmState() {
        return this.nmState;
    }
    
    public void setNmState(Short nmState) {
        this.nmState = nmState;
    }
    
    @Column(name="ST_ISCANCEL", length=4)

    public String getStIscancel() {
        return this.stIscancel;
    }
    
    public void setStIscancel(String stIscancel) {
        this.stIscancel = stIscancel;
    }
    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="DT_CANCELDATETIME", length=7)

    public Date getDtCanceldatetime() {
        return this.dtCanceldatetime;
    }
    
    public void setDtCanceldatetime(Date dtCanceldatetime) {
        this.dtCanceldatetime = dtCanceldatetime;
    }
    
    @Column(name="ST_CANCELNOTE", length=1000)

    public String getStCancelnote() {
        return this.stCancelnote;
    }
    
    public void setStCancelnote(String stCancelnote) {
        this.stCancelnote = stCancelnote;
    }
    
    @Column(name="ST_CANCELUSER", length=20)

    public String getStCanceluser() {
        return this.stCanceluser;
    }
    
    public void setStCanceluser(String stCanceluser) {
        this.stCanceluser = stCanceluser;
    }
    
    @Column(name="NM_DHTYPE", precision=8, scale=0)

    public Integer getNmDhtype() {
        return this.nmDhtype;
    }
    
    public void setNmDhtype(Integer nmDhtype) {
        this.nmDhtype = nmDhtype;
    }
    
    @Column(name="ST_EVSCLASS", length=100)

    public String getStEvsclass() {
        return this.stEvsclass;
    }
    
    public void setStEvsclass(String stEvsclass) {
        this.stEvsclass = stEvsclass;
    }
    
    @Column(name="ST_ZDEVENT", length=4)

    public String getStZdevent() {
        return this.stZdevent;
    }
    
    public void setStZdevent(String stZdevent) {
        this.stZdevent = stZdevent;
    }
    
    @Column(name="ST_CQEVEVT", length=4)

    public String getStCqevevt() {
        return this.stCqevevt;
    }
    
    public void setStCqevevt(String stCqevevt) {
        this.stCqevevt = stCqevevt;
    }
    
    @Column(name="ST_DBEVENT", length=4)

    public String getStDbevent() {
        return this.stDbevent;
    }
    
    public void setStDbevent(String stDbevent) {
        this.stDbevent = stDbevent;
    }
    
    @Column(name="ST_REPORT_DEPARTMENT_ID", length=20)
    public String getStReportDepartmentId() {
    	return stReportDepartmentId;
    }
    
    
    public void setStReportDepartmentId(String stReportDepartmentId) {
    	this.stReportDepartmentId = stReportDepartmentId;
    }
    
    @Column(name="ST_REPORT_DEPARTMENT", length=100)
    public String getStReportDepartment() {
    	return stReportDepartment;
    }
    
    
    public void setStReportDepartment(String stReportDepartment) {
    	this.stReportDepartment = stReportDepartment;
    }

    @Transient
	public List<SeawallPatrolAttachment> getAttachments() {
		return attachments;
	}


	public void setAttachments(List<SeawallPatrolAttachment> attachments) {
		this.attachments = attachments;
	}

   

}