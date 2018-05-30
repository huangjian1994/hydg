package com.htcf.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * @author by hj on 2018-1-31.
 */
@Entity
@Table(name = "T_HYSYYW_HYGNQH_XXGL_KJXX"//, schema = "HYDGCF"
 )
public class XxglKjxxEntity {
    private long id;
    private String addtime;
    private String lastupdatetime;
    private String addusername;
    private String adduserid;
    private Long gnqhid;
    private String jd;
    private String wd;
    private String xh;
    private Long xsxx;

    @Id
    @Column(name = "ID", nullable = false, precision = 0)
    @GeneratedValue(generator = "generator")
    @GenericGenerator(name = "generator",strategy = "increment")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
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
    @Column(name = "GNQHID", nullable = true, precision = 0)
    public Long getGnqhid() {
        return gnqhid;
    }

    public void setGnqhid(Long gnqhid) {
        this.gnqhid = gnqhid;
    }



    @Basic
    @Column(name = "JD", nullable = true, length = 50)
    public String getJd() {
        return jd;
    }

    public void setJd(String jd) {
        this.jd = jd;
    }

    @Basic
    @Column(name = "WD", nullable = true, length = 50)
    public String getWd() {
        return wd;
    }

    public void setWd(String wd) {
        this.wd = wd;
    }

    @Basic
    @Column(name = "XH", nullable = true, length = 50)
    public String getXh() {
        return xh;
    }

    public void setXh(String xh) {
        this.xh = xh;
    }

    @Basic
    @Column(name = "XSXX", nullable = true, precision = 0)
    public Long getXsxx() {
        return xsxx;
    }

    public void setXsxx(Long xsxx) {
        this.xsxx = xsxx;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        XxglKjxxEntity that = (XxglKjxxEntity) o;

        if (id != that.id) {
            return false;
        }
        if (addtime != null ? !addtime.equals(that.addtime) : that.addtime != null) {
            return false;
        }
        if (lastupdatetime != null ? !lastupdatetime.equals(that.lastupdatetime) : that.lastupdatetime != null) {
            return false;
        }
        if (addusername != null ? !addusername.equals(that.addusername) : that.addusername != null) {
            return false;
        }
        if (adduserid != null ? !adduserid.equals(that.adduserid) : that.adduserid != null) {
            return false;
        }
        if (gnqhid != null ? !gnqhid.equals(that.gnqhid) : that.gnqhid != null) {
            return false;
        }

        if (jd != null ? !jd.equals(that.jd) : that.jd != null) {
            return false;
        }
        if (wd != null ? !wd.equals(that.wd) : that.wd != null) {
            return false;
        }
        if (xh != null ? !xh.equals(that.xh) : that.xh != null) {
            return false;
        }
        if (xsxx != null ? !xsxx.equals(that.xsxx) : that.xsxx != null) {
            return false;
        }

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (addtime != null ? addtime.hashCode() : 0);
        result = 31 * result + (lastupdatetime != null ? lastupdatetime.hashCode() : 0);
        result = 31 * result + (addusername != null ? addusername.hashCode() : 0);
        result = 31 * result + (adduserid != null ? adduserid.hashCode() : 0);
        result = 31 * result + (gnqhid != null ? gnqhid.hashCode() : 0);

        result = 31 * result + (jd != null ? jd.hashCode() : 0);
        result = 31 * result + (wd != null ? wd.hashCode() : 0);
        result = 31 * result + (xh != null ? xh.hashCode() : 0);
        result = 31 * result + (xsxx != null ? xsxx.hashCode() : 0);
        return result;
    }
}
