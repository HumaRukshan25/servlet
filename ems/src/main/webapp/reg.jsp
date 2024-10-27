<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration page</title>

<style>

</style>
</head>
<body>
<h2><%=
 session.getAttribute("name")
%></h2>
<h1 align="center">Register here</h1>
<form action="reg" align="center" method="post">

<input type="number" name="id" placeholder="enter id"/><br><br>
<input type="text" name="name" placeholder="enter name"/><br><br>
<input type="text" name="email" placeholder="enter email"/><br><br>
<input type="number" name="sal" placeholder="enter salary"/><br><br>
<input type="number" name="dno" placeholder="enter deptno"/><br><br>
<input type="text" name="password" placeholder="enter password"/><br><br>

<input type="submit" name="register"/>

</form>

</body>
</html>