package com.htcf.entity;

/**
 * 船舶静态数据信息
 * @author  hj on 2017-10-16.
 */
public class BoatStatic {
    /**
     消息类型
     */
    private String type;

    /**
    转发指示符
    */
    private String forward;

    /**
    船舶mmsi
    */
    private String mmsi;

    /**
   AIS版本指示符
   */
    private String ver;

    /**
   IMO编号
   */
    private String imo;

    /**
   呼号
   */
    private String callno;

    /**
   名称
   */
    private String shipname;

     /**
      船舶和货物类型
    */
     private String shipAndCargType;

    /**
    船长
     */
    private String length;

    /**
    船宽
     */
    private String width;

    /**
     电子定位装置的类型
     */
    private String devicetype;


    /**
     预计到港时间
     */
    private String eta;


    /**
     目的港
     */
    private String dest;


    /**
     目前最大静态吃水
     */
    private String draft;


    /**
     DTE
     */
    private String dte;


    /**
     报文时间
     */
    private String receivetime;







    /*-------------------------------------------------------------*/

    @Override
    public String toString() {
        return "BoatStatic{" +
                "type='" + type + '\'' +
                ", forward='" + forward + '\'' +
                ", mmsi='" + mmsi + '\'' +
                ", ver='" + ver + '\'' +
                ", imo='" + imo + '\'' +
                ", callno='" + callno + '\'' +
                ", shipname='" + shipname + '\'' +
                ", shipAndCargType='" + shipAndCargType + '\'' +
                ", length='" + length + '\'' +
                ", width='" + width + '\'' +
                ", devicetype='" + devicetype + '\'' +
                ", eta='" + eta + '\'' +
                ", dest='" + dest + '\'' +
                ", draft='" + draft + '\'' +
                ", dte='" + dte + '\'' +
                ", receivetime='" + receivetime + '\'' +
                '}';
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getForward() {
        return forward;
    }

    public void setForward(String forward) {
        this.forward = forward;
    }

    public String getMmsi() {
        return mmsi;
    }

    public void setMmsi(String mmsi) {
        this.mmsi = mmsi;
    }

    public String getVer() {
        return ver;
    }

    public void setVer(String ver) {
        this.ver = ver;
    }

    public String getImo() {
        return imo;
    }

    public void setImo(String imo) {
        this.imo = imo;
    }

    public String getCallno() {
        return callno;
    }

    public void setCallno(String callno) {
        this.callno = callno;
    }

    public String getShipname() {
        return shipname;
    }

    public void setShipname(String shipname) {
        this.shipname = shipname;
    }

    public String getShipAndCargType() {
        return shipAndCargType;
    }

    public void setShipAndCargType(String shipAndCargType) {
        this.shipAndCargType = shipAndCargType;
    }

    public String getLength() {
        return length;
    }

    public void setLength(String length) {
        this.length = length;
    }

    public String getWidth() {
        return width;
    }

    public void setWidth(String width) {
        this.width = width;
    }

    public String getDevicetype() {
        return devicetype;
    }

    public void setDevicetype(String devicetype) {
        this.devicetype = devicetype;
    }

    public String getEta() {
        return eta;
    }

    public void setEta(String eta) {
        this.eta = eta;
    }

    public String getDest() {
        return dest;
    }

    public void setDest(String dest) {
        this.dest = dest;
    }

    public String getDraft() {
        return draft;
    }

    public void setDraft(String draft) {
        this.draft = draft;
    }

    public String getDte() {
        return dte;
    }

    public void setDte(String dte) {
        this.dte = dte;
    }

    public String getReceivetime() {
        return receivetime;
    }

    public void setReceivetime(String receivetime) {
        this.receivetime = receivetime;
    }
}
