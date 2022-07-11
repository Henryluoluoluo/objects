package com.rain.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import com.rain.bean.AdminBean;
import com.rain.bean.ObjectBean;
import com.rain.bean.HistoryBean;
import com.rain.util.DBUtil;

public class ObjectDao {
	/**添加书籍*/
	public boolean addObject(String card, String name, String type,int num) throws SQLException {
		Connection conn = DBUtil.getConnectDb();
		PreparedStatement stm = null;
		String select_sql = "select* from object where card=?";
		stm = conn.prepareStatement(select_sql);
		stm.setString(1,card);
		ResultSet rs = stm.executeQuery();
		if(rs.next() == true) {
			return false;
		}
		String sql = "insert  into object(card,name,type,num) values(?,?,?,?)";
		stm = conn.prepareStatement(sql);
		stm.setString(1, card);
		stm.setString(2, name);
		stm.setString(3, type);
		stm.setInt(4, num);
		stm.executeUpdate();
		return true;
	}
	
	/**获取所有书籍信息存入列表*/
	public ArrayList<ObjectBean> get_ListInfo() throws SQLException{
		ArrayList<ObjectBean> tag_Array = new ArrayList<ObjectBean>();
		Connection conn = DBUtil.getConnectDb();
		String sql = "select * from object";
		PreparedStatement stm = null;
		ResultSet rs = null;
		stm = conn.prepareStatement(sql);
		rs = stm.executeQuery();
		while(rs.next()){
			ObjectBean tag = new ObjectBean();
			tag.setOid(rs.getInt("oid"));
			tag.setName(rs.getString("name"));
			tag.setCard(rs.getString("card"));
			tag.setType(rs.getString("type"));
			tag.setNum(rs.getInt("num"));
			tag_Array.add(tag);
		}		
		return tag_Array;
	}

	/**获取用户指定状态的书籍信息存入列表*/
	public ArrayList<HistoryBean> get_HistoryListInfo(int status,String aid) throws SQLException{
		ArrayList<HistoryBean> tag_Array = new ArrayList<HistoryBean>();
		Connection conn = DBUtil.getConnectDb();
		String sql = "select * from history where aid='"+aid+"' and status='"+status+"'";
		PreparedStatement stm = null;
		ResultSet rs = null;
		stm = conn.prepareStatement(sql);
		rs = stm.executeQuery();
		while(rs.next()){
			HistoryBean tag = new HistoryBean();
			tag.setHid(rs.getInt("hid"));
			tag.setAid(rs.getInt("aid"));
			tag.setOid(rs.getInt("oid"));
			tag.setObjectname(rs.getString("objectname"));
			tag.setCard(rs.getString("card"));
			tag.setUsername(rs.getString("username"));
			tag.setName(rs.getString("name"));
			tag.setBegintime(rs.getString("begintime"));
			tag.setEndtime(rs.getString("endtime"));
			tag.setStatus(rs.getInt("status"));
			tag_Array.add(tag);
		}
		return tag_Array;
	}
	
	/**管理员获取指定状态的书籍信息存入列表 */
	public ArrayList<HistoryBean> get_HistoryListInfo2(int status) throws SQLException{
		ArrayList<HistoryBean> tag_Array = new ArrayList<HistoryBean>();
		Connection conn = DBUtil.getConnectDb();
		String sql = "select * from history where status='"+status+"'";
		PreparedStatement stm = null;
		ResultSet rs = null;
		stm = conn.prepareStatement(sql);
		rs = stm.executeQuery();
		while(rs.next()){
			HistoryBean tag = new HistoryBean();
			tag.setHid(rs.getInt("hid"));
			tag.setAid(rs.getInt("aid"));
			tag.setOid(rs.getInt("oid"));
			tag.setObjectname(rs.getString("objectname"));
			tag.setCard(rs.getString("card"));
			tag.setUsername(rs.getString("username"));
			tag.setName(rs.getString("name"));
			tag.setBegintime(rs.getString("begintime"));
			tag.setEndtime(rs.getString("endtime"));
			tag.setStatus(rs.getInt("status"));
			tag_Array.add(tag);
		}
		return tag_Array;
	}

	/**获取指定书籍的信息存入列表*/
	public ObjectBean get_ObjectInfo(int oid) throws SQLException{
		ObjectBean tag = new ObjectBean();
		Connection conn = DBUtil.getConnectDb();
		String sql = "select * from object where oid='"+oid+"'";
		PreparedStatement stm = null;
		ResultSet rs = null;
		stm = conn.prepareStatement(sql);
		rs = stm.executeQuery();
		while(rs.next()){
			tag.setOid(rs.getInt("oid"));
			tag.setName(rs.getString("name"));
			tag.setCard(rs.getString("card"));
			tag.setType(rs.getString("type"));
			tag.setNum(rs.getInt("num"));
		}
		return tag;
	}
	
