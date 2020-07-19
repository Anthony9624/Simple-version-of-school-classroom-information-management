package com.Group4.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

/**
 * 
 * @author  第四小组成员（Long Qin; Chenan Wu; Feifan Xu; Haiyang Ding）
 *登录操作
 */
public class LoginDao {
	Vector result_user = new Vector();
	Vector result_teacher = new Vector();
	Connection con ;
	Statement sql ;
	ResultSet rs_user ;
	ResultSet rs_teacher ;
	
	public LoginDao(){
	}
	
	public Vector getResult_user(String user){
		try{
		   Class.forName("com.mysql.jdbc.Driver");
	    }
	    catch(Exception e){}
	    try{
	    	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cmisdb?characterEncoding=utf8","root","root");
	    	sql = con.createStatement();
	    	rs_user = sql.executeQuery("select * from Student where sno = '"+user+"'");
	    	while(rs_user.next()){
	    		result_user.add(rs_user.getString(1));
	    	}
	    	con.close();
	    }
	    catch(SQLException e){ }
	    return result_user;
	}
	
	public Vector getResult_teacher(String user){
		try{
		   Class.forName("com.mysql.jdbc.Driver");
	    }
	    catch(Exception e){}
	    try{
	    	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cmisdb?characterEncoding=utf8","root","root");
	    	sql = con.createStatement();
	    	rs_teacher = sql.executeQuery("select * from Teacher where tno = '"+user+"'");
	    	while(rs_teacher.next()){
	    		result_teacher.add(rs_teacher.getString(1));
	    	}
	    	con.close();
	    }
	    catch(SQLException e){ }
	    return result_teacher;
	}

}
