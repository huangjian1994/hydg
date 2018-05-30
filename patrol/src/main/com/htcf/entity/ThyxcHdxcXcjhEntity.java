package com.htcf.entity;/**
 * Description :
 *
 * @author by hj on 2018-4-2.
 */

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * Description :
 * @author by hj on 2018-4-2.
 */
@Entity
@Table(name = "T_HYXC_HDXC_XCJH"//, schema = "HYDGCF"
)

public class ThyxcHdxcXcjhEntity {
    private long id;
    private String patrolname;
    private String begintime;
    private String endtime;
    private String leaderid;
    private String leadername;
    private String inspectionmode;
    private String peoplename;
    private String peopleid;
    private String substance;
    private String east;
    private String south;
    private String west;
    private String north;
    private String locationdesrcription;
    private String drafetdate;
    private String drafepeoplename;
    private String drafepeopleid;
    private String updatetime;
    private String updateuser;
    private String approvetime;
    private String approveuser;
    private String approvebz;
    private String approvalopinion;
    private String planstatus;
    private String fillingdw;

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
    @Column(name = "PATROLNAME", nullable = true, length = 200)
    public String getPatrolname() {
        return patrolname;
    }

    public void setPatrolname(String patrolname) {
        this.patrolname = patrolname;
    }

    @Basic
    @Column(name = "BEGINTIME", nullable = true, length = 50)
    public String getBegintime() {
        return begintime;
    }

    public void setBegintime(String begintime) {
        this.begintime = begintime;
    }

    @Basic
    @Column(name = "ENDTIME", nullable = true, length = 50)
    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    @Basic
    @Column(name = "LEADERID", nullable = true, length = 50)
    public String getLeaderid() {
        return leaderid;
    }

    public void setLeaderid(String leaderid) {
        this.leaderid = leaderid;
    }

    @Basic
    @Column(name = "LEADERNAME", nullable = true, length = 50)
    public String getLeadername() {
        return leadername;
    }

    public void setLeadername(String leadername) {
        this.leadername = leadername;
    }

    @Basic
    @Column(name = "INSPECTIONMODE", nullable = true, length = 300)
    public String getInspectionmode() {
        return inspectionmode;
    }

    public void setInspectionmode(String inspectionmode) {
        this.inspectionmode = inspectionmode;
    }

    @Basic
    @Column(name = "PEOPLENAME", nullable = true, length = 300)
    public String getPeoplename() {
        return peoplename;
    }

    public void setPeoplename(String peoplename) {
        this.peoplename = peoplename;
    }

    @Basic
    @Column(name = "PEOPLEID", nullable = true, length = 300)
    public String getPeopleid() {
        return peopleid;
    }

    public void setPeopleid(String peopleid) {
        this.peopleid = peopleid;
    }

    @Basic
    @Column(name = "SUBSTANCE", nullable = true, length = 2000)
    public String getSubstance() {
        return substance;
    }

    public void setSubstance(String substance) {
        this.substance = substance;
    }

    @Basic
    @Column(name = "EAST", nullable = true, length = 50)
    public String getEast() {
        return east;
    }

    public void setEast(String east) {
        this.east = east;
    }

    @Basic
    @Column(name = "SOUTH", nullable = true, length = 50)
    public String getSouth() {
        return south;
    }

    public void setSouth(String south) {
        this.south = south;
    }

    @Basic
    @Column(name = "WEST", nullable = true, length = 50)
    public String getWest() {
        return west;
    }

    public void setWest(String west) {
        this.west = west;
    }

    @Basic
    @Column(name = "NORTH", nullable = true, length = 50)
    public String getNorth() {
        return north;
    }

    public void setNorth(String north) {
        this.north = north;
    }

    @Basic
    @Column(name = "LOCATIONDESRCRIPTION", nullable = true, length = 2000)
    public String getLocationdesrcription() {
        return locationdesrcription;
    }

