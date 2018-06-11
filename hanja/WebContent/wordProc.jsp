<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="main.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>단어장</title>
</head>
<body>
<center>
<article>
<%
	String id = (String)session.getAttribute("login");
if(id==null){
	%>
	<script>
	alert("회원만 열람하실 수 있습니다. 로그인 해주세요!"); location.href="login.jsp";
	</script>
	<%}%>
	<hr>
	<center>
	<article>
	<table width="100%"><tr>
	<td align="right"><input type="button" value="추가하기" onclick="location.href='wordForm.jsp'"></td></tr></table>
	</article>
	</center>
	<%
	request.setCharacterEncoding("utf-8");
	String han = request.getParameter("h");
	String m = request.getParameter("m");
	String result;
	
	String filename = id+"_word.txt";
	PrintWriter writer=null;
	BufferedWriter bufferW = null;
	String filePath = application.getRealPath("/WEB-INF/bbs/"+filename);
	try{
		
	
	bufferW = new BufferedWriter(new FileWriter(filePath,true)); // 파일 내용 계속 추가
	if(han!=null && m!=null){
	writer = new PrintWriter(bufferW,true); 
	writer.printf("%s/",han);
	writer.printf("%s%n",m);

    writer.flush();
	}	//response.sendRedirect("word.jsp");//get방식으로 보냄
	
	}catch(Exception e){%>
		<center>
		<article>
		<div>
			<br><br><br><br><br><br><br>
			
			<center><span style="color:#35D995; font-size:40px;font-weight:900;">단어 추가를 실패하였습니다</span></center>
			<br><br><br><br><br><br><br>
		</div>
		</article>
		</center>
	<%}
%>
<%
File file = new File(filePath);
FileReader fileReader = new FileReader(file);
BufferedReader buffedReader = new BufferedReader(fileReader);
String str="";
String[] userInfor={};
try{
while((str = buffedReader.readLine())!=null){
	userInfor = str.split("/"); // 유저의 아이디와 비밀번호는 공백으로 구분
	%>
	<div>
	<center>
<article>
<table width="100%"><tr>
<td><span class="han"><%=userInfor[0] %></span></td>
</tr>
<tr><td><span class="mean"><%=userInfor[1] %></td></tr>
</table>
</article>
</center>
	</div><%}

}catch(Exception e){}
%>
</article>
</center>

</body>
</html>