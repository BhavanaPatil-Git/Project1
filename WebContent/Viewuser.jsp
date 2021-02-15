<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.javatpoint.bean.User,database.connection.com.DBConnection,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View User</title>

</head>
<body>


<h1>Users List</h1>

<%
List<User> list=DBConnection.getAllRecords();
request.setAttribute("list",list);
%>

<table border="1" width="90%">
<tr><th>userid</th><th>pass</th><th>fname</th><th>lname</th><th>email</th><th>update</th><th>Delete</th></tr>
<c:forEach items="${list}" var="u">
	<tr><td>${u.getuserid()}</td><td>${u.getpass()}</td><td>${u.getfname()}</td><td>${u.getlname()}</td><td>${u.getemail()}</td><td><a href="Updateform.jsp?userid=${u.getuserid()}">Update</a></td><td><a href="deleteuser.jsp?id=${u.getuserid()}">Delete</a></td></tr>
</c:forEach>
</table>
<br/><a href="Updateform.jsp">View User</a>





</body>
</html>