<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>welcome page for EMS</title>
</head>
<body>
<h1>welcome to EMS</h1>
<a href="reg.jsp"><button>Click here to Register</button></a>
<a href="allemp"><button>view all employees</button></a>
<a href="login.jsp"><button>login here</button></a>

<script type="text/javascript">
let msgEle=document.getElementById("msg");

setTimeout(()=>{
	msgEle.style.display="none";
},2000)
</script>

</body>
</html>