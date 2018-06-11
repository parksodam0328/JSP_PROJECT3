<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<article>
<div>
<br><br><br><br><br><br><br>
	<%
	String id = (String)session.getAttribute("login");
	%>
	<center><span style="color:#35D995; font-size:40px;font-weight:900;">[<%= id %>] 님 로그아웃 되었습니다.</span></center>
	<br><br><br><br><br><br><br>
</div>
</article>
</center>
<%
	session.invalidate(); // 세션 삭제
	response.sendRedirect("index.jsp");
%>
</body>
</html>