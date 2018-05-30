package com.htcf.entity;

/**
 * 海洋自然保护区实体类，根据接口数据设计
 * @author by hj on 2017-10-23.
 */
public class HysyywHysydtHyzrbhq {

    /**
    主键
     */
    private String pk_jbxx_guid;

    /**
    保护区编号
     */
    private String st_bhqbh;

    /**
     *保护区名称
     */
    private String st_bhqmc;

    /**
     * 行政区域
     */
    private String st_xzqy;

    /**
     * 总面积（公顷）
     */
    private String nm_zmj;

    /**
     * 主管部门
     */
    private String st_zgbm;

    /**
     * 分类   基本上是分类代码
     */
    private String st_fl;

    /**
     * 分类名称  根据接口反馈设计
     */
    private String st_flmc;

    /**
     * 级别   级别代码
     */
    private String st_jb;

    /**
     * 级别名称  根据接口反馈设计
     */
    private String st_jbmc;

    /**
     * 批建时间
     */
    private String dt_pjsj;


    /**
     *区域点经纬度
     */
    private String geo;


    @Override
    public String toString() {
        return "HysyywHysydtHyzrbhq{" +
                "pk_jbxx_guid='" + pk_jbxx_guid + '\'' +
                ", st_bhqbh='" + st_bhqbh + '\'' +
                ", st_bhqmc='" + st_bhqmc + '\'' +
                ", st_xzqy='" + st_xzqy + '\'' +
                ", nm_zmj='" + nm_zmj + '\'' +
                ", st_zgbm='" + st_zgbm + '\'' +
                ", st_fl='" + st_fl + '\'' +
                ", st_flmc='" + st_flmc + '\'' +
                ", st_jb='" + st_jb + '\'' +
                ", st_jbmc='" + st_jbmc + '\'' +
                ", dt_pjsj='" + dt_pjsj + '\'' +
                ", geo='" + geo + '\'' +
                '}';
    }

    public String getPk_jbxx_guid() {
        return pk_jbxx_guid;
    }

    public void setPk_jbxx_guid(String pk_jbxx_guid) {
        this.pk_jbxx_guid = pk_jbxx_guid;
    }

    public String getSt_bhqbh() {
        return st_bhqbh;
    }

    public void setSt_bhqbh(String st_bhqbh) {
        this.st_bhqbh = st_bhqbh;
    }

    public String getSt_bhqmc() {
        return st_bhqmc;
    }

    public void setSt_bhqmc(String st_bhqmc) {
        this.st_bhqmc = st_bhqmc;
    }

    public String getSt_xzqy() {
        return st_xzqy;
    }

    public void setSt_xzqy(String st_xzqy) {
        this.st_xzqy = st_xzqy;
    }

    public String getNm_zmj() {
        return nm_zmj;
    }

    public void setNm_zmj(String nm_zmj) {
        this.nm_zmj = nm_zmj;
    }

    public String getSt_zgbm() {
        return st_zgbm;
    }

    public void setSt_zgbm(String st_zgbm) {
        this.st_zgbm = st_zgbm;
    }

    public String getSt_fl() {
        return st_fl;
    }

    public void setSt_fl(String st_fl) {
        this.st_fl = st_fl;
    }

    public String getSt_flmc() {
        return st_flmc;
    }

    public void setSt_flmc(String st_flmc) {
        this.st_flmc = st_flmc;
    }

    public String getSt_jb() {
        return st_jb;
    }

    public void setSt_jb(String st_jb) {
        this.st_jb = st_jb;
    }

    public String getSt_jbmc() {
        return st_jbmc;
    }

    public void setSt_jbmc(String st_jbmc) {
        this.st_jbmc = st_jbmc;
    }

    public String getDt_pjsj() {
        return dt_pjsj;
    }

    public void setDt_pjsj(String dt_pjsj) {
        this.dt_pjsj = dt_pjsj;
    }

    public String getGeo() {
        return geo;
    }

    public void setGeo(String geo) {
        this.geo = geo;
    }
}
