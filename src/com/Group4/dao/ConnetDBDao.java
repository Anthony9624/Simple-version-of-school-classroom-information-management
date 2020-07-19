package com.Group4.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConnetDBDao {

	public ConnetDBDao() {
	}
	
	public ResultSet connetSQL(String str) {
		String DRIVER="com.mysql.jdbc.Driver";
	    try
	    {
	    	Class.forName(DRIVER);
	    }
	    catch(ClassNotFoundException g)
	    {
	    	System.out.println("no found");
	    } catch(Exception eg) {	
	    }
		try{
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/cmisdb?characterEncoding=utf8","root","root");
			
			Statement stmt=con.createStatement();
			
            String sql=str;
            
            System.out.println(str);

			ResultSet rs = stmt.executeQuery(sql);
			//while (rs.next())
	        //{
	        //	System.out.println(rs.getString(1));
	        //}
			return rs;
		} catch (Exception e) 
	    {
	    	e.printStackTrace();
	    }
		return null;
	}
	
	//public static void main(String args[]) {
	//	String str = "";
	//	new ConnetDBDao().connetSQL(str);
	//}
}
