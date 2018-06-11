<%@page import="java.io.FileWriter"%>
<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>한자테스트 결과</title>
</head>
<body>
<%!int cnt9=0; %>
<%!int s9=0; %>
<%
int cnt=0;
String id = (String)session.getAttribute("login");
if(id!=null){
String[] test1 = new String[10];
String res = "";
String text="";
int num=0;
String re ="";
int[] ran = new int[30];
Random rand = new Random();
int tmpN=0;
int total1=0;
for(int i=0;i<hanja.length;i++){
	res = request.getParameter(hanja[i]);
	if(res!=null){
		re=means[i];
	}
	if(means[i].equals(res)){
		s7+=10;
		num=i;
		text = res;
	}else{}
}
	 
if(text==""){ %>
<script>
alert("틀렸습니다. 정답은 <%=re%>입니다."); location.href='test5.jsp';
</script>
<%} %>

<center>

<article>
<hr width="100%">
<table width="100%" align="right"><tr><td align="right"> 점수 : <%=s7 %> 점</td></tr></table><br>
<br><br><br><span style="text-align:left; margin-left:10px;font-weight:700;font-size:18px;">한자 맞추기</span><br><br><br>
<% if(cnt8<10){ %>
<form action="test5.jsp">
<table width="70%" align="center" >
<%if(res==""){%>
	<tr>
		<td><span class="han"><%out.print("답 입력안함"); %></span></td>
	</tr>
	<%}else{ %>
	<tr>
		<td><span class="han"><%=hanja[num] %></span></td>
	</tr>
	<tr>
		<td><input id="mean" type="text" value="<%=text %>" readonly></td>
	</tr>
	<%} %>
</table>
<br><br>
<table width="100%">
	<tr>
		<td><input type="button" value="돌아가기" style="width:30%;" onclick="location.href='test5.jsp?score=<%=s7%>'"></td>
	</tr>
</table>
</form>
<% cnt8++;  
}else{
	cnt8=0;
	String filename = id+"_"+s7+".txt";
	PrintWriter writer=null;
	BufferedWriter bufferW = null;
	try{
	String filePath = application.getRealPath("/WEB-INF/score/"+filename);
	bufferW = new BufferedWriter(new FileWriter(filePath,true)); // 파일 내용 계속 추가
	writer = new PrintWriter(bufferW,true); 
	writer.printf("%s\r\n",s7);

    writer.flush();
	}catch(Exception e){
		out.println("오류발생");
	}



s7=0;}%>
</article>
</center>
</body>
</html>
</body>
</html>