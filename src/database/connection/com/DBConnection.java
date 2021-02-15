package database.connection.com;
import com.javatpoint.bean.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import java.sql.*;

import java.util.*;





public class DBConnection {
	public static Connection getConnection(){
		Connection con=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/edubridge","root","root");
		}catch(Exception e){System.out.println(e);}
		return con;
	}
	public static int save(User u){
		int status=0;
		try{
			Connection con=getConnection();
			PreparedStatement ps=con.prepareStatement("insert into users(userid,pass,fname,lname,email) values(?,?,?,?,?)");
			ps.setString(1,u.getuserid());
			ps.setString(2,u.getpass());
			ps.setString(3,u.getfname());
			ps.setString(4,u.getlname());
			ps.setString(5,u.getemail());
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		return status;
	}
public static int update(User u){
		int status=0;
		try{
			Connection con=getConnection();
			

PreparedStatement ps=con.prepareStatement("update users set where userid=?  pass=?,fname=?,lname=?,email=? ");
           ps.setString(1,u.getuserid());
			ps.setString(2,u.getpass());
			ps.setString(3,u.getfname());
			ps.setString(4,u.getlname());
			ps.setString(5,u.getemail());
			
			
			status=ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}
		return status;
	}
public static int delete(User u){
	int status=0;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("delete from users where userid=?");
		ps.setString(1,u.getuserid());
		status=ps.executeUpdate();
	}catch(Exception e){System.out.println(e);}

	return status;
}
public static List<User> getAllRecords(){
	List<User> list=new ArrayList<User>();	
try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select * from users");
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			User u=new User();
			u.setuserid(rs.getString("userid"));
			u.setpass(rs.getString("pass"));
			u.setfname(rs.getString("fname"));
			u.setlname(rs.getString("lname"));
			u.setemail(rs.getString("email"));
			
			list.add(u);
		}
}
catch(Exception e)
{
	System.out.println(e);
}

	
return list;
	}

public static User getRecordById(String userid){
	User u=null;
	try{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select * from users where userid=?");
		ps.setString(1,userid);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
			u=new User();
			u.setuserid(rs.getString("userid"));
			u.setpass(rs.getString("pass"));
			u.setfname(rs.getString("fname"));
			u.setlname(rs.getString("lname"));
			u.setemail(rs.getString("email"));
			
		}
	}catch(Exception e){System.out.println(e);}
	return u;
}
}
