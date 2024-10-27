<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login page</title>
</head>
<body>
<h2><%=
 session.getAttribute("name")
%></h2>
<h1 align="center">Login here</h1>
<form action="login" align="center" method="post">

<input type="text" name="email" placeholder="enter email"/><br><br>
<input type="text" name="password" placeholder="enter password"/><br><br>

<input type="submit" name="login"/>
</form>


</body>
</html>