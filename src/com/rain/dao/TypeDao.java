package com.rain.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.rain.bean.TypeBean;
import com.rain.util.DBUtil;

public class TypeDao {
	/**获取所有物品类型的信息，返回数组形式*/
	public ArrayList<TypeBean> get_ListInfo() throws SQLException{
		ArrayList<TypeBean> tag_Array = new ArrayList<TypeBean>();
		Connection conn = DBUtil.getConnectDb();
		String sql = "select * from objecttype";
		PreparedStatement stm = null;
		ResultSet rs = null;
		stm = conn.prepareStatement(sql);
		rs = stm.executeQuery();
		while(rs.next()){
			TypeBean tag = new TypeBean();
			tag.setTid(rs.getInt("tid"));
			tag.setName(rs.getString("name"));
			tag_Array.add(tag);
		}
		return tag_Array;
	}
	
	/**修改物品分类的信息*/
	public boolean updateTypeObject(int tid, String name) throws SQLException {
		Connection conn = DBUtil.getConnectDb();
		PreparedStatement stm = null;
		String select_sql = "select* from objecttype where name=? and tid<>?";
		stm = conn.prepareStatement(select_sql);
		stm.setString(1,name);
		stm.setInt(2,tid);
		ResultSet rs = stm.executeQuery();
		if(rs.next() == true) {
			return false;
		}
		String sql = "update objecttype set name=? where tid=?";
		stm = conn.prepareStatement(sql);
		stm.setString(1, name);
		stm.setInt(2, tid);
		stm.executeUpdate();
		return true;
	}
	
	/**添加一个物品分类*/
	public boolean addObjectType(String name) throws SQLException {
		Connection conn = DBUtil.getConnectDb();
		PreparedStatement stm = null;
		String select_sql = "select* from objecttype where name=?";
		stm = conn.prepareStatement(select_sql);
		stm.setString(1,name);
		ResultSet rs = stm.executeQuery();
		if(rs.next() == true) {
			return false;
		}
		String sql = "insert  into objecttype(name) values(?)";
		stm = conn.prepareStatement(sql);
		stm.setString(1, name);
		stm.executeUpdate();
		return true;
	}
	
	/**删除一个物品分类*/
	public void deleteObjectType(int tid) throws SQLException {
		// TODO Auto-generated method stub
		Connection conn = DBUtil.getConnectDb();
		String sql = "delete from objecttype where tid=?";
		PreparedStatement stm = null;
			stm = conn.prepareStatement(sql);
			stm.setInt(1, tid);
			stm.executeUpdate();
	}
}
