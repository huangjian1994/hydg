package com.htcf.entity.wsEntity;
/**
 * 案件
 * @author lwb
 *
 */
public class Case {
	
	/**
	 * 类型：0全部  1堤防   2海塘
	 */
	private String type;
	/**
	 * 区县
	 */
	private String dist;
	/**
	 * 发现（次数）
	 */
	private String fx;
	/**
	 * 立案-本期
	 */
	private String laNow;
	/**
	 * 立案-上期
	 */
	private String laPast;
	/**
	 * 派遣-本期
	 */
	private String pqNow;
	/**
	 * 派遣-上期
	 */
	private String pqPast;
	/**
	 * 	处理-本期
	 */
	private String clNow;
	/**
	 * 处理-上期
	 */
	private String clPast;
	/**
	 * 结案-本期
	 */
	private String jaNow;
	/**
	 * 结案-上期
	 */
	private String jaPast;
	/**
	 * 结案率
	 */
	private String jal;
	
	public Case() {
		super();
	}
	
	public Case(String type, String dist, String fx, String laNow,
			String laPast, String pqNow, String pqPast, String clNow,
			String clPast, String jaNow, String jaPast, String jal) {
		super();
		this.type = type;
		this.dist = dist;
		this.fx = fx;
		this.laNow = laNow;
		this.laPast = laPast;
		this.pqNow = pqNow;
		this.pqPast = pqPast;
		this.clNow = clNow;
		this.clPast = clPast;
		this.jaNow = jaNow;
		this.jaPast = jaPast;
		this.jal = jal;
	}

	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getDist() {
		return dist;
	}
	public void setDist(String dist) {
		this.dist = dist;
	}
	public String getFx() {
		return fx;
	}
	public void setFx(String fx) {
		this.fx = fx;
	}
	public String getLaNow() {
		return laNow;
	}
	public void setLaNow(String laNow) {
		this.laNow = laNow;
	}
	public String getLaPast() {
		return laPast;
	}
	public void setLaPast(String laPast) {
		this.laPast = laPast;
	}
	public String getPqNow() {
		return pqNow;
	}
	public void setPqNow(String pqNow) {
		this.pqNow = pqNow;
	}
	public String getPqPast() {
		return pqPast;
	}
	public void setPqPast(String pqPast) {
		this.pqPast = pqPast;
	}
	public String getClNow() {
		return clNow;
	}
	public void setClNow(String clNow) {
		this.clNow = clNow;
	}
	public String getClPast() {
		return clPast;
	}
	public void setClPast(String clPast) {
		this.clPast = clPast;
	}
	public String getJaNow() {
		return jaNow;
	}
	public void setJaNow(String jaNow) {
		this.jaNow = jaNow;
	}
	public String getJaPast() {
		return jaPast;
	}
	public void setJaPast(String jaPast) {
		this.jaPast = jaPast;
	}
	public String getJal() {
		return jal;
	}
	public void setJal(String jal) {
		this.jal = jal;
	}
	
	
	
}
