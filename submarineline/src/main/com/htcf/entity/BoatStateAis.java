package com.htcf.entity;

/**
 * 船舶静态Ais信息
 * @author by hj on 2017-10-23.
 */
public class BoatStateAis {

    /**
     * 消息ID 5/18
     */
    private String msgid;

    /**
     * 转发指示符
     */
    private String repeatIndicator;

    /**
     * 用户ID
     */
    private String mmsi;

    /**
     * AIS版本指示符
     */
    private String aisVersionIndicator;

    /**
     * IMO编号
     */
    private String imo;

    /**
     * 呼号
     */
    private String callSign;

    /**
     * 名称
     */
    private String name;

    /**
     * 船舶和货物类型
     */
    private String type;

    /**
     * 船长
     */
    private String length;

    /**
     * 船宽
     */
    private String width;

    /**
     * 电子定位装置的类型
     */
    private String typeOfElePos;

    /**
     * 预计到港时间
     */
    private String eat;

    /**
     * 目前最大静态吃水
     */
    private String staticDraught;

    /**
     * 目的港
     */
    private String destination;

    /**
     * DTE
     */
    private String dte;

    /**
     * 报文时间
     */
    private String currTime;


    @Override
    public String toString() {
        return "BoatStateAis{" +
                "msgid='" + msgid + '\'' +
                ", repeatIndicator='" + repeatIndicator + '\'' +
                ", mmsi='" + mmsi + '\'' +
                ", aisVersionIndicator='" + aisVersionIndicator + '\'' +
                ", imo='" + imo + '\'' +
                ", callSign='" + callSign + '\'' +
                ", name='" + name + '\'' +
                ", type='" + type + '\'' +
                ", length='" + length + '\'' +
                ", width='" + width + '\'' +
                ", typeOfElePos='" + typeOfElePos + '\'' +
                ", eat='" + eat + '\'' +
                ", staticDraught='" + staticDraught + '\'' +
                ", destination='" + destination + '\'' +
                ", dte='" + dte + '\'' +
                ", currTime='" + currTime + '\'' +
                '}';
    }

    public String getMsgid() {
        return msgid;
    }

    public void setMsgid(String msgid) {
        this.msgid = msgid;
    }

    public String getRepeatIndicator() {
        return repeatIndicator;
    }

    public void setRepeatIndicator(String repeatIndicator) {
        this.repeatIndicator = repeatIndicator;
    }

    public String getMmsi() {
        return mmsi;
    }

    public void setMmsi(String mmsi) {
        this.mmsi = mmsi;
    }

    public String getAisVersionIndicator() {
        return aisVersionIndicator;
    }

    public void setAisVersionIndicator(String aisVersionIndicator) {
        this.aisVersionIndicator = aisVersionIndicator;
    }

    public String getImo() {
        return imo;
    }

    public void setImo(String imo) {
        this.imo = imo;
    }

    public String getCallSign() {
        return callSign;
    }

    public void setCallSign(String callSign) {
        this.callSign = callSign;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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

    public String getTypeOfElePos() {
        return typeOfElePos;
    }

    public void setTypeOfElePos(String typeOfElePos) {
        this.typeOfElePos = typeOfElePos;
    }

    public String getEat() {
        return eat;
    }

    public void setEat(String eat) {
        this.eat = eat;
    }

    public String getStaticDraught() {
        return staticDraught;
    }

    public void setStaticDraught(String staticDraught) {
        this.staticDraught = staticDraught;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getDte() {
        return dte;
    }

    public void setDte(String dte) {
        this.dte = dte;
    }

    public String getCurrTime() {
        return currTime;
    }

    public void setCurrTime(String currTime) {
        this.currTime = currTime;
    }
}
