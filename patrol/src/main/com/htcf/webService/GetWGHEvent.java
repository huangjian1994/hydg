package com.htcf.webService;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

/**
 * <p>
 * Java class for anonymous complex type.
 * 
 * <p>
 * The following schema fragment specifies the expected content contained within
 * this class.
 * 
 * <pre>
 * &lt;complexType>
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;sequence>
 *         &lt;element name="strBT" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="strET" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="sj" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="qx" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="dl" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="xl" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *         &lt;element name="rwh" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "strBT", "strET", "sj", "qx", "dl", "xl",
		"rwh" })
@XmlRootElement(name = "GetWGHEvent")
public class GetWGHEvent {

	protected String strBT;
	protected String strET;
	protected String sj;
	protected String qx;
	protected String dl;
	protected String xl;
	protected String rwh;

	/**
	 * Gets the value of the strBT property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getStrBT() {
		return strBT;
	}

	/**
	 * Sets the value of the strBT property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setStrBT(String value) {
		this.strBT = value;
	}

	/**
	 * Gets the value of the strET property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getStrET() {
		return strET;
	}

	/**
	 * Sets the value of the strET property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setStrET(String value) {
		this.strET = value;
	}

	/**
	 * Gets the value of the sj property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getSj() {
		return sj;
	}

	/**
	 * Sets the value of the sj property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setSj(String value) {
		this.sj = value;
	}

	/**
	 * Gets the value of the qx property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getQx() {
		return qx;
	}

	/**
	 * Sets the value of the qx property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setQx(String value) {
		this.qx = value;
	}

	/**
	 * Gets the value of the dl property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getDl() {
		return dl;
	}

	/**
	 * Sets the value of the dl property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setDl(String value) {
		this.dl = value;
	}

	/**
	 * Gets the value of the xl property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getXl() {
		return xl;
	}

	/**
	 * Sets the value of the xl property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setXl(String value) {
		this.xl = value;
	}

	/**
	 * Gets the value of the rwh property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getRwh() {
		return rwh;
	}

	/**
	 * Sets the value of the rwh property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setRwh(String value) {
		this.rwh = value;
	}

}