	/**管理员更新物品信息*/
	public boolean updateObject(int oid, String card, String name, String type, int num) throws SQLException {
		Connection conn = DBUtil.getConnectDb();
		PreparedStatement stm = null;
		String select_sql = "select* from object where card=? and oid<>?";
		stm = conn.prepareStatement(select_sql);
		stm.setString(1,card);
		stm.setInt(2,oid);
		ResultSet rs = stm.executeQuery();
		if(rs.next() == true) {
			return false;
		}
		String sql = "update object set name=?,card=?,type=?,num=? where oid=?";
		stm = conn.prepareStatement(sql);
		stm.setString(1, name);
		stm.setString(2, card);
		stm.setString(3, type);
		stm.setInt(4, num);
		stm.setInt(5, oid);
		stm.executeUpdate();
		updateObjectHistory(card,name,oid);
		return true;
	}
	
	/**管理员删除指定书籍*/
	public void deleteObject(int oid) throws SQLException {
		Connection conn = DBUtil.getConnectDb();
		String sql = "delete from object where oid=?";
		PreparedStatement stm = null;
		stm = conn.prepareStatement(sql);
		stm.setInt(1, oid);
		stm.executeUpdate();
	}
	
	/**物品查询*/
	public ArrayList<ObjectBean> getLikeList(String name) throws SQLException {
		ArrayList<ObjectBean> tag_Array = new ArrayList<ObjectBean>();
		Connection conn = DBUtil.getConnectDb();
		String sql = "select * from object where name like '%"+name+"%'";
		PreparedStatement stm = null;
		ResultSet rs = null;
		stm = conn.prepareStatement(sql);
		rs = stm.executeQuery();
		while(rs.next()){
			ObjectBean tag = new ObjectBean();
			tag.setOid(rs.getInt("oid"));
			tag.setName(rs.getString("name"));
			tag.setCard(rs.getString("card"));
			tag.setType(rs.getString("type"));
			tag.setNum(rs.getInt("num"));
			tag_Array.add(tag);
		}
		return tag_Array;
	}
	
	/**更新历史表中的物品信息*/
	public void updateObjectHistory(String card, String objectname, int oid) throws SQLException {
		Connection conn = DBUtil.getConnectDb();
		String sql = "update history set card=?,objectname=? where oid=?";
		PreparedStatement stm = null;
		stm = conn.prepareStatement(sql);
		stm.setString(1, card);
		stm.setString(2, objectname);
		stm.setInt(3, oid);
		stm.executeUpdate();
	}
	
	/**用户借书*/
	public void borrowObject(int oid, AdminBean adminbean) throws SQLException {
		int lend_num = adminbean.getLend_num();
		ObjectBean objectbean = new ObjectBean();
		objectbean = this.get_ObjectInfo(oid);
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);  
		int month = c.get(Calendar.MONTH)+1;   
		int day = c.get(Calendar.DATE);  
		String begintime = ""+year+"-"+month+"-"+day;
		c.add(Calendar.DATE,lend_num);
		year = c.get(Calendar.YEAR);  
		month = c.get(Calendar.MONTH)+1;   
		day = c.get(Calendar.DATE);
		String endtime = ""+year+"-"+month+"-"+day;
		Connection conn = DBUtil.getConnectDb();
		String sql = "insert  into history(aid,oid,card,objectname,username,name,begintime,endtime,status) values(?,?,?,?,?,?,?,?,?)";
		String subNum = "update object set num=num-1 where oid=?";
		PreparedStatement subNumstm = null;
		subNumstm = conn.prepareStatement(subNum);
		subNumstm.setInt(1, oid);
		subNumstm.executeUpdate();
		PreparedStatement stm = null;
		stm = conn.prepareStatement(sql);
		stm.setInt(1, adminbean.getAid());
		stm.setInt(2, objectbean.getOid());
		stm.setString(3, objectbean.getCard());
		stm.setString(4, objectbean.getName());
		stm.setString(5, adminbean.getUsername());
		stm.setString(6, adminbean.getName());
		stm.setString(7, begintime);
		stm.setString(8, endtime);
		stm.setInt(9, 1);
		stm.executeUpdate();
	}
	
	/**归还*/
	public void returnObject2(int hid,int oid) throws SQLException {
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);  
		int month = c.get(Calendar.MONTH)+1;   
		int day = c.get(Calendar.DATE); 
		String endtime = ""+year+"-"+month+"-"+day;
		Connection conn = DBUtil.getConnectDb();
		String sql = "update history set endtime=?,status=? where hid=?";
		String addObjectNum = "update object set num=num+1 where oid=?";
		PreparedStatement addStm = null;
		addStm = conn.prepareStatement(addObjectNum);
		addStm.setInt(1, oid);
		addStm.executeUpdate();
		PreparedStatement stm = null;
		stm = conn.prepareStatement(sql);
		stm.setString(1, endtime);
		stm.setInt(2, 0);
		stm.setInt(3, hid);
		stm.executeUpdate();
	}
}
