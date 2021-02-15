<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="database.connection.com.DBConnection,com.javatpoint.bean.User"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

</head>
<body>



<%
String userid=request.getParameter("userid");
User u=DBConnection.getRecordById(userid);%>

<h1>Update Form</h1>
<form action="Updateuser.jsp" method="post">
<input type="text" name="userid" value="<%=u.getuserid()%>"/>
<table>

<tr><td>pass:</td><td><input type="pass" name="pass" value="<%= u.getpass()%>"/></td></tr>
<tr><td>fname:</td><td><input type="text" name="fname" value="<%= u.getfname()%>"/></td></tr>
<tr><td>lname:</td><td><input type="text" name="lname" value="<%= u.getlname()%>"/></td></tr>
<tr><td>email:</td><td><input type="text" name="email" value="<%= u.getemail()%>"/></td></tr>


</td></tr>
<tr><td colspan="2"><input type="submit" value="Update User"/></td></tr>
</table>
</form>





</body>
</html>