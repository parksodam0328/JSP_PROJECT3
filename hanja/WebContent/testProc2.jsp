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
<%! int cnt1=0; int cnt5=0; %>
<%
	int cnt=0;
	String id = (String)session.getAttribute("login");
	if(id!=null){
	String[] hanja = {"日", "月", "山", "木", "心", "身", "手", "足", "耳", "目", "角", "甲", "巨", "京", "高", "工", "果", "交", "南", "女", "大", "東", "力", "馬"};
	String[] means ={"날 일", "달 월", "뫼 산", "나무 목", "마음 심", "몸 신", "손 수", "발 족", "귀 이", "눈 목", "뿔 각", "갑옷 갑", "클 거", "서울 경", "높을 고", "장인 공", "열매 과", "사귈 교", "남녘 남", "계집 녀", "큰 대", "동녘 동", "힘 력", "말 마"};
	String[] test1 = new String[10];
	
	int[] ran = new int[30];
	Random rand = new Random();
	int tmpN=0;
	int total1=0;
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
<table width="100%" align="right"><tr><td align="right"> 점수 : <%if(request.getParameter("score")==null) out.print(0); else out.print(request.getParameter("score"));%> 점</td></tr></table><br>
<br><br><br><span style="text-align:left; margin-left:10px;font-weight:700;font-size:18px;">한자 맞추기</span><br><br><br>
<% if(cnt5<10){ %>
<form action="resultTest1.jsp">
<table width="70%" align="center" >
	<tr>
		<td><span class="han"><%=test1[cnt5] %></span></td>
	</tr>
	<tr>
		<td><input id="mean" type="text" name="<%=test1[cnt5] %>"></td>
	</tr>
</table>
<br><br>
<table width="100%">
	<tr>
		<td><input type="submit" value="결과" style="width:30%;"></td>
	</tr>
</table>
</form>
<% cnt5++;  }else{%><script>alert("테스트가 종료되었습니다. 총점은 <%=request.getParameter("score")%>점 입니다."); location.href='test1.jsp';</script><%cnt5=0;} %>
</article>
</center>
<% }else{
	
	String[] hanja = {"日", "月", "山", "木", "心", "身", "手", "足", "耳", "目", "角", "甲", "巨", "京", "高", "工", "果", "交", "南", "女", "大", "東", "力", "馬"};
	String[] means ={"날 일", "달 월", "뫼 산", "나무 목", "마음 심", "몸 신", "손 수", "발 족", "귀 이", "눈 목", "뿔 각", "갑옷 갑", "클 거", "서울 경", "높을 고", "장인 공", "열매 과", "사귈 교", "남녘 남", "계집 녀", "큰 대", "동녘 동", "힘 력", "말 마"};
	String[] test1 = new String[10];
	int[] ran = new int[10];
	Random rand = new Random();
	int tmpN=0;
	int total2=0;
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
<table width="100%" align="right"><tr><td align="right"> 점수 : <%if(request.getParameter("score2")==null) out.print(0); else out.print(request.getParameter("score2"));%> 점</td></tr></table><br>
<br><br><br><span style="text-align:left; margin-left:10px;font-weight:700;font-size:18px;">한자 맞추기</span><br><br><br>
<% if(cnt1<10){ %>
<form action="resultTest1.jsp">
<table width="70%" align="center" >
	<tr>
		<td><span class="han"><%=test1[cnt1] %></span></td>
	</tr>
	<tr>
		<td><input id="mean" type="text" name="<%=test1[cnt1] %>"></td>
	</tr>
</table>
<br><br>
<table width="100%">
	<tr>
		<td><input type="submit" value="결과" style="width:30%;"></td>
	</tr>
</table>
</form>
<% cnt1++;  }else{%><script>alert("테스트가 종료되었습니다. 총점은 <%=request.getParameter("score2")%>점 입니다."); location.href='test1.jsp';</script><%cnt1=0;} %>
</article>
</center>
<%} %>
</body>
</html>