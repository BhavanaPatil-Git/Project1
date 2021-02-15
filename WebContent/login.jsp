<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login jsp</title>
</head>
<body>

	<%
String userid=request.getParameter("userid");
String pass=request.getParameter("pass"); 

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection(  
			"jdbc:mysql://localhost:3306/edubridge", "root", "root");  
	String sql = ("select * from users where userid='" +userid+"' and pass='"+pass+"'");
	Statement st =con.createStatement();
ResultSet rs=st.executeQuery(sql);
	
	if(rs.next())
	{
	System.out.println("login successfully");
	response.sendRedirect("index.html");
	} 
	else{
		System.out.println("sorry");
	}

	

}
catch(SQLException ex){
	ex.printStackTrace();
}	
%>

</body>
</html>