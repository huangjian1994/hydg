package com.htcf.entity;/**
 * Description :
 *
 * @author by hj on 2018-4-3.
 */

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

/**
 * Description :
 * @author by hj on 2018-4-3.
 */
@Entity
@Table(name = "OTH_SW")
public class HdgxDbldxxEntity {
    private long id;
    private String radarareacode;
    private String mmsi;
    private String distance;
    private String longitude;
    private String latitude;
    private String speed;
    private String azimuth;
    private String shipname;
    private String eShipname;
    private String rInitId;
    private String hhShip;
    private String imo;
    private String fromNam;
    private String cdsj;
    private String oState;
    private String oType;
    private String deipTime;
    private String oId;
    private String oWidth;
    private String oLength;
    private String jssj;



    @Id
    @GeneratedValue(generator="generator")
    @Column(name= "ID", unique=true, nullable= false, precision= 0, scale=0)
    @GenericGenerator(name="generator", strategy="increment")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "RADARAREACODE", nullable = true, length = 50)
    public String getRadarareacode() {
        return radarareacode;
    }

    public void setRadarareacode(String radarareacode) {
        this.radarareacode = radarareacode;
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
    @Column(name = "DISTANCE", nullable = true, length = 50)
    public String getDistance() {
        return distance;
    }

    public void setDistance(String distance) {
        this.distance = distance;
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
    @Column(name = "SPEED", nullable = true, length = 50)
    public String getSpeed() {
        return speed;
    }

    public void setSpeed(String speed) {
        this.speed = speed;
    }

    @Basic
    @Column(name = "AZIMUTH", nullable = true, length = 50)
    public String getAzimuth() {
        return azimuth;
    }

    public void setAzimuth(String azimuth) {
        this.azimuth = azimuth;
    }

    @Basic
    @Column(name = "SHIPNAME", nullable = true, length = 50)
    public String getShipname() {
        return shipname;
    }

    public void setShipname(String shipname) {
        this.shipname = shipname;
    }

    @Basic
    @Column(name = "E_SHIPNAME", nullable = true, length = 50)
    public String geteShipname() {
        return eShipname;
    }

    public void seteShipname(String eShipname) {
        this.eShipname = eShipname;
    }

    @Basic
    @Column(name = "R_INIT_ID", nullable = true, length = 50)
    public String getrInitId() {
        return rInitId;
    }

    public void setrInitId(String rInitId) {
        this.rInitId = rInitId;
    }

    @Basic
    @Column(name = "HH_SHIP", nullable = true, length = 50)
    public String getHhShip() {
        return hhShip;
    }

    public void setHhShip(String hhShip) {
        this.hhShip = hhShip;
    }

    @Basic
    @Column(name = "IMO", nullable = true, length = 50)
    public String getImo() {
        return imo;
    }

    public void setImo(String imo) {
        this.imo = imo;
    }

    @Basic
    @Column(name = "FROM_NAM", nullable = true, length = 100)
    public String getFromNam() {
        return fromNam;
    }

    public void setFromNam(String fromNam) {
        this.fromNam = fromNam;
    }

    @Basic
    @Column(name = "CDSJ", nullable = true, length = 50)
    public String getCdsj() {
        return cdsj;
    }

    public void setCdsj(String cdsj) {
        this.cdsj = cdsj;
    }

    @Basic
    @Column(name = "O_STATE", nullable = true, length = 50)
    public String getoState() {
        return oState;
    }

    public void setoState(String oState) {
        this.oState = oState;
    }

    @Basic
    @Column(name = "O_TYPE", nullable = true, length = 50)
    public String getoType() {
        return oType;
    }

    public void setoType(String oType) {
        this.oType = oType;
    }

    @Basic
    @Column(name = "DEIP_TIME", nullable = true, length = 50)
    public String getDeipTime() {
        return deipTime;
    }

    public void setDeipTime(String deipTime) {
        this.deipTime = deipTime;
    }

    @Basic
    @Column(name = "O_ID", nullable = true, length = 30)
    public String getoId() {
        return oId;
    }

    public void setoId(String oId) {
        this.oId = oId;
    }

    @Basic
    @Column(name = "O_WIDTH", nullable = true, length = 10)
    public String getoWidth() {
        return oWidth;
    }

    public void setoWidth(String oWidth) {
        this.oWidth = oWidth;
    }

    @Basic
    @Column(name = "O_LENGTH", nullable = true, length = 10)
    public String getoLength() {
        return oLength;
    }

    public void setoLength(String oLength) {
        this.oLength = oLength;
    }

    @Basic
    @Column(name = "JSSJ", nullable = true, length = 30)
    public String getJssj() {
        return jssj;
    }

    public void setJssj(String jssj) {
        this.jssj = jssj;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        HdgxDbldxxEntity that = (HdgxDbldxxEntity) o;

        if (id != that.id) return false;
        if (radarareacode != null ? !radarareacode.equals(that.radarareacode) : that.radarareacode != null)
            return false;
        if (mmsi != null ? !mmsi.equals(that.mmsi) : that.mmsi != null) return false;
        if (distance != null ? !distance.equals(that.distance) : that.distance != null) return false;
        if (longitude != null ? !longitude.equals(that.longitude) : that.longitude != null) return false;
        if (latitude != null ? !latitude.equals(that.latitude) : that.latitude != null) return false;
        if (speed != null ? !speed.equals(that.speed) : that.speed != null) return false;
        if (azimuth != null ? !azimuth.equals(that.azimuth) : that.azimuth != null) return false;
        if (shipname != null ? !shipname.equals(that.shipname) : that.shipname != null) return false;
        if (eShipname != null ? !eShipname.equals(that.eShipname) : that.eShipname != null) return false;
        if (rInitId != null ? !rInitId.equals(that.rInitId) : that.rInitId != null) return false;
        if (hhShip != null ? !hhShip.equals(that.hhShip) : that.hhShip != null) return false;
        if (imo != null ? !imo.equals(that.imo) : that.imo != null) return false;
        if (fromNam != null ? !fromNam.equals(that.fromNam) : that.fromNam != null) return false;
        if (cdsj != null ? !cdsj.equals(that.cdsj) : that.cdsj != null) return false;
        if (oState != null ? !oState.equals(that.oState) : that.oState != null) return false;
        if (oType != null ? !oType.equals(that.oType) : that.oType != null) return false;
        if (deipTime != null ? !deipTime.equals(that.deipTime) : that.deipTime != null) return false;
        if (oId != null ? !oId.equals(that.oId) : that.oId != null) return false;
        if (oWidth != null ? !oWidth.equals(that.oWidth) : that.oWidth != null) return false;
        if (oLength != null ? !oLength.equals(that.oLength) : that.oLength != null) return false;
        if (jssj != null ? !jssj.equals(that.jssj) : that.jssj != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (radarareacode != null ? radarareacode.hashCode() : 0);
        result = 31 * result + (mmsi != null ? mmsi.hashCode() : 0);
        result = 31 * result + (distance != null ? distance.hashCode() : 0);
        result = 31 * result + (longitude != null ? longitude.hashCode() : 0);
        result = 31 * result + (latitude != null ? latitude.hashCode() : 0);
        result = 31 * result + (speed != null ? speed.hashCode() : 0);
        result = 31 * result + (azimuth != null ? azimuth.hashCode() : 0);
        result = 31 * result + (shipname != null ? shipname.hashCode() : 0);
        result = 31 * result + (eShipname != null ? eShipname.hashCode() : 0);
        result = 31 * result + (rInitId != null ? rInitId.hashCode() : 0);
        result = 31 * result + (hhShip != null ? hhShip.hashCode() : 0);
        result = 31 * result + (imo != null ? imo.hashCode() : 0);
        result = 31 * result + (fromNam != null ? fromNam.hashCode() : 0);
        result = 31 * result + (cdsj != null ? cdsj.hashCode() : 0);
        result = 31 * result + (oState != null ? oState.hashCode() : 0);
        result = 31 * result + (oType != null ? oType.hashCode() : 0);
        result = 31 * result + (deipTime != null ? deipTime.hashCode() : 0);
        result = 31 * result + (oId != null ? oId.hashCode() : 0);
        result = 31 * result + (oWidth != null ? oWidth.hashCode() : 0);
        result = 31 * result + (oLength != null ? oLength.hashCode() : 0);
        result = 31 * result + (jssj != null ? jssj.hashCode() : 0);
        return result;
    }
}