    public void setLocationdesrcription(String locationdesrcription) {
        this.locationdesrcription = locationdesrcription;
    }

    @Basic
    @Column(name = "DRAFETDATE", nullable = true, length = 50)
    public String getDrafetdate() {
        return drafetdate;
    }

    public void setDrafetdate(String drafetdate) {
        this.drafetdate = drafetdate;
    }

    @Basic
    @Column(name = "DRAFEPEOPLENAME", nullable = true, length = 50)
    public String getDrafepeoplename() {
        return drafepeoplename;
    }

    public void setDrafepeoplename(String drafepeoplename) {
        this.drafepeoplename = drafepeoplename;
    }

    @Basic
    @Column(name = "DRAFEPEOPLEID", nullable = true, length = 50)
    public String getDrafepeopleid() {
        return drafepeopleid;
    }

    public void setDrafepeopleid(String drafepeopleid) {
        this.drafepeopleid = drafepeopleid;
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
    @Column(name = "UPDATEUSER", nullable = true, length = 50)
    public String getUpdateuser() {
        return updateuser;
    }

    public void setUpdateuser(String updateuser) {
        this.updateuser = updateuser;
    }

    @Basic
    @Column(name = "APPROVETIME", nullable = true, length = 50)
    public String getApprovetime() {
        return approvetime;
    }

    public void setApprovetime(String approvetime) {
        this.approvetime = approvetime;
    }

    @Basic
    @Column(name = "APPROVEUSER", nullable = true, length = 50)
    public String getApproveuser() {
        return approveuser;
    }

    public void setApproveuser(String approveuser) {
        this.approveuser = approveuser;
    }

    @Basic
    @Column(name = "APPROVEBZ", nullable = true, length = 2000)
    public String getApprovebz() {
        return approvebz;
    }

    public void setApprovebz(String approvebz) {
        this.approvebz = approvebz;
    }

    @Basic
    @Column(name = "APPROVALOPINION", nullable = true, length = 2000)
    public String getApprovalopinion() {
        return approvalopinion;
    }

    public void setApprovalopinion(String approvalopinion) {
        this.approvalopinion = approvalopinion;
    }

    @Basic
    @Column(name = "PLANSTATUS", nullable = true, length = 500)
    public String getPlanstatus() {
        return planstatus;
    }

    public void setPlanstatus(String planstatus) {
        this.planstatus = planstatus;
    }

    @Basic
    @Column(name = "FILLINGDW", nullable = true, length = 200)
    public String getFillingdw() {
        return fillingdw;
    }

    public void setFillingdw(String fillingdw) {
        this.fillingdw = fillingdw;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        ThyxcHdxcXcjhEntity that = (ThyxcHdxcXcjhEntity) o;

        if (id != that.id) {
            return false;
        }
        if (patrolname != null ? !patrolname.equals(that.patrolname) : that.patrolname != null) {
            return false;
        }
        if (fillingdw != null ? !fillingdw.equals(that.fillingdw) : that.fillingdw != null) {
            return false;
        }
        if (begintime != null ? !begintime.equals(that.begintime) : that.begintime != null) {
            return false;
        }
        if (endtime != null ? !endtime.equals(that.endtime) : that.endtime != null) {
            return false;
        }
        if (leaderid != null ? !leaderid.equals(that.leaderid) : that.leaderid != null) {
            return false;
        }
        if (leadername != null ? !leadername.equals(that.leadername) : that.leadername != null) {
            return false;
        }
        if (inspectionmode != null ? !inspectionmode.equals(that.inspectionmode) : that.inspectionmode != null) {
            return false;
        }
        if (peoplename != null ? !peoplename.equals(that.peoplename) : that.peoplename != null) {
            return false;
        }
        if (peopleid != null ? !peopleid.equals(that.peopleid) : that.peopleid != null) {
            return false;
        }
        if (substance != null ? !substance.equals(that.substance) : that.substance != null) {
            return false;
        }
        if (east != null ? !east.equals(that.east) : that.east != null) {
            return false;
        }
        if (south != null ? !south.equals(that.south) : that.south != null) {
            return false;
        }
        if (west != null ? !west.equals(that.west) : that.west != null) {
            return false;
        }
        if (north != null ? !north.equals(that.north) : that.north != null) {
            return false;
        }
        if (locationdesrcription != null ? !locationdesrcription.equals(that.locationdesrcription) : that.locationdesrcription != null) {
            return false;
        }
        if (drafetdate != null ? !drafetdate.equals(that.drafetdate) : that.drafetdate != null) {
            return false;
        }
        if (drafepeoplename != null ? !drafepeoplename.equals(that.drafepeoplename) : that.drafepeoplename != null) {
            return false;
        }
        if (drafepeopleid != null ? !drafepeopleid.equals(that.drafepeopleid) : that.drafepeopleid != null) {
            return false;
        }
        if (updatetime != null ? !updatetime.equals(that.updatetime) : that.updatetime != null) {
            return false;
        }
        if (updateuser != null ? !updateuser.equals(that.updateuser) : that.updateuser != null) {
            return false;
        }
        if (approvetime != null ? !approvetime.equals(that.approvetime) : that.approvetime != null) {
            return false;
        }
        if (approveuser != null ? !approveuser.equals(that.approveuser) : that.approveuser != null) {
            return false;
        }
        if (approvebz != null ? !approvebz.equals(that.approvebz) : that.approvebz != null) {
            return false;
        }
        if (approvalopinion != null ? !approvalopinion.equals(that.approvalopinion) : that.approvalopinion != null) {
            return false;
        }
        if (planstatus != null ? !planstatus.equals(that.planstatus) : that.planstatus != null) {
            return false;
        }

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (patrolname != null ? patrolname.hashCode() : 0);
        result = 31 * result + (fillingdw != null ? fillingdw.hashCode() : 0);
        result = 31 * result + (begintime != null ? begintime.hashCode() : 0);
        result = 31 * result + (endtime != null ? endtime.hashCode() : 0);
        result = 31 * result + (leaderid != null ? leaderid.hashCode() : 0);
        result = 31 * result + (leadername != null ? leadername.hashCode() : 0);
        result = 31 * result + (inspectionmode != null ? inspectionmode.hashCode() : 0);
        result = 31 * result + (peoplename != null ? peoplename.hashCode() : 0);
        result = 31 * result + (peopleid != null ? peopleid.hashCode() : 0);
        result = 31 * result + (substance != null ? substance.hashCode() : 0);
        result = 31 * result + (east != null ? east.hashCode() : 0);
        result = 31 * result + (south != null ? south.hashCode() : 0);
        result = 31 * result + (west != null ? west.hashCode() : 0);
        result = 31 * result + (north != null ? north.hashCode() : 0);
        result = 31 * result + (locationdesrcription != null ? locationdesrcription.hashCode() : 0);
        result = 31 * result + (drafetdate != null ? drafetdate.hashCode() : 0);
        result = 31 * result + (drafepeoplename != null ? drafepeoplename.hashCode() : 0);
        result = 31 * result + (drafepeopleid != null ? drafepeopleid.hashCode() : 0);
        result = 31 * result + (updatetime != null ? updatetime.hashCode() : 0);
        result = 31 * result + (updateuser != null ? updateuser.hashCode() : 0);
        result = 31 * result + (approvetime != null ? approvetime.hashCode() : 0);
        result = 31 * result + (approveuser != null ? approveuser.hashCode() : 0);
        result = 31 * result + (approvebz != null ? approvebz.hashCode() : 0);
        result = 31 * result + (approvalopinion != null ? approvalopinion.hashCode() : 0);
        result = 31 * result + (planstatus != null ? planstatus.hashCode() : 0);
        return result;
    }
}
