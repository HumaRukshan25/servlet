<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>all emp page</title>
<style type="text/css">
#createbut{
margin-left:50%;
margin-bottom:5px;
}
</style>
</head>
<body>
<h1 style="text-align:center">All Employee</h1>
<a id="createbut" href="reg.jsp"><button>create</button></a><br><br>

<h2><%=
 session.getAttribute("name")
%></h2>
<table border="5"  align="center" cellpadding="10" rules="all">

<thead>
<tr>
<th>id</th>
<th>name</th>
<th>email</th>
<th>salary</th>
<th>deptno</th>
<th>password</th>
<th colspan="2">Action</th>
</tr>
</thead>

<%
  ResultSet rs=(ResultSet)request.getAttribute("rs");
while(rs.next()) {
%>
<tr>
<td><%= rs.getString(1) %></td>
<td><%= rs.getString(2) %></td>
<td><%= rs.getString(3) %></td>
<td><%= rs.getString(4) %></td>
<td><%= rs.getString(5) %></td>
<td><%= rs.getString(6) %></td>
<td><a href="delete?id=<%= rs.getString(1) %>"><button>Delete</button></a> </td>
<td><a href="updatepage?id=<%= rs.getString(1) %>"><button>Update</button></a></td>
</tr>

<% 

}
%>
</table>
<br><br>
<hr>
<center><a href='logout'><button>Logout</button></a></center>
<script type="text/javascript">
const msgEle=document.getElementById("msg");
setTimeout(()=>{
	msgEle.style.display="none";
},2000)
</script>

</body>
</html>