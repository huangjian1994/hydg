package com.htcf.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * @author by hj on 2018-1-16.
 */
@Entity
@Table(name = "T_HDGX_AQGL_WGCB"//, schema = "HYDGCF"
)
public class ThysyywWgcbEntity {
    private long id;
    private String mmsi;
    private String sog;
    private String longitude;
    private String latitude;
    private String cog;
    private String thead;
    private String cablename;
    private String warningrank;
    private String addtime;
    private String bjly;
    private Long ldid;

    @GenericGenerator(name="generator", strategy="increment")
    @Id @GeneratedValue(generator="generator")
    @Column(name = "ID", nullable = false, precision = 0)
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "MMSI", nullable = true, length = 50)
    public String getMmsi() {
        return mmsi;
    }

    public void setMmsi(String mmsi) {
        this.mmsi = mmsi;
    }

    @Basic
    @Column(name = "SOG", nullable = true, length = 50)
    public String getSog() {
        return sog;
    }

    public void setSog(String sog) {
        this.sog = sog;
    }

    @Basic
    @Column(name = "LONGITUDE", nullable = true, length = 50)
    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    @Basic
    @Column(name = "LATITUDE", nullable = true, length = 50)
    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    @Basic
    @Column(name = "COG", nullable = true, length = 50)
    public String getCog() {
        return cog;
    }

    public void setCog(String cog) {
        this.cog = cog;
    }

    @Basic
    @Column(name = "THEAD", nullable = true, length = 50)
    public String getThead() {
        return thead;
    }

    public void setThead(String thead) {
        this.thead = thead;
    }

    @Basic
    @Column(name = "CABLENAME", nullable = true, length = 50)
    public String getCablename() {
        return cablename;
    }

    public void setCablename(String cablename) {
        this.cablename = cablename;
    }

    @Basic
    @Column(name = "WARNINGRANK", nullable = true, length = 50)
    public String getWarningrank() {
        return warningrank;
    }

    public void setWarningrank(String warningrank) {
        this.warningrank = warningrank;
    }

    @Basic
    @Column(name = "ADDTIME", nullable = true, length = 50)
    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }

    @Basic
    @Column(name = "BJLY", nullable = true, length = 100)
    public String getBjly() {
        return bjly;
    }

    public void setBjly(String bjly) {
        this.bjly = bjly;
    }

    @Basic
    @Column(name = "LDID", nullable = true, precision = 0)
    public Long getLdid() {
        return ldid;
    }

    public void setLdid(Long ldid) {
        this.ldid = ldid;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ThysyywWgcbEntity that = (ThysyywWgcbEntity) o;

        if (id != that.id) return false;
        if (mmsi != null ? !mmsi.equals(that.mmsi) : that.mmsi != null) return false;
        if (sog != null ? !sog.equals(that.sog) : that.sog != null) return false;
        if (longitude != null ? !longitude.equals(that.longitude) : that.longitude != null) return false;
        if (latitude != null ? !latitude.equals(that.latitude) : that.latitude != null) return false;
        if (cog != null ? !cog.equals(that.cog) : that.cog != null) return false;
        if (thead != null ? !thead.equals(that.thead) : that.thead != null) return false;
        if (cablename != null ? !cablename.equals(that.cablename) : that.cablename != null) return false;
        if (warningrank != null ? !warningrank.equals(that.warningrank) : that.warningrank != null) return false;
        if (addtime != null ? !addtime.equals(that.addtime) : that.addtime != null) return false;
        if (bjly != null ? !bjly.equals(that.bjly) : that.bjly != null) return false;
        if (ldid != null ? !ldid.equals(that.ldid) : that.ldid != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (mmsi != null ? mmsi.hashCode() : 0);
        result = 31 * result + (sog != null ? sog.hashCode() : 0);
        result = 31 * result + (longitude != null ? longitude.hashCode() : 0);
        result = 31 * result + (latitude != null ? latitude.hashCode() : 0);
        result = 31 * result + (cog != null ? cog.hashCode() : 0);
        result = 31 * result + (thead != null ? thead.hashCode() : 0);
        result = 31 * result + (cablename != null ? cablename.hashCode() : 0);
        result = 31 * result + (warningrank != null ? warningrank.hashCode() : 0);
        result = 31 * result + (addtime != null ? addtime.hashCode() : 0);
        result = 31 * result + (bjly != null ? bjly.hashCode() : 0);
        result = 31 * result + (ldid != null ? ldid.hashCode() : 0);
        return result;
    }
}
