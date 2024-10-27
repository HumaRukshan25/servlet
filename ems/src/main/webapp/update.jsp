<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update page</title>
</head>
<body>
<%
ResultSet rs=(ResultSet)request.getAttribute("rs");
%>
<h2><%=
 session.getAttribute("name")
%></h2>
<h1 align="center"> update page</h1>
<form action="update" method="post" align="center">

<input type="number" name="id" placeholder="enter id" value="<%= rs.getInt(1) %>"/><br><br>
<input type="text" name="name" placeholder="enter name" value="<%= rs.getString(2) %>"/><br><br>
<input type="text" name="email" placeholder="enter email" value="<%= rs.getString(3) %>"/><br><br>
<input type="number" name="salary" placeholder="enter salary" value="<%= rs.getDouble(4) %>"/><br><br>
<input type="number" name="dno" placeholder="enter deptno" value="<%= rs.getInt(5) %>"/><br><br>
<input type="text" name="password" placeholder="enter password" value="<%= rs.getString(1) %>"/><br><br>
<input type="submit" name="update"/>
</form>

</body>
</html>