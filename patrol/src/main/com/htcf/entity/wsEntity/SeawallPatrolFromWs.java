package com.htcf.entity.wsEntity;

/**
 * 海塘巡查上报信息（用于封装webservice接口接收数据）
 * @author lwb
 *
 */

public class SeawallPatrolFromWs  implements java.io.Serializable {
	
	/**
	 * 状态：1、发现；2、立案；3、派发；4、处理；5、结案
	 */
	private String nm_state;
	/**
	 * 事件类型：1、堤防；2、海塘
	 */
	private String nm_dhtype;
	/**
	 * 任务号
	 */
	private String st_eventsn;
	/**
	 * 发现时间
	 */
	private String dt_discovertime;
	/**
	 * 立案时间
	 */
	private String dt_createtime;
	/**
	 * 立案备注
	 */
	private String st_createnote;
	/**
	 * 反映来源
	 */
	private String st_claimsource;
	/**
	 * 反映人
	 */
	private String st_claimperson;
	/**
	 * 联系电话
	 */
	private String st_phoneno;
	/**
	 * 范围
	 */
	private String st_name;
	/**
	 * 问题类别(大类)
	 */
	private String st_ebclass;
	/**
	 * 问题内容(小类)
	 */
	private String st_esclass;
	/**
	 * 发生地址
	 */
	private String st_address;
	/**
	 * 问题描述
	 */
	private String st_description;
	/**
	 * 问题来源:监督员上报；12319信息
	 */
	private String st_eventsource;
	/**
	 * 事件类别:事件、部件
	 */
	private String st_eventtype;
	private String dt_dispatchtime;
	private String dt_solvingtime;
	private String dt_checktime;
	/**
	 * 坐标
	 */
	private String nm_posx;
	private String nm_posy;
	
	public SeawallPatrolFromWs() {
		super();
	}

	public SeawallPatrolFromWs(String nmState, String nmDhtype,
			String stEventsn, String dtDiscovertime, String dtCreatetime,
			String stCreatenote, String stClaimsource, String stClaimperson,
			String stPhoneno, String stName, String stEbclass,
			String stEsclass, String stAddress, String stDescription,
			String stEventsource, String stEventtype, String dtDispatchtime,
			String dtSolvingtime, String dtChecktime, String nmPosx,
			String nmPosy) {
		super();
		nm_state = nmState;
		nm_dhtype = nmDhtype;
		st_eventsn = stEventsn;
		dt_discovertime = dtDiscovertime;
		dt_createtime = dtCreatetime;
		st_createnote = stCreatenote;
		st_claimsource = stClaimsource;
		st_claimperson = stClaimperson;
		st_phoneno = stPhoneno;
		st_name = stName;
		st_ebclass = stEbclass;
		st_esclass = stEsclass;
		st_address = stAddress;
		st_description = stDescription;
		st_eventsource = stEventsource;
		st_eventtype = stEventtype;
		dt_dispatchtime = dtDispatchtime;
		dt_solvingtime = dtSolvingtime;
		dt_checktime = dtChecktime;
		nm_posx = nmPosx;
		nm_posy = nmPosy;
	}


	public String getNm_state() {
		return nm_state;
	}

	public void setNm_state(String nmState) {
		nm_state = nmState;
	}

	public String getNm_dhtype() {
		return nm_dhtype;
	}

	public void setNm_dhtype(String nmDhtype) {
		nm_dhtype = nmDhtype;
	}

	public String getSt_eventsn() {
		return st_eventsn;
	}

	public void setSt_eventsn(String stEventsn) {
		st_eventsn = stEventsn;
	}

	public String getDt_discovertime() {
		return dt_discovertime;
	}

	public void setDt_discovertime(String dtDiscovertime) {
		dt_discovertime = dtDiscovertime;
	}

	public String getDt_createtime() {
		return dt_createtime;
	}

	public void setDt_createtime(String dtCreatetime) {
		dt_createtime = dtCreatetime;
	}

	public String getSt_createnote() {
		return st_createnote;
	}

	public void setSt_createnote(String stCreatenote) {
		st_createnote = stCreatenote;
	}

	public String getSt_claimsource() {
		return st_claimsource;
	}

	public void setSt_claimsource(String stClaimsource) {
		st_claimsource = stClaimsource;
	}

	public String getSt_claimperson() {
		return st_claimperson;
	}

	public void setSt_claimperson(String stClaimperson) {
		st_claimperson = stClaimperson;
	}

	public String getSt_phoneno() {
		return st_phoneno;
	}

	public void setSt_phoneno(String stPhoneno) {
		st_phoneno = stPhoneno;
	}

	public String getSt_name() {
		return st_name;
	}

	public void setSt_name(String stName) {
		st_name = stName;
	}

	public String getSt_ebclass() {
		return st_ebclass;
	}

	public void setSt_ebclass(String stEbclass) {
		st_ebclass = stEbclass;
	}

	public String getSt_esclass() {
		return st_esclass;
	}

	public void setSt_esclass(String stEsclass) {
		st_esclass = stEsclass;
	}

	public String getSt_address() {
		return st_address;
	}

	public void setSt_address(String stAddress) {
		st_address = stAddress;
	}

	public String getSt_description() {
		return st_description;
	}

	public void setSt_description(String stDescription) {
		st_description = stDescription.replace(",换行,", "\n");
	}

	public String getSt_eventsource() {
		return st_eventsource;
	}

	public void setSt_eventsource(String stEventsource) {
		st_eventsource = stEventsource;
	}

	public String getSt_eventtype() {
		return st_eventtype;
	}

	public void setSt_eventtype(String stEventtype) {
		st_eventtype = stEventtype;
	}

	public String getDt_dispatchtime() {
		return dt_dispatchtime;
	}

	public void setDt_dispatchtime(String dtDispatchtime) {
		dt_dispatchtime = dtDispatchtime;
	}

	public String getDt_solvingtime() {
		return dt_solvingtime;
	}

	public void setDt_solvingtime(String dtSolvingtime) {
		dt_solvingtime = dtSolvingtime;
	}

	public String getDt_checktime() {
		return dt_checktime;
	}

	public void setDt_checktime(String dtChecktime) {
		dt_checktime = dtChecktime;
	}


	public String getNm_posx() {
		return nm_posx;
	}


	public void setNm_posx(String nmPosx) {
		nm_posx = nmPosx;
	}


	public String getNm_posy() {
		return nm_posy;
	}


	public void setNm_posy(String nmPosy) {
		nm_posy = nmPosy;
	}
	
}