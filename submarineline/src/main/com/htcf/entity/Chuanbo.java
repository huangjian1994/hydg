package com.htcf.entity;

/**
 * Created by hj on 2017-10-10.
 */
public class Chuanbo {

    private String type;//消息类型
    private String forward;//转发指示符
    private String mmsi;//船舶MMSI
    private String sog;//航速，单位1/10节
    private String posacur;//位置精准度
    private String longitude;//经度
    private String latitude;//纬度
    private String cog;//对地航向，1/10度为单位
    private String thead;//真艏向
    private String utctime;//AIS时间戳
    private String raim;//Raim标志
    private String receivetime;//接收时间戳
    private String devicemark;//B类装置标志
    private String dispmark;//B类显示器标志
    private String dscmark;//B类DSC标志
    private String bandmark;//B类宽带标志
    private String msg22mark;//B类消息22标志
    private String patternmark;//B类指配模式标志


    /**private String navistat;//导航状态
    private String rot;//转向率
    private String Indicator;//特定操作指示符
    private String Gnss;//当前GNSS位置状态*/


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

    public String getSog() {
        return sog;
    }

    public void setSog(String sog) {
        this.sog = sog;
    }

    public String getPosacur() {
        return posacur;
    }

    public void setPosacur(String posacur) {
        this.posacur = posacur;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getCog() {
        return cog;
    }

    public void setCog(String cog) {
        this.cog = cog;
    }

    public String getThead() {
        return thead;
    }

    public void setThead(String thead) {
        this.thead = thead;
    }

    public String getUtctime() {
        return utctime;
    }

    public void setUtctime(String utctime) {
        this.utctime = utctime;
    }

    public String getRaim() {
        return raim;
    }

    public void setRaim(String raim) {
        this.raim = raim;
    }

    public String getReceivetime() {
        return receivetime;
    }

    public void setReceivetime(String receivetime) {
        this.receivetime = receivetime;
    }

    public String getDevicemark() {
        return devicemark;
    }

    public void setDevicemark(String devicemark) {
        this.devicemark = devicemark;
    }

    public String getDispmark() {
        return dispmark;
    }

    public void setDispmark(String dispmark) {
        this.dispmark = dispmark;
    }

    public String getDscmark() {
        return dscmark;
    }

    public void setDscmark(String dscmark) {
        this.dscmark = dscmark;
    }

    public String getBandmark() {
        return bandmark;
    }

    public void setBandmark(String bandmark) {
        this.bandmark = bandmark;
    }

    public String getMsg22mark() {
        return msg22mark;
    }

    public void setMsg22mark(String msg22mark) {
        this.msg22mark = msg22mark;
    }

    public String getPatternmark() {
        return patternmark;
    }

    public void setPatternmark(String patternmark) {
        this.patternmark = patternmark;
    }

    @Override
    public String toString() {
        return "Chuanbo{" +
                "type='" + type + '\'' +
                ", forward='" + forward + '\'' +
                ", mmsi='" + mmsi + '\'' +
                ", sog='" + sog + '\'' +
                ", posacur='" + posacur + '\'' +
                ", longitude='" + longitude + '\'' +
                ", latitude='" + latitude + '\'' +
                ", cog='" + cog + '\'' +
                ", thead='" + thead + '\'' +
                ", utctime='" + utctime + '\'' +
                ", raim='" + raim + '\'' +
                ", receivetime='" + receivetime + '\'' +
                ", devicemark='" + devicemark + '\'' +
                ", dispmark='" + dispmark + '\'' +
                ", dscmark='" + dscmark + '\'' +
                ", bandmark='" + bandmark + '\'' +
                ", msg22mark='" + msg22mark + '\'' +
                ", patternmark='" + patternmark + '\'' +
                '}';
    }
}
