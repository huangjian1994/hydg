package com.htcf.webService;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
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
 *         &lt;element name="GetZSYFResult" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = { "getZSYFResult" })
@XmlRootElement(name = "GetZSYFResponse")
public class GetZSYFResponse {

	@XmlElement(name = "GetZSYFResult")
	protected String getZSYFResult;

	/**
	 * Gets the value of the getZSYFResult property.
	 * 
	 * @return possible object is {@link String }
	 * 
	 */
	public String getGetZSYFResult() {
		return getZSYFResult;
	}

	/**
	 * Sets the value of the getZSYFResult property.
	 * 
	 * @param value
	 *            allowed object is {@link String }
	 * 
	 */
	public void setGetZSYFResult(String value) {
		this.getZSYFResult = value;
	}

}
