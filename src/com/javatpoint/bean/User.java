package com.javatpoint.bean;
import java.sql.Connection;

public class User {
private String userid;
private String pass,fname,lname,email;
public String getuserid() {
	return userid;
}
public void setuserid(String userid) {
	this.userid = userid;
}
public String getpass() {
	return pass;
}
public void setpass(String pass) {
	this.pass = pass;
}
public String getfname() {
	return fname;
}
public void setfname(String fname) {
	this.fname = fname;
}


public String getlname() {
	return lname;
}
public void setlname(String lname) {
	this.lname = lname;
}
public String getemail() {
	return email;
}
public void setemail(String email) {
	this.email = email;
}

}


