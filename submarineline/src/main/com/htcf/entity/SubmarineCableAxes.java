package com.htcf.entity;
// default package

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;


/**
 * 崇明海缆坐标
 * @author lwb
 *
 */
@Entity
@Table(name="T_HYSYYW_CMHLZB"
   // ,schema="HYDGCF"
)

public class SubmarineCableAxes  implements java.io.Serializable {


    // Fields    

     private Long id;
     private String posLat;
     private String posLon;
     private String x;
     private String y;
     private String type;
     private Integer seq;


    // Constructors

    /** default constructor */
    public SubmarineCableAxes() {
    }

    
    /** full constructor */
    public SubmarineCableAxes(String posLat, String posLon, String x, String y, String type, Integer seq) {
        this.posLat = posLat;
        this.posLon = posLon;
        this.x = x;
        this.y = y;
        this.type = type;
        this.seq = seq;
    }

   
    // Property accessors
    @GenericGenerator(name="generator", strategy="increment")@Id @GeneratedValue(generator="generator")
    
    @Column(name="ID", unique=true, nullable=false, precision=18, scale=0)

    public Long getId() {
        return this.id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    @Column(name="POS_LAT", length=50)

    public String getPosLat() {
        return this.posLat;
    }
    
    public void setPosLat(String posLat) {
        this.posLat = posLat;
    }
    
    @Column(name="POS_LON", length=50)

    public String getPosLon() {
        return this.posLon;
    }
    
    public void setPosLon(String posLon) {
        this.posLon = posLon;
    }
    
    @Column(name="X", length=50)

    public String getX() {
        return this.x;
    }
    
    public void setX(String x) {
        this.x = x;
    }
    
    @Column(name="Y", length=50)

    public String getY() {
        return this.y;
    }
    
    public void setY(String y) {
        this.y = y;
    }
    
    @Column(name="TYPE", length=8)

    public String getType() {
        return this.type;
    }
    
    public void setType(String type) {
        this.type = type;
    }
    
    @Column(name="SEQ", precision=8, scale=0)

    public Integer getSeq() {
        return this.seq;
    }
    
    public void setSeq(Integer seq) {
        this.seq = seq;
    }
   








}