<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SignUp</title>
</head>
<body>
<form action="signUpProc.jsp" method="post">
<center>
<article>
<div>
	<br><br><br><br><br>
	<center><span style="color:#35D995; font-size:40px;font-weight:900;">SignUp</span></center><br><br><br>
	<input type="text" id="id" name="id" placeholder="id"><br>
	<input type="password" name="pw" placeholder="password"><br>
	<input type="submit" value="회원가입"><br>
	</form>
	<center><span style="color:#000; font-size:18px;">회원이신가요? </span><a href="login.jsp"><span style="color:#A4A4A4; font-size:18px;"> 로그인</a></span></center>
	<br><br><br><br><br>
</div>
</article>
</center>
</body>
</html>