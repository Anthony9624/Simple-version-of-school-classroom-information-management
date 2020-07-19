package com.Group4.opdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class OpConnetDB {
	
	private String DRIVER="com.mysql.jdbc.Driver";
	private Connection con;
	
	public OpConnetDB() {
	}
	
	public void connect(String dbName) {
	    try
	    {
	    	Class.forName(DRIVER);
	    	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cmisdb?characterEncoding=utf8","root","root");
	    } catch (Exception e) 
	    {
	    	e.printStackTrace();
	    }
	}
	
	public ResultSet queryDB(String queryString) {
		try{
			Statement sql=con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = sql.executeQuery(queryString);
			while (rs.next()) {
				System.out.println(rs.getString(1));
			}
			return rs;
		} catch (Exception e) 
	    {
	    	e.printStackTrace();
	    }
		return null;
	}
	public boolean queryDBHave(String queryString) {
		try{
			Statement sql=con.createStatement();
			ResultSet rs = sql.executeQuery(queryString);
			if (rs.next()) {
				return true;
			}
		} catch (Exception e) 
	    {
	    }
		return false;
	}
	
	public boolean updateDB(String updateString) {
		try {
			Statement sql=con.createStatement();
			sql.executeUpdate(updateString);
			return true;
		} catch (SQLException e) {
			return false;
		}
	}
	
	public void disConnect() {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
