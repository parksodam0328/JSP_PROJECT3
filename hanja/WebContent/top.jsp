<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<link rel="stylesheet" href="main.css">
</head>
<body>
<%
	String id = (String)session.getAttribute("login");
	if(id==null){
%>
<br><a href="index.jsp"><img style="margin-left:150px;"src="image/logo.png"></a><br><br>
<center>
<header>
<span class="boardMenu"><a href="learn.jsp">한자 배우기</a></span>
<span class="boardMenu"><a href="test1.jsp">한자 테스트</a></span>
<span class="boardMenu"><a href="word.jsp">단어장</a></span>
<span class="boardMenu"><a href="rank.jsp">점수 보기</a></span>
<span class="boardMenu2"><a href="login.jsp">로그인</a>/<a href="signUp.jsp">회원가입</a></span>
</header>
</center>
<%}else{%>
<center>
<header>

<span class="boardMenu"><a href="learn.jsp">한자 배우기</a></span>
<span class="boardMenu"><a href="test1.jsp">한자 테스트</a></span>
<span class="boardMenu"><a href="word.jsp">단어장</a></span>
<span class="boardMenu"><a href="rank.jsp">점수 보기</a></span>
<span class="boardMenu3"><a href="logout.jsp"><%=id %>님 로그아웃</a></span>
</header>
</center>
<%} %>
<script src="main.js"></script>
</body>
</html>