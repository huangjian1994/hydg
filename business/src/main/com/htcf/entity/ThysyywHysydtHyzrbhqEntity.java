package com.htcf.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * @author by hj on 2018-1-8.
 */
@Entity
@Table(name = "T_HYSYYW_HYSYDT_HYZRBHQ"//, schema = "HYDGCF"
 )
public class ThysyywHysydtHyzrbhqEntity {
    private long id;
    private String bhqbh;
    private String bhqmc;
    private String xzqh;
    private String zmj;
    private String zgbm;
    private String fl;
    private String jb;
    private String pjsj;
    private String cjr;
    private String cjsj;
    private String xgr;
    private String xgsj;
    private String geo;
    private String zdbhdx;
    private String xgssqk;


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
    @Column(name = "BHQBH", nullable = true, length = 50)
    public String getBhqbh() {
        return bhqbh;
    }

    public void setBhqbh(String bhqbh) {
        this.bhqbh = bhqbh;
    }

    @Basic
    @Column(name = "BHQMC", nullable = true, length = 50)
    public String getBhqmc() {
        return bhqmc;
    }

    public void setBhqmc(String bhqmc) {
        this.bhqmc = bhqmc;
    }

    @Basic
    @Column(name = "XZQH", nullable = true, length = 50)
    public String getXzqh() {
        return xzqh;
    }

    public void setXzqh(String xzqh) {
        this.xzqh = xzqh;
    }

    @Basic
    @Column(name = "ZMJ", nullable = true, length = 50)
    public String getZmj() {
        return zmj;
    }

    public void setZmj(String zmj) {
        this.zmj = zmj;
    }

    @Basic
    @Column(name = "ZGBM", nullable = true, length = 50)
    public String getZgbm() {
        return zgbm;
    }

    public void setZgbm(String zgbm) {
        this.zgbm = zgbm;
    }

    @Basic
    @Column(name = "FL", nullable = true, length = 50)
    public String getFl() {
        return fl;
    }

    public void setFl(String fl) {
        this.fl = fl;
    }

    @Basic
    @Column(name = "JB", nullable = true, length = 50)
    public String getJb() {
        return jb;
    }

    public void setJb(String jb) {
        this.jb = jb;
    }

    @Basic
    @Column(name = "PJSJ", nullable = true, length = 100)
    public String getPjsj() {
        return pjsj;
    }

    public void setPjsj(String pjsj) {
        this.pjsj = pjsj;
    }

    @Basic
    @Column(name = "CJR", nullable = true, length = 50)
    public String getCjr() {
        return cjr;
    }

    public void setCjr(String cjr) {
        this.cjr = cjr;
    }

    @Basic
    @Column(name = "CJSJ", nullable = true, length = 100)
    public String getCjsj() {
        return cjsj;
    }

    public void setCjsj(String cjsj) {
        this.cjsj = cjsj;
    }

    @Basic
    @Column(name = "XGR", nullable = true, length = 50)
    public String getXgr() {
        return xgr;
    }

    public void setXgr(String xgr) {
        this.xgr = xgr;
    }

    @Basic
    @Column(name = "XGSJ", nullable = true, length = 50)
    public String getXgsj() {
        return xgsj;
    }

    public void setXgsj(String xgsj) {
        this.xgsj = xgsj;
    }

    @Basic
    @Column(name = "GEO", nullable = true)
    public String getGeo() {
        return geo;
    }

    public void setGeo(String geo) {
        this.geo = geo;
    }

    @Basic
    @Column(name = "ZDBHDX", nullable = true, length = 1000)
    public String getZdbhdx() {
        return zdbhdx;
    }

    public void setZdbhdx(String zdbhdx) {
        this.zdbhdx = zdbhdx;
    }

    @Basic
    @Column(name = "XGSSQK", nullable = true, length = 1000)
    public String getXgssqk() {
        return xgssqk;
    }

    public void setXgssqk(String xgssqk) {
        this.xgssqk = xgssqk;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        ThysyywHysydtHyzrbhqEntity that = (ThysyywHysydtHyzrbhqEntity) o;

        if (id != that.id) {
            return false;
        }
        if (bhqbh != null ? !bhqbh.equals(that.bhqbh) : that.bhqbh != null) {
            return false;
        }
        if (bhqmc != null ? !bhqmc.equals(that.bhqmc) : that.bhqmc != null) {
            return false;
        }
        if (xzqh != null ? !xzqh.equals(that.xzqh) : that.xzqh != null) {
            return false;
        }
        if (zmj != null ? !zmj.equals(that.zmj) : that.zmj != null) {
            return false;
        }
        if (zgbm != null ? !zgbm.equals(that.zgbm) : that.zgbm != null) {
            return false;
        }
        if (fl != null ? !fl.equals(that.fl) : that.fl != null) {
            return false;
        }
        if (jb != null ? !jb.equals(that.jb) : that.jb != null) {
            return false;
        }
        if (pjsj != null ? !pjsj.equals(that.pjsj) : that.pjsj != null) {
            return false;
        }
        if (cjr != null ? !cjr.equals(that.cjr) : that.cjr != null) {
            return false;
        }
        if (cjsj != null ? !cjsj.equals(that.cjsj) : that.cjsj != null) {
            return false;
        }
        if (xgr != null ? !xgr.equals(that.xgr) : that.xgr != null) {
            return false;
        }
        if (xgsj != null ? !xgsj.equals(that.xgsj) : that.xgsj != null) {
            return false;
        }
        if (geo != null ? !geo.equals(that.geo) : that.geo != null) {
            return false;
        }
        if (zdbhdx != null ? !zdbhdx.equals(that.zdbhdx) : that.zdbhdx != null) {
            return false;
        }
        if (xgssqk != null ? !xgssqk.equals(that.xgssqk) : that.xgssqk != null) {
            return false;
        }

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (bhqbh != null ? bhqbh.hashCode() : 0);
        result = 31 * result + (bhqmc != null ? bhqmc.hashCode() : 0);
        result = 31 * result + (xzqh != null ? xzqh.hashCode() : 0);
        result = 31 * result + (zmj != null ? zmj.hashCode() : 0);
        result = 31 * result + (zgbm != null ? zgbm.hashCode() : 0);
        result = 31 * result + (fl != null ? fl.hashCode() : 0);
        result = 31 * result + (jb != null ? jb.hashCode() : 0);
        result = 31 * result + (pjsj != null ? pjsj.hashCode() : 0);
        result = 31 * result + (cjr != null ? cjr.hashCode() : 0);
        result = 31 * result + (cjsj != null ? cjsj.hashCode() : 0);
        result = 31 * result + (xgr != null ? xgr.hashCode() : 0);
        result = 31 * result + (xgsj != null ? xgsj.hashCode() : 0);
        result = 31 * result + (geo != null ? geo.hashCode() : 0);
        result = 31 * result + (zdbhdx != null ? zdbhdx.hashCode() : 0);
        result = 31 * result + (xgssqk != null ? xgssqk.hashCode() : 0);
        return result;
    }
}
