package com.htcf.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * @author by hj on 2017-12-14.
 */
@Entity
@Table(name = "T_HDGX_AQGL_WGJB")
public class THdgxAqglWgjb {
    private long id;
    private String wgcm;
    private String cblx;
    private String wgnr;
    private String wgdd;
    private String wgrq;
    private String jbr;
    private String hxclqk;
    private String bz;
    private String addtime;
    private String lastupdatetime;
    private String addusername;
    private String adduserid;
    private String updateusername;
    private String updateuserid;
    private String mmsi;
    private String fzr;

    @GenericGenerator(name="generator", strategy="increment")
    @Id @GeneratedValue(generator="generator")
    @Column(name="ID", unique=true, nullable=false, precision=18, scale=0)
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "WGCM", nullable = true, length = 50)
    public String getWgcm() {
        return wgcm;
    }

    public void setWgcm(String wgcm) {
        this.wgcm = wgcm;
    }

    @Basic
    @Column(name = "CBLX", nullable = true, length = 50)
    public String getCblx() {
        return cblx;
    }

    public void setCblx(String cblx) {
        this.cblx = cblx;
    }

    @Basic
    @Column(name = "WGNR", nullable = true, length = 50)
    public String getWgnr() {
        return wgnr;
    }

    public void setWgnr(String wgnr) {
        this.wgnr = wgnr;
    }

    @Basic
    @Column(name = "WGDD", nullable = true, length = 1000)
    public String getWgdd() {
        return wgdd;
    }

    public void setWgdd(String wgdd) {
        this.wgdd = wgdd;
    }

    @Basic
    @Column(name = "WGRQ", nullable = true, length = 50)
    public String getWgrq() {
        return wgrq;
    }

    public void setWgrq(String wgrq) {
        this.wgrq = wgrq;
    }

    @Basic
    @Column(name = "JBR", nullable = true, length = 50)
    public String getJbr() {
        return jbr;
    }

    public void setJbr(String jbr) {
        this.jbr = jbr;
    }

    @Basic
    @Column(name = "HXCLQK", nullable = true, length = 1000)
    public String getHxclqk() {
        return hxclqk;
    }

    public void setHxclqk(String hxclqk) {
        this.hxclqk = hxclqk;
    }

    @Basic
    @Column(name = "BZ", nullable = true, length = 1000)
    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
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
    @Column(name = "LASTUPDATETIME", nullable = true, length = 50)
    public String getLastupdatetime() {
        return lastupdatetime;
    }

    public void setLastupdatetime(String lastupdatetime) {
        this.lastupdatetime = lastupdatetime;
    }

    @Basic
    @Column(name = "ADDUSERNAME", nullable = true, length = 50)
    public String getAddusername() {
        return addusername;
    }

    public void setAddusername(String addusername) {
        this.addusername = addusername;
    }

    @Basic
    @Column(name = "ADDUSERID", nullable = true, length = 50)
    public String getAdduserid() {
        return adduserid;
    }

    public void setAdduserid(String adduserid) {
        this.adduserid = adduserid;
    }

    @Basic
    @Column(name = "UPDATEUSERNAME", nullable = true, length = 50)
    public String getUpdateusername() {
        return updateusername;
    }

    public void setUpdateusername(String updateusername) {
        this.updateusername = updateusername;
    }

    @Basic
    @Column(name = "UPDATEUSERID", nullable = true, length = 50)
    public String getUpdateuserid() {
        return updateuserid;
    }

    public void setUpdateuserid(String updateuserid) {
        this.updateuserid = updateuserid;
    }
    @Basic
    @Column(name = "mmsi", nullable = true, length = 50)
    public String getMmsi() {
		return mmsi;
	}

	public void setMmsi(String mmsi) {
		this.mmsi = mmsi;
	}
	@Basic
	@Column(name = "fzr", nullable = true, length = 50)
	public String getFzr() {
		return fzr;
	}

	public void setFzr(String fzr) {
		this.fzr = fzr;
	}

	@Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        THdgxAqglWgjb that = (THdgxAqglWgjb) o;

        if (id != that.id) return false;
        if (wgcm != null ? !wgcm.equals(that.wgcm) : that.wgcm != null) return false;
        if (cblx != null ? !cblx.equals(that.cblx) : that.cblx != null) return false;
        if (wgnr != null ? !wgnr.equals(that.wgnr) : that.wgnr != null) return false;
        if (wgdd != null ? !wgdd.equals(that.wgdd) : that.wgdd != null) return false;
        if (wgrq != null ? !wgrq.equals(that.wgrq) : that.wgrq != null) return false;
        if (jbr != null ? !jbr.equals(that.jbr) : that.jbr != null) return false;
        if (hxclqk != null ? !hxclqk.equals(that.hxclqk) : that.hxclqk != null) return false;
        if (bz != null ? !bz.equals(that.bz) : that.bz != null) return false;
        if (addtime != null ? !addtime.equals(that.addtime) : that.addtime != null) return false;
        if (lastupdatetime != null ? !lastupdatetime.equals(that.lastupdatetime) : that.lastupdatetime != null)
            return false;
        if (addusername != null ? !addusername.equals(that.addusername) : that.addusername != null) return false;
        if (adduserid != null ? !adduserid.equals(that.adduserid) : that.adduserid != null) return false;
        if (updateusername != null ? !updateusername.equals(that.updateusername) : that.updateusername != null)
            return false;
        if (updateuserid != null ? !updateuserid.equals(that.updateuserid) : that.updateuserid != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (wgcm != null ? wgcm.hashCode() : 0);
        result = 31 * result + (cblx != null ? cblx.hashCode() : 0);
        result = 31 * result + (wgnr != null ? wgnr.hashCode() : 0);
        result = 31 * result + (wgdd != null ? wgdd.hashCode() : 0);
        result = 31 * result + (wgrq != null ? wgrq.hashCode() : 0);
        result = 31 * result + (jbr != null ? jbr.hashCode() : 0);
        result = 31 * result + (hxclqk != null ? hxclqk.hashCode() : 0);
        result = 31 * result + (bz != null ? bz.hashCode() : 0);
        result = 31 * result + (addtime != null ? addtime.hashCode() : 0);
        result = 31 * result + (lastupdatetime != null ? lastupdatetime.hashCode() : 0);
        result = 31 * result + (addusername != null ? addusername.hashCode() : 0);
        result = 31 * result + (adduserid != null ? adduserid.hashCode() : 0);
        result = 31 * result + (updateusername != null ? updateusername.hashCode() : 0);
        result = 31 * result + (updateuserid != null ? updateuserid.hashCode() : 0);
        return result;
    }
}
