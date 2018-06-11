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
<%! int cnt4=0; int cnt8=0;%>
<%
	int cnt=0;
	String id = (String)session.getAttribute("login");
	
	if(id!=null){
String[] test1 = new String[10];
String filename = id+"_word.txt";
String filePath = application.getRealPath("/WEB-INF/bbs/"+filename);
File theFile = new File(filePath);
FileReader theFileReader = new FileReader(theFile); //파일 읽기
BufferedReader theBufferedReader = new BufferedReader(theFileReader);
String[] userInfor={};
String infor=""; // 파일의 내용 한 줄씩 읽어오기 위한 변수 선언
while((infor = theBufferedReader.readLine())!=null){
	userInfor = infor.split("/"); // 유저의 아이디와 비밀번호는 공백으로 구분
	cnt++;
}
String[] hanja = new String[cnt];
String[] means = new String[cnt];
	int[] ran = new int[30];
	Random rand = new Random();
	int tmpN=0;
	int total1=0;
	for(int i=0;i<cnt;i++){
		System.out.print(hanja[i]);
	}
	for(int i=0;i<10;i++){
		tmpN = rand.nextInt(hanja.length);
		test1[i] = hanja[tmpN];
		for(int j=0;j<=i;j++){
			if(test1[i].equals(test1[j])&& i!=j){
				i--;
				break;
			}
		}
	}
%>
<center>

<article>
<hr width="100%">
<table width="100%" align="right"><tr><td align="right"> 점수 :  <%if(request.getParameter("score")==null) out.print(0); else out.print(request.getParameter("score"));%> 점</td></tr></table><br>
<br><br><br><span style="text-align:left; margin-left:10px;font-weight:700;font-size:18px;">한자 맞추기</span><br><br><br>
<% if(cnt8<10){ %>
<form action="resultTest3.jsp">
<table width="70%" align="center" >
	<tr>
		<td><span class="han"><%=test1[cnt8] %></span></td>
	</tr>
	<tr>
		<td><input id="mean" type="text" name="<%=test1[cnt8] %>"></td>
	</tr>
</table>
<br><br>
<table width="100%">
	<tr>
		<td><input type="submit" value="결과" style="width:30%;"></td>
	</tr>
</table>
</form>
<% cnt8++;  }else{%><script>alert("테스트가 종료되었습니다. 총점은 <%=request.getParameter("score")%>점 입니다."); location.href='test1.jsp';</script><%cnt8=0;} %>
</article>
</center>
</body>
</html>