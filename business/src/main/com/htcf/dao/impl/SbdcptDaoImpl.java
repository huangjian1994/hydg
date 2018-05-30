package com.htcf.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.htcf.dao.ISbdcptDao;
import com.htcf.entity.SbdcptFkbdForm;
import com.htcf.entity.SearchForm;
import com.htcf.entity.THysyywHysydtYhxmForm;
import com.htcf.entity.THysyywNwbjkSbdcptFk;
import com.htcf.util.PageBean;

/**
 * 内外部接口——市不动产平台接口
 * @author yinying
 *
 */
@Repository(value="sbdcptDao")
public class SbdcptDaoImpl extends BaseDAOImpl<Object, Serializable> implements ISbdcptDao{

	/**
	 * 
	Description :项目信息列表
	@param:@param pageBean
	@param:@param hysyywHysydtYhxm
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-10-19 上午10:43:08
	 */
	public List<?> fetchYhxmList(PageBean pageBean,THysyywHysydtYhxmForm hysyywHysydtYhxmForm){
		String sql=
//			" from THysyywHysydtYhxm where 1=1 ";
		"select y.id yid, z.id zid, z.hyglh, y.yhxmmc,y.HYSYQR, \n" +
		"(select t.value from base_dictionary t where t.key='用海性质' and t.dm=z.yhxz), \n" +
		"(select t.value from base_dictionary t where t.key='发证机关级别' and t.dm=y.FZJGJB), \n" +
		"(select t.value from base_dictionary t where t.key='项目位置' and t.dm=y.xmwz), \n" +
		"z.zhmj,z.dczt,z.tszt1,z.tszt2,z.tszt3,y.slrq, \n" +
		"(select count(id) from T_HYSYYW_HYSYDT_YHXM_HYSYJ where xmid=y.id)" +
		" from t_hysyyw_hysydt_yhxm y, T_HYSYYW_HYSYDT_YHXM_ZHXX z \n" +
		" where z.xmid = y.id \n";
		
		if(hysyywHysydtYhxmForm != null){
			if(hysyywHysydtYhxmForm.getHyglh() != null && !hysyywHysydtYhxmForm.getHyglh().equals("")){
				sql += " and z.hyglh like '%"+hysyywHysydtYhxmForm.getHyglh().trim()+"%' ";
			}
			if(hysyywHysydtYhxmForm.getYhxmmc() != null && !hysyywHysydtYhxmForm.getYhxmmc().equals("")){
				sql += " and y.yhxmmc like '%"+hysyywHysydtYhxmForm.getYhxmmc().trim()+"%' ";
			}
			if(hysyywHysydtYhxmForm.getHysyqr() != null && !hysyywHysydtYhxmForm.getHysyqr().equals("")){
				sql += " and y.HYSYQR like '%"+hysyywHysydtYhxmForm.getHysyqr().trim()+"%' ";
			}
//			if(hysyywHysydtYhxmForm.getXmwz() != null && !hysyywHysydtYhxmForm.getXmwz().equals("")){
//				sql += " and y.xmwz like '%"+hysyywHysydtYhxmForm.getXmwz().trim()+"%' ";
//			}
			if(hysyywHysydtYhxmForm.getYhxz() != null && !hysyywHysydtYhxmForm.getYhxz().equals("")){
				sql += " and z.yhxz = '"+hysyywHysydtYhxmForm.getYhxz().trim()+"' ";
			}
			if(hysyywHysydtYhxmForm.getSlrq() != null && !hysyywHysydtYhxmForm.getSlrq().equals("")){
				sql += " and slrq like '%"+hysyywHysydtYhxmForm.getSlrq().trim()+"%' ";
			}
			if(hysyywHysydtYhxmForm.getZt() != null && !hysyywHysydtYhxmForm.getZt().equals("")){
				if(hysyywHysydtYhxmForm.getZt().equals("1")){
					sql += " and z.tszt1 != '6' ";
				}else if(hysyywHysydtYhxmForm.getZt().equals("2")){
					sql += " and z.tszt1 = '6' ";
				}else if(hysyywHysydtYhxmForm.getZt().equals("3")){
					sql += " and z.tszt2 = '1' ";
				}else if(hysyywHysydtYhxmForm.getZt().equals("4")){
					sql += " and z.tszt2 = '0' ";
				}else if(hysyywHysydtYhxmForm.getZt().equals("5")){
					sql += " and z.tszt3 = '1' ";
				}else if(hysyywHysydtYhxmForm.getZt().equals("6")){
					sql += " and z.tszt3 = '0' ";
				}
			}
		}
		sql += " order by y.id desc ";
		List<?> l = null;
		try{
			l = this.findPageBySQL(sql, pageBean);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}
	
	/**
	 * 
	Description :查出用海批文信息
	@param
	@return
	@throws
	@Author：yinying
	@Create 2017-10-18 下午04:37:31
	 */
	public List<?> fetchYhpw(String xmID,String zsID){
		String sql=
//			"select PWH,PWMC,YHXMMC,HYSYQR," +
//			"nvl(XMXZ,'1'),nvl(YHZMJ,'0'),nvl(MJDW,'3'),FWDW " +
//			"from t_hysyyw_hysydt_yhxm where id='"+xmID+"'";
			//批文号、批文名称、项目名称、海域使用权人（公司名称）、用海性质
			//用海总面积、面积单位、发文单位
			"select z.SPBH,z.PWMC,y.YHXMMC,y.HYSYQR,nvl(z.YHXZ, '1')," +
			"nvl(y.YHZMJ, '0'),nvl(y.MJDW, '3'),y.fzjg,z.id,z.xmid" +
			" from T_HYSYYW_HYSYDT_YHXM_ZHXX z,t_hysyyw_hysydt_yhxm y " +
			" where z.xmid=y.id ";
		
		if(xmID != null && !xmID.equals("")){
			sql += " and z.xmid='"+xmID+"' ";
		}
		if(zsID != null && !zsID.equals("")){
			sql += " and z.id='"+zsID+"' ";
		}
		List<?> l = null;
		try{
			l = this.findBySQL(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}
	/**
	 * 
	Description :根据项目ID查出批文编号
	@param:@param xmID
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-18 下午06:58:13
	 */
	public String fetchPwbhByXmid(String xmID,String zsID){
		String sql = "select pwbh from t_bh_pwbh where 1=1 ";
		if(xmID != null && !xmID.equals("")){
			sql += " and xmid='"+xmID+"' ";
		}
//		if(zsID != null && !zsID.equals("")){
//			sql += " and zsid='"+zsID+"' ";
//		}
		List<?> l = null;
		try{
			l = this.findBySQL(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		String pwbh="";
		if(l != null && l.size()!=0){
			pwbh = Integer.parseInt(l.get(0).toString())+"";
		}
		return pwbh;
	}
	/**
	 * 
	Description :查出批文编号+1
	@param:@return
	@return:String
	@throws
	@Author：yinying
	@Create 2017-10-18 下午06:57:55
	 */
	public String fetchPwbh(){
		String sql = "select MAX(pwbh) from t_bh_pwbh ";
		List<?> l = null;
		try{
			l = this.findBySQL(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		String pwbh="";
		if(l != null && l.size()!=0){
			pwbh = Integer.parseInt(l.get(0).toString())+1+"";
//			pwbh = Integer.parseInt(pwbh)+1+"";
		}
		System.out.println("dao************pwbh="+pwbh);
		return pwbh;
	}
	
	/**
	 * 
	Description :新增批文编号
	@param:@param xmID
	@param:@param pwbh
	@return:void
	@throws
	@Author：yinying
	@Create 2017-10-18 下午07:01:43
	 */
	public void addPwbh(String xmID,String pwbh,String zsID){
		String sql="insert into t_bh_pwbh (pwbh,xmid,zsid) values('"+pwbh+"','"+xmID+"','"+zsID+"')";
		try{
			this.updateBySql(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}
	/**
	 * 
	Description :更新项目状态
	@param:@param xmID
	@param:@param xmzt
	@return:void
	@throws
	@Author：yinying
	@Create 2017-10-18 下午07:26:09
	 */
	public void updateXmzt(String xmID,String zsID,String xmzt){
		String sql = "";
		String sql2 = "";
		if(xmzt.equals("1-1,") || xmzt.equals("1-0,") || xmzt.equals("1-2,")){
			sql = " update T_HYSYYW_HYSYDT_YHXM set DCZT='"+xmzt+"' where id='"+xmID+"'";
			
			sql2 = "update T_HYSYYW_HYSYDT_YHXM_ZHXX " +
					"set DCZT='"+xmzt+"' where id='"+zsID+"' and xmid ='"+xmID+"' ";
		}else{
			sql = " update T_HYSYYW_HYSYDT_YHXM set DCZT=DCZT||'"+xmzt+"' where id='"+xmID+"'";
			
			sql2 = " update T_HYSYYW_HYSYDT_YHXM_ZHXX " +
					"set DCZT=DCZT||'"+xmzt+"' where id='"+zsID+"' and xmid ='"+xmID+"' ";
		}
		try{
			this.updateBySql(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		try{
			this.updateBySql(sql2);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		
		if(xmzt.equals("1-1,")){
			String sqlTszt=" update T_HYSYYW_HYSYDT_YHXM_ZHXX set TSZT1='1' where id='"+zsID+"' and xmid ='"+xmID+"'";
			this.updateBySql(sqlTszt);
			try{
				this.updateBySql(sqlTszt);
			}catch(Exception e){
				System.out.println("SQL语句错误");
				System.out.println("e"+e);
			}
			
		}else if(xmzt.equals("1-0,")){
			String sqlTszt=" update T_HYSYYW_HYSYDT_YHXM_ZHXX set TSZT1='0' where id='"+zsID+"' and xmid ='"+xmID+"'";
			this.updateBySql(sqlTszt);
			try{
				this.updateBySql(sqlTszt);
			}catch(Exception e){
				System.out.println("SQL语句错误");
				System.out.println("e"+e);
			}
			
		}else if(xmzt.equals("2-1,") || xmzt.equals("3-1,") || xmzt.equals("4-1,") || xmzt.equals("5-1,") || xmzt.equals("6-1,")){
			String sqlC="select TSZT1 from T_HYSYYW_HYSYDT_YHXM_ZHXX where id='"+zsID+"' and xmid ='"+xmID+"'";
			List<?> l = null;
			try{
				l = this.findBySQL(sqlC);
			}catch(Exception e){
				System.out.println("SQL语句错误");
				System.out.println("e"+e);
			}
			
			String tszt="";
			if(l != null && l.size()!=0){
				tszt = Integer.parseInt(l.get(0).toString())+1+"";
			}
			String sqlTszt=" update T_HYSYYW_HYSYDT_YHXM_ZHXX set TSZT1='"+tszt+"' where id='"+zsID+"' and xmid ='"+xmID+"'";
			try{
				this.updateBySql(sqlTszt);
			}catch(Exception e){
				System.out.println("SQL语句错误");
				System.out.println("e"+e);
			}
			
		}else if(xmzt.equals("7-1,")){
			String sql7=" update T_HYSYYW_HYSYDT_YHXM_ZHXX set TSZT2='1' where id='"+zsID+"' and xmid ='"+xmID+"'";
			try{
				this.updateBySql(sql7);
			}catch(Exception e){
				System.out.println("SQL语句错误");
				System.out.println("e"+e);
			}
			
		}else if(xmzt.equals("7-0,") || xmzt.equals("7-2,")){
			String sql7=" update T_HYSYYW_HYSYDT_YHXM_ZHXX set TSZT2='0' where id='"+zsID+"' and xmid ='"+xmID+"'";
			try{
				this.updateBySql(sql7);
			}catch(Exception e){
				System.out.println("SQL语句错误");
				System.out.println("e"+e);
			}
			
		}else if(xmzt.equals("8-1,")){
			String sql8=" update T_HYSYYW_HYSYDT_YHXM_ZHXX set TSZT3='1' where id='"+zsID+"' and xmid ='"+xmID+"'";
			try{
				this.updateBySql(sql8);
			}catch(Exception e){
				System.out.println("SQL语句错误");
				System.out.println("e"+e);
			}
			
		}else if(xmzt.equals("8-0,") || xmzt.equals("8-2,")){
			String sql8=" update T_HYSYYW_HYSYDT_YHXM_ZHXX set TSZT3='0' where id='"+zsID+"' and xmid ='"+xmID+"'";
			try{
				this.updateBySql(sql8);
			}catch(Exception e){
				System.out.println("SQL语句错误");
				System.out.println("e"+e);
			}
			
		}
		
	}
	
	/**
	 * 
	Description :宗海信息
	@param:@param xmID
	@param:@param zsID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-10-18 下午08:01:58
	 */
	public List<?> fetchZhxx(String xmID,String zsID){
//		宗海编号、批文编号、不动产类型、
//		坐落、面积、面积单位、海域等级、占用海岸线、使用金总额、用海类型A、用海类型B、
//		使用金征收标准、使用金缴纳方式、使用金征收标准依据、项目编号、项目名称
		String sql="select z.id,(select p.pwbh from T_BH_PWBH p where p.xmid=z.xmid and p.zsid=z.id),'', \n" +
				"z.YHWZWZSM,z.ZHMJ,nvl(z.MJDW, '3'),t.HYDB,t.ZYAX,z.SYJZE,z.YHLXA,z.YHLXB, \n" +
				"z.SYJZSBZ,nvl(z.SYJJNFS, '1'),z.SYJZSBZYJ,z.xmid,t.YHXMMC,t.xmwz \n" +
				" from t_hysyyw_hysydt_yhxm t,T_HYSYYW_HYSYDT_YHXM_ZHXX z \n" +
				" where t.id=z.xmid \n";
		if(xmID != null && !xmID.equals("")){
			sql += " and z.xmid='"+xmID+"' ";
		}
		if(zsID != null && !zsID.equals("")){
			sql += " and z.id='"+zsID+"' ";
		}
		List<?> l = null;
		try{
			l = this.findBySQL(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}
	/**
	 * 
	Description :宗海附图
	@param:@param xmID
	@param:@param zsID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-10-19 上午11:55:16
	 */
	public List<?> fetchZhft(String xmID,String zsID){
		String sql="from THysyywHysydtYhxmZht " +
				"where 1=1 ";//and yhwzt is not null and jzt is not null
		if(xmID != null && !xmID.equals("")){
			sql += " and xmid='"+xmID+"' ";
		}
		if(zsID != null && !zsID.equals("")){
			sql += " and zsid='"+zsID+"' ";
		}
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}
	
	/**
	 * 
	Description :用海情况
	@param:@param xmID
	@param:@param zsID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-10-19 下午03:17:10
	 */
	public List<?> fetchYhqk(String xmID,String zsID){
		//用海编号、宗海编号、用海方式、面积、面积单位、具体用途、使用金数额
		String sql="select y.id yid,t.ID tid, y.YHFS,y.MJ,y.mjdw,y.JTYT,t.SYJZE \n" +
				" from T_HYSYYW_HYSYDT_YHXM_ZHXX t,T_HYSYYW_HYSYDT_YHXM_YHFS y \n" +
				" where t.id=y.zsid \n";
		if(xmID != null && !xmID.equals("")){
			sql += " and t.xmid='"+xmID+"' ";
		}
		if(zsID != null && !zsID.equals("")){
			sql += " and t.id='"+zsID+"' ";
		}
		List<?> l = null;
		try{
			l = this.findBySQL(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}
	
	/**
	 * 
	Description : 海域坐标
	@param:@param xmID
	@param:@param zsID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-10-19 下午04:55:57
	 */
	public List<?> fetchHyzb(String xmID,String zsID){
		//坐标编号、宗海编号、序号、北纬、东经、USAGEID、RINGID
		String sql="select ID,ZSID,XH,WD,JD " +
				"from T_HYSYYW_HYSYDT_YHXM_YHFS_JZD where 1=1 ";
		if(xmID != null && !xmID.equals("")){
			sql += " and xmid='"+xmID+"' ";
		}
		if(zsID != null && !zsID.equals("")){
			sql += " and ZSID='"+zsID+"' ";
		}
		sql += " order by xssx";
		List<?> l = null;
		try{
			l = this.findBySQL(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}
	
	/**
	 * 
	Description :用海（岛）面域定点顺序表
	@param:@param xmID
	@param:@param zsID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-10-19 下午04:58:11
	 */
	public List<?> fetchYhmyddsxb(String xmID,String zsID){
		String sql="select j.ID jid,j.ZSID,y.id yid,j.XH," +
				"(select t.pwbh from T_BH_PWBH t where t.xmid = j.xmid)" +
				" from T_HYSYYW_HYSYDT_YHXM_YHFS_JZD j,T_HYSYYW_HYSYDT_YHXM_YHFS y" +
				" where j.zsid = y.zsid ";
		if(xmID != null && !xmID.equals("")){
			sql += " and j.xmid='"+xmID+"' ";
		}
		if(zsID != null && !zsID.equals("")){
			sql += " and j.zsid='"+zsID+"' ";
		}
		sql += " order by j.xssx";
		List<?> l = null;
		try{
			l = this.findBySQL(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}
	
	/**
	 * 
	Description :海域使用金缴纳情况
	@param:@param xmID
	@param:@param zsID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-10-19 下午05:46:09
	 */
	public List<?> fetchHysyjjnqk(String xmID,String zsID){
		//宗海编号、使用金缴纳编号、缴纳人、缴纳情况、备注、收款人、收款金额、缴纳日期
		String sql="select ZSID,id,HYSYQR,'','',SKR,ZSJE_XJ,JNRQ,xmid" +
				" from T_HYSYYW_HYSYDT_YHXM_HYSYJ where 1=1 ";
		if(xmID != null && !xmID.equals("")){
			sql += " and xmid='"+xmID+"' ";
		}
		if(zsID != null && !zsID.equals("")){
			sql += " and zsid='"+zsID+"' ";
		}
		sql += " order by id ";
		List<?> l = null;
		try{
			l = this.findBySQL(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}
	
	/**
	 * 
	Description :配号表
	@param:@param xmID
	@param:@param zsID
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2017-10-19 下午07:08:39
	 */
	public List<?> fetchPhb(String xmID,String zsID){
		//宗海编号、批文号、受理编号、配号结果、配号人、开始日期/配号日期
		String sql=
//			"select t.ZSID," +
//				"(select p.SPBH from T_HYSYYW_HYSYDT_YHXM_ZHXX p where p.xmid=t.xmid and p.id=t.zsid)," +
//				"t.HYGLBH,t.KSRQ,t.PHJG,t.PHR,t.PHRQ" +
//				" from T_HYSYYW_HYSYDT_YHXM_PH t where 1=1 ";
			"select id,spbh,HYGLH,'','',FZRQ " +
			" from T_HYSYYW_HYSYDT_YHXM_ZHXX where 1=1 and HYGLH is not null ";
		if(xmID != null && !xmID.equals("")){
			sql += " and xmid='"+xmID+"' ";
		}
		if(zsID != null && !zsID.equals("")){
			sql += " and id='"+zsID+"' ";
		}
		List<?> l = null;
		try{
			l = this.findBySQL(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}
	
	/**
	 * 
	Description :删除市不动产平台反馈数据
	@param:@param approvalNum
	@return:void
	@throws
	@Author：yinying
	@Create 2018-1-16 下午05:37:06
	 */
	public void deleteSbdcptFk(String approvalNum){
		String sql=" delete from T_HYSYYW_NWBJK_SBDCPT_FK where approvalNum='"+approvalNum+"' ";
		try{
			int num = this.updateBySql(sql);
			System.out.println("num="+num);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}
	
	/**
	 * 
	Description :查出反馈数据
	@param:@param pageBean
	@param:@param searchForm
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2018-1-16 下午06:04:59
	 */
	public List<?> fetchSbdcptFk(PageBean pageBean,SearchForm searchForm){
		String sql=" from THysyywNwbjkSbdcptFk where 1=1 ";
		if(searchForm != null ){
			if(searchForm.getYhxmmc()!= null && !searchForm.getYhxmmc().equals("")){
				sql += " and projectname like '%"+searchForm.getYhxmmc().trim()+"%'";
			}
			if(searchForm.getXmxz()!= null && !searchForm.getXmxz().equals("")){
				sql += " and seausekind like '%"+searchForm.getXmxz().trim()+"%'";
			}
			if(searchForm.getYhpwbh()!= null && !searchForm.getYhpwbh().equals("")){
				sql += " and approvalnum like '%"+searchForm.getYhpwbh().trim()+"%'";
			}
			if(searchForm.getFzrq()!= null && !searchForm.getFzrq().equals("")){
				sql += " and enddate like '%"+searchForm.getFzrq().trim()+"%'";
			}
		}
		sql += " order by approvalnum";
		List<?> l = null;
		try{
			l = this.findPageByJPQL(sql, pageBean);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			return l;
		}
		return null;
	}
	
	/**
	 * 
	Description :反馈信息详情
	@param:@param fkID
	@param:@return
	@return:THysyywNwbjkSbdcptFk
	@throws
	@Author：yinying
	@Create 2018-1-16 下午06:06:40
	 */
	public THysyywNwbjkSbdcptFk fetchSbdcptFkDetail(String fkID){
		String sql=" from THysyywNwbjkSbdcptFk where id ='"+fkID+"' ";
		THysyywNwbjkSbdcptFk hysyywNwbjkSbdcptFk = new THysyywNwbjkSbdcptFk();
		List<?> l = null;
		try{
			l = this.findByJPQL(sql, null);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		if(l != null && l.size()!=0){
			hysyywNwbjkSbdcptFk = (THysyywNwbjkSbdcptFk) l.get(0);
		}
		return hysyywNwbjkSbdcptFk;
	}
	
	/**
	 * 
	Description :查出是否已存在
	@param:@param approvalNum
	@param:@return
	@return:int
	@throws
	@Author：yinying
	@Create 2018-1-18 下午05:07:00
	 */
	public int fetchSbdcptFkIs(String approvalNum){
		String sql="select id from T_HYSYYW_NWBJK_SBDCPT_FK where approvalNum='"+approvalNum+"' ";
		int num = 0 ;
		try{
			num = this.updateBySql(sql);
			System.out.println("num="+num);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		return num;
	}
	
	/**
	 * 
	Description :修改反馈信息
	@param:@param approvalNum
	@param:@param hysyywNwbjkSbdcptFk
	@return:void
	@throws
	@Author：yinying
	@Create 2018-1-18 下午05:17:06
	 */
	public void updateSbdcptFk(String approvalNum,THysyywNwbjkSbdcptFk hysyywNwbjkSbdcptFk){
		String sql = 
			"update T_HYSYYW_NWBJK_SBDCPT_FK\n" +
			"   set legalname        = '"+hysyywNwbjkSbdcptFk.getLegalname()+"',\n" + 
			"       legalposition    = '"+hysyywNwbjkSbdcptFk.getLegalposition()+"',\n" + 
			"       legalcardno      = '"+hysyywNwbjkSbdcptFk.getLegalcardno()+"',\n" + 
			"       agentaddress     = '"+hysyywNwbjkSbdcptFk.getAgentaddress()+"',\n" + 
			"       agentzip         = '"+hysyywNwbjkSbdcptFk.getAgentzip()+"',\n" + 
			"       agentname        = '"+hysyywNwbjkSbdcptFk.getAgentname()+"',\n" + 
			"       agenttel         = '"+hysyywNwbjkSbdcptFk.getAgenttel()+"',\n" + 
			"       projectname      = '"+hysyywNwbjkSbdcptFk.getProjectname()+"',\n" + 
			"       name             = '"+hysyywNwbjkSbdcptFk.getName()+"',\n" + 
			"       tel              = '"+hysyywNwbjkSbdcptFk.getTel()+"',\n" + 
			"       seausekind       = '"+hysyywNwbjkSbdcptFk.getSeausekind()+"',\n" + 
			"       approvalnum      = '"+hysyywNwbjkSbdcptFk.getApprovalnum()+"',\n" + 
			"       usedarea         = '"+hysyywNwbjkSbdcptFk.getUsedarea()+"',\n" + 
			"       area             = '"+hysyywNwbjkSbdcptFk.getArea()+"',\n" + 
			"       seausetypea      = '"+hysyywNwbjkSbdcptFk.getSeausetypea()+"',\n" + 
			"       seausetypeb      = '"+hysyywNwbjkSbdcptFk.getSeausetypeb()+"',\n" + 
			"       seausemode       = '"+hysyywNwbjkSbdcptFk.getSeausemode()+"',\n" + 
			"       applyyear        = '"+hysyywNwbjkSbdcptFk.getApplyyear()+"',\n" + 
			"       begindate        = '"+hysyywNwbjkSbdcptFk.getBegindate()+"',\n" + 
			"       duedate          = '"+hysyywNwbjkSbdcptFk.getDuedate()+"',\n" + 
			"       other            = '"+hysyywNwbjkSbdcptFk.getOther()+"',\n" + 
			"       other_passdate   = '"+hysyywNwbjkSbdcptFk.getOther_passdate()+"',\n" + 
			"       limit            = '"+hysyywNwbjkSbdcptFk.getLimit()+"',\n" + 
			"       limit_passdate   = '"+hysyywNwbjkSbdcptFk.getLimit_passdate()+"',\n" + 
			"       dissent          = '"+hysyywNwbjkSbdcptFk.getDissent()+"',\n" + 
			"       dissent_passdate = '"+hysyywNwbjkSbdcptFk.getDissent_passdate()+"',\n" + 
			"       correct          = '"+hysyywNwbjkSbdcptFk.getCorrect()+"',\n" + 
			"       realno           = '"+hysyywNwbjkSbdcptFk.getRealno()+"',\n" + 
			"       unitcode         = '"+hysyywNwbjkSbdcptFk.getUnitcode()+"',\n" + 
			"       passdate         = '"+hysyywNwbjkSbdcptFk.getPassdate()+"',\n" + 
			"       enddate          = '"+hysyywNwbjkSbdcptFk.getEnddate()+"',\n" + 
			"       acceptuser       = '"+hysyywNwbjkSbdcptFk.getAcceptuser()+"',\n" + 
			"       audituser        = '"+hysyywNwbjkSbdcptFk.getAudituser()+"',\n" + 
			"       LASTUPDATETIME        = '"+hysyywNwbjkSbdcptFk.getLastupdatetime()+"'\n" + 
			" where approvalnum = '"+approvalNum+"'";
		int num = 0 ;
		try{
			num = this.updateBySql(sql);
			System.out.println("修改记录num="+num);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
	}
	
	/**
	 * 
	Description :查出进行比对
	@param:@param approvalNum
	@param:@return
	@return:List<?>
	@throws
	@Author：yinying
	@Create 2018-1-19 下午03:38:22
	 */
	public SbdcptFkbdForm fetchYhxmZhxxBd(String approvalNum){
		String sql="select y.FDDBR,\n" +
		"       y.FDDBRZW,\n" + 
		"       y.FDDBRSFZ,\n" + 
		"       y.TXDZ,\n" + 
		"       y.YZBM,\n" + 
		"       y.LXRXM,\n" + 
		"       y.LXRDH,\n" + 
		"       y.YHXMMC,\n" + 
		"       y.HYSYQR,\n" + 
		"       y.SJ,\n" + 
		"       y.XMXZ,\n" + 
		"       y.YHZMJ,\n" + 
		"       z.SPBH,\n" + 
		"       z.YHXZ,\n" + 
		"       z.ZHMJ,\n" + 
		"       z.YHLXA,\n" + 
		"       z.YHLXB,\n" + 
		"       z.YHNX,\n" + 
		"       z.YHQSNX,\n" + 
		"       z.YHZZNX,\n" + 
		"       z.BDCQZSBH,\n" + 
		"       z.BDCDYH,\n" + 
		"       z.CSDJRQ,\n" + 
		"       z.DJR,\n" + 
		"       z.SHRXM,\n" + 
		"       f.YHFS,y.id xmid, z.id zsid,z.BDCQZSFZRQ\n" + 
		"  from T_HYSYYW_HYSYDT_YHXM      y,\n" + 
		"       T_HYSYYW_HYSYDT_YHXM_ZHXX z,\n" + 
		"       T_HYSYYW_HYSYDT_YHXM_YHFS f\n" + 
		" where z.spbh = '"+approvalNum+"'\n" + 
		"   and y.id = z.xmid\n" + 
		"   and f.zsid = z.id";
		List<?> l = null;
		try{
			l = this.findBySQL(sql);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		SbdcptFkbdForm sbdcptFkbdForm = null;
		if(l != null && l.size()!=0){
			Object[] obj = (Object[]) l.get(0);
			sbdcptFkbdForm = new SbdcptFkbdForm();
			if(obj[0] != null && !obj[0].toString().equals("")){
			sbdcptFkbdForm.setFddbr(obj[0].toString());
			}else{
				sbdcptFkbdForm.setFddbr(" ");
			}
			if(obj[1] != null && !obj[1].toString().equals("")){
			sbdcptFkbdForm.setFddbrzw(obj[1].toString());
			}else{
				sbdcptFkbdForm.setFddbrzw(" ");
			}
			if(obj[2] != null && !obj[2].toString().equals("")){
			sbdcptFkbdForm.setFddbrsfz(obj[2].toString());
			}else{
				sbdcptFkbdForm.setFddbrsfz(" ");
			}
			if(obj[3] != null && !obj[3].toString().equals("")){
			sbdcptFkbdForm.setTxdz(obj[3].toString());
			}else{
				sbdcptFkbdForm.setTxdz(" ");
			}
			if(obj[4] != null && !obj[4].toString().equals("")){
			sbdcptFkbdForm.setYzbm(obj[4].toString());
			}else{
				sbdcptFkbdForm.setYzbm(" ");
			}
			if(obj[5] != null && !obj[5].toString().equals("")){
			sbdcptFkbdForm.setLxrxm(obj[5].toString());
			}else{
				sbdcptFkbdForm.setLxrxm(" ");
			}
			if(obj[6] != null && !obj[6].toString().equals("")){
			sbdcptFkbdForm.setLxrdh(obj[6].toString());
			}else{
				sbdcptFkbdForm.setLxrdh(" ");
			}
			if(obj[7] != null && !obj[7].toString().equals("")){
			sbdcptFkbdForm.setYhxmmc(obj[7].toString());
			}else{
				sbdcptFkbdForm.setYhxmmc(" ");
			}
			if(obj[8] != null && !obj[8].toString().equals("")){
			sbdcptFkbdForm.setHysyqr(obj[8].toString());
			}else{
				sbdcptFkbdForm.setHysyqr(" ");
			}
			if(obj[9] != null && !obj[9].toString().equals("")){
			sbdcptFkbdForm.setSj(obj[9].toString());
			}else{
				sbdcptFkbdForm.setSj(" ");
			}
			if(obj[10] != null && !obj[10].toString().equals("")){
			sbdcptFkbdForm.setXmxz(obj[10].toString());
			}else{
				sbdcptFkbdForm.setXmxz(" ");
			}
			if(obj[11] != null && !obj[11].toString().equals("")){
			sbdcptFkbdForm.setYhzmj(obj[11].toString());
			}else{
				sbdcptFkbdForm.setYhzmj(" ");
			}
			if(obj[12] != null && !obj[12].toString().equals("")){
			sbdcptFkbdForm.setSpbh(obj[12].toString());
			}else{
				sbdcptFkbdForm.setSpbh(" ");
			}
			if(obj[13] != null && !obj[13].toString().equals("")){
			sbdcptFkbdForm.setYhxz(obj[13].toString());
			}else{
				sbdcptFkbdForm.setYhxz(" ");
			}
			if(obj[14] != null && !obj[14].toString().equals("")){
			sbdcptFkbdForm.setZhmj(obj[14].toString());
			}else{
				sbdcptFkbdForm.setZhmj(" ");
			}
			if(obj[15] != null && !obj[15].toString().equals("")){
			sbdcptFkbdForm.setYhlxa(obj[15].toString());
			}else{
				sbdcptFkbdForm.setYhlxa(" ");
			}
			if(obj[16] != null && !obj[16].toString().equals("")){
			sbdcptFkbdForm.setYhlxb(obj[16].toString());
			}else{
				sbdcptFkbdForm.setYhlxb(" ");
			}
			if(obj[17] != null && !obj[17].toString().equals("")){
			sbdcptFkbdForm.setYhnx(obj[17].toString());
			}else{
				sbdcptFkbdForm.setYhnx(" ");
			}
			if(obj[18] != null && !obj[18].toString().equals("")){
			sbdcptFkbdForm.setYhqsnx(obj[18].toString());
			}else{
				sbdcptFkbdForm.setYhqsnx(" ");
			}
			if(obj[19] != null && !obj[19].toString().equals("")){
			sbdcptFkbdForm.setYhzznx(obj[19].toString());
			}else{
				sbdcptFkbdForm.setYhzznx(" ");
			}
			
			if(obj[20] != null && !obj[20].toString().equals("")){
				sbdcptFkbdForm.setBdcqzsbh(obj[20].toString());
			}else{
				sbdcptFkbdForm.setBdcqzsbh(" ");
			}
			if(obj[21] != null && !obj[21].toString().equals("")){
				sbdcptFkbdForm.setBdcdyh(obj[21].toString());
			}else{
				sbdcptFkbdForm.setBdcdyh(" ");
			}
			if(obj[22] != null && !obj[22].toString().equals("")){
				sbdcptFkbdForm.setCsdjrq(obj[22].toString());
			}else{
				sbdcptFkbdForm.setCsdjrq(" ");
			}
			if(obj[23] != null && !obj[23].toString().equals("")){
				sbdcptFkbdForm.setDjr(obj[23].toString());
			}else{
				sbdcptFkbdForm.setDjr(" ");
			}
			if(obj[24] != null && !obj[24].toString().equals("")){
				sbdcptFkbdForm.setShrxm(obj[24].toString());
			}else{
				sbdcptFkbdForm.setShrxm(" ");
			}
			if(obj[25] != null && !obj[25].toString().equals("")){
			sbdcptFkbdForm.setYhfs(obj[25].toString());
			}else{
				sbdcptFkbdForm.setYhfs(" ");
			}
			if(obj[26] != null && !obj[26].toString().equals("")){
			sbdcptFkbdForm.setXmid(obj[26].toString());
			}else{
				sbdcptFkbdForm.setXmid("");
			}
			if(obj[27] != null && !obj[27].toString().equals("")){
			sbdcptFkbdForm.setZsid(obj[27].toString());
			}else{
				sbdcptFkbdForm.setZsid("");
			}
			if(obj[28] != null && !obj[28].toString().equals("")){
				sbdcptFkbdForm.setFzrq(obj[28].toString());
			}else{
				sbdcptFkbdForm.setFzrq("");
			}
		}
		return sbdcptFkbdForm;
	}
	
	/**
	 * 
	Description :更新比对结果-字段
	@param:@param tableName
	@param:@param zdName
	@param:@param zdValue
	@param:@param xmID
	@param:@param zsID
	@param:@return
	@return:int
	@throws
	@Author：yinying
	@Create 2018-1-19 下午05:54:22
	 */
	public int updateFkbd(String tableName,String zdName,String zdValue,String xmID,String zsID){
		String sql="";
		if(tableName.equals("T_HYSYYW_HYSYDT_YHXM")){
			sql=" update "+tableName+" set "+zdName+" = '"+zdValue+"' where id='"+xmID+"' ";
		}
		if(tableName.equals("T_HYSYYW_HYSYDT_YHXM_ZHXX")){
			sql=" update "+tableName+" set "+zdName+" = '"+zdValue+"' where id='"+zsID+"' ";
		}
		
		if(tableName.equals("T_HYSYYW_HYSYDT_YHXM_YHFS")){
			sql=" update "+tableName+" set "+zdName+" = '"+zdValue+"' where xmid='"+xmID+"' and zsid='"+zsID+"' ";
		}
		System.out.println("具体SQL="+sql);
		int num = 0 ;
		try{
			num = this.updateBySql(sql);
			System.out.println("修改记录num="+num);
		}catch(Exception e){
			System.out.println("SQL语句错误");
			System.out.println("e"+e);
		}
		return num;
	}
	
	
	
	
	
	
	
	
	
	
	
}
