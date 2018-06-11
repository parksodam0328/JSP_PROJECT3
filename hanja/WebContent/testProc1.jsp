<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>한자테스트</title>
<link rel="stylesheet" href="main.css">
</head>
<body>
<%
	String id = (String)session.getAttribute("login");
	if(id!=null){
%>
<center>

<article>
<hr width="100%">
<br><br><br><span style="text-align:left; margin-left:10px;font-weight:700;font-size:18px;">한자 맞추기</span><br><br><br>
<table width="80%" align="center" >
	<tr>
		<td width="20%"><input type="submit" value="상형자 테스트" onclick="location.href='test2.jsp'"></td>
		<td width="20%"><input type="submit" value="지사자 테스트" onclick="location.href='test3.jsp'"></td>
	</tr>	
	<tr>
		<td width="20%"><input type="submit" value="회의자 테스트" onclick="location.href='test4.jsp'"></td>
		<td width="20%"><input type="submit" value="형성자 테스트" onclick="location.href='test5.jsp'"></td>
	</tr>
	
</table>
</article>
</center>
<% }else{
	%>
	
<center>
<article>
<hr width="100%">
<br><br><br><span style="text-align:left; margin-left:10px;font-weight:700;font-size:18px;">한자 맞추기</span><br><br><br>
<table width="80%" align="center" >
	<tr>
		<td width="20%"><input type="submit" value="상형자 테스트" onclick="location.href='test2.jsp'"></td>
		<td width="20%"><input type="submit" value="지사자 테스트" onclick="location.href='test3.jsp'"></td>
	</tr>	
	<tr>
		<td width="20%"><input type="submit" value="회의자 테스트" onclick="location.href='test4.jsp'"></td>
		<td width="20%"><input type="submit" value="형성자 테스트" onclick="location.href='test5.jsp'"></td>
	</tr>
</table>
</article>
</center>
<%} %>
</body>
</html>