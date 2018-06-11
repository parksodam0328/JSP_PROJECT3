<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String userId = request.getParameter("id");
	String userPw = request.getParameter("pw");
	String result;
	
	String filename = "users.txt";
	PrintWriter writer=null;
	BufferedWriter bufferW = null;
	try{
	String filePath = application.getRealPath("/WEB-INF/bbs/"+filename);
	bufferW = new BufferedWriter(new FileWriter(filePath,true)); // 파일 내용 계속 추가
	writer = new PrintWriter(bufferW,true); 
	writer.printf("%s ",userId);
	writer.printf("%s %n",userPw);

    writer.flush();
	result="ok";
	}catch(Exception e){
		out.println("오류발생");
		result="fail";
	}
	response.sendRedirect("signUpOk.jsp?result="+userId);//get방식으로 보냄
%>
</body>
</html>