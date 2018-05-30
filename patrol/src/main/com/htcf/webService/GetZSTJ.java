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
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "strBT", "strET" })
@XmlRootElement(name = "GetZSTJ")
public class GetZSTJ {

	protected String strBT;
	protected String strET;

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

}
