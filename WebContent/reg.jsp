<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%
String userid=request.getParameter("userid");
String pass=request.getParameter("pass");
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");  
String email=request.getParameter("email");

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/edubridge", "root", "root");  
	
	PreparedStatement stmt=con.prepareStatement("insert into users (userid, pass, fname, lname, email) Values (?, ?, ?, ?, ?)");
	stmt.setString(1, userid);
	stmt.setString(2, pass);
	stmt.setString(3, fname);
	stmt.setString(4, lname);
	stmt.setString(5, email);
	int rowInserted=stmt.executeUpdate();
	if(rowInserted > 0){
		System.out.println("Registration Successfully");
		response.sendRedirect("index.html");
}
	else{
	System.out.println("Registration Fail");
	
	
}

}
catch(SQLException ex){
	ex.printStackTrace();
}	
%>

<a href="Login.html">Login</a>
<a href="index.html">Logout</a>

</body>
</html>