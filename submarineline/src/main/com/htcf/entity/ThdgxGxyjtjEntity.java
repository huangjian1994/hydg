package com.htcf.entity;

import javax.persistence.*;

/**
 * @author by hj on 2018-1-8.
 */
@Entity
@Table(name = "T_HDGX_AQGL_GXYJTJ"//, schema = "HYDGCF"
)
public class ThdgxGxyjtjEntity {
    private long id;
    private Long piplineid;
    private String piplinename;
    private String distance;
    private String unit;
    private String soglevel1;
    private String updateuser;
    private String updatetime;
    private String updateuserid;
    private String soglevel2;
    private String soglevel3;
    private String soglevel;

    @Id
    @Column(name = "ID", nullable = false, precision = 0)
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "PIPLINEID", nullable = true, precision = 0)
    public Long getPiplineid() {
        return piplineid;
    }

    public void setPiplineid(Long piplineid) {
        this.piplineid = piplineid;
    }

    @Basic
    @Column(name = "PIPLINENAME", nullable = true, length = 100)
    public String getPiplinename() {
        return piplinename;
    }

    public void setPiplinename(String piplinename) {
        this.piplinename = piplinename;
    }

    @Basic
    @Column(name = "DISTANCE", nullable = true, length = 50)
    public String getDistance() {
        return distance;
    }

    public void setDistance(String distance) {
        this.distance = distance;
    }

    @Basic
    @Column(name = "UNIT", nullable = true, length = 50)
    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    @Basic
    @Column(name = "SOGLEVEL1", nullable = true, length = 50)
    public String getSoglevel1() {
        return soglevel1;
    }

    public void setSoglevel1(String soglevel1) {
        this.soglevel1 = soglevel1;
    }

    @Basic
    @Column(name = "UPDATEUSER", nullable = true, length = 50)
    public String getUpdateuser() {
        return updateuser;
    }

    public void setUpdateuser(String updateuser) {
        this.updateuser = updateuser;
    }

    @Basic
    @Column(name = "UPDATETIME", nullable = true, length = 50)
    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime;
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
    @Column(name = "SOGLEVEL2", nullable = true, length = 50)
    public String getSoglevel2() {
        return soglevel2;
    }

    public void setSoglevel2(String soglevel2) {
        this.soglevel2 = soglevel2;
    }

    @Basic
    @Column(name = "SOGLEVEL3", nullable = true, length = 50)
    public String getSoglevel3() {
        return soglevel3;
    }

    public void setSoglevel3(String soglevel3) {
        this.soglevel3 = soglevel3;
    }

    @Basic
    @Column(name = "SOGLEVEL", nullable = true, length = 50)
    public String getSoglevel() {
        return soglevel;
    }

    public void setSoglevel(String soglevel) {
        this.soglevel = soglevel;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        ThdgxGxyjtjEntity that = (ThdgxGxyjtjEntity) o;

        if (id != that.id) {
            return false;
        }
        if (piplineid != null ? !piplineid.equals(that.piplineid) : that.piplineid != null) {
            return false;
        }
        if (piplinename != null ? !piplinename.equals(that.piplinename) : that.piplinename != null) {
            return false;
        }
        if (distance != null ? !distance.equals(that.distance) : that.distance != null) {
            return false;
        }
        if (unit != null ? !unit.equals(that.unit) : that.unit != null) {
            return false;
        }
        if (soglevel1 != null ? !soglevel1.equals(that.soglevel1) : that.soglevel1 != null) {
            return false;
        }
        if (updateuser != null ? !updateuser.equals(that.updateuser) : that.updateuser != null) {
            return false;
        }
        if (updatetime != null ? !updatetime.equals(that.updatetime) : that.updatetime != null) {
            return false;
        }
        if (updateuserid != null ? !updateuserid.equals(that.updateuserid) : that.updateuserid != null) {
            return false;
        }
        if (soglevel2 != null ? !soglevel2.equals(that.soglevel2) : that.soglevel2 != null) {
            return false;
        }
        if (soglevel3 != null ? !soglevel3.equals(that.soglevel3) : that.soglevel3 != null) {
            return false;
        }
        if (soglevel != null ? !soglevel.equals(that.soglevel) : that.soglevel != null) {
            return false;
        }

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (piplineid != null ? piplineid.hashCode() : 0);
        result = 31 * result + (piplinename != null ? piplinename.hashCode() : 0);
        result = 31 * result + (distance != null ? distance.hashCode() : 0);
        result = 31 * result + (unit != null ? unit.hashCode() : 0);
        result = 31 * result + (soglevel1 != null ? soglevel1.hashCode() : 0);
        result = 31 * result + (updateuser != null ? updateuser.hashCode() : 0);
        result = 31 * result + (updatetime != null ? updatetime.hashCode() : 0);
        result = 31 * result + (updateuserid != null ? updateuserid.hashCode() : 0);
        result = 31 * result + (soglevel2 != null ? soglevel2.hashCode() : 0);
        result = 31 * result + (soglevel3 != null ? soglevel3.hashCode() : 0);
        result = 31 * result + (soglevel != null ? soglevel.hashCode() : 0);
        return result;
    }
}
