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
<%! int cnt3=0; int cnt7=0; %>
<%
	int cnt=0;
	String id = (String)session.getAttribute("login");
	if(id!=null){
	String[] hanja = {"男", "解", "相", "同", "行", "休", "孝", "品", "炎", "林", "信", "明", "依", "學", "師", "多", "朋", "晶", "好", "功", "森", "易", "位", "仕"};
	String[] means ={"사내 남", "풀 해", "서로 상", "한가지 동", "다닐 행", "쉴 휴", "효도 효", "물건 품", "불꽃 염", "수풀 림", "믿을 신", "밝을 명", "의지할 의", "배울 학", "스승 사", "많을 다", "벗 붕", "밝을 정", "좋아할 호", "공 공", "나무 빽빽할 삼", "바꿀 역", "벼슬 위", "벼슬할 사"};
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
<% if(cnt7<10){ %>
<form action="resultTest3.jsp">
<table width="70%" align="center" >
	<tr>
		<td><span class="han"><%=test1[cnt7] %></span></td>
	</tr>
	<tr>
		<td><input id="mean" type="text" name="<%=test1[cnt7] %>"></td>
	</tr>
</table>
<br><br>
<table width="100%">
	<tr>
		<td><input type="submit" value="결과" style="width:30%;"></td>
	</tr>
</table>
</form>
<% cnt7++;  }else{%><script>alert("테스트가 종료되었습니다. 총점은 <%=request.getParameter("score")%>점 입니다."); location.href='test1.jsp';</script><%cnt7=0;} %>
</article>
</center>
<% }else{
	
	String[] hanja = {"男", "解", "相", "同", "行", "休", "孝", "品", "炎", "林", "信", "明", "依", "學", "師", "多", "朋", "晶", "好", "功", "森", "易", "位", "仕"};
	String[] means ={"사내 남", "풀 해", "서로 상", "한가지 동", "다닐 행", "쉴 휴", "효도 효", "물건 품", "불꽃 염", "수풀 림", "믿을 신", "밝을 명", "의지할 의", "배울 학", "스승 사", "많을 다", "벗 붕", "밝을 정", "좋아할 호", "공 공", "나무 빽빽할 삼", "바꿀 역", "벼슬 위", "벼슬할 사"};
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
<% if(cnt3<10){ %>
<form action="resultTest3.jsp">
<table width="70%" align="center" >
	<tr>
		<td><span class="han"><%=test1[cnt3] %></span></td>
	</tr>
	<tr>
		<td><input id="mean" type="text" name="<%=test1[cnt3] %>"></td>
	</tr>
</table>
<br><br>
<table width="100%">
	<tr>
		<td><input type="submit" value="결과" style="width:30%;"></td>
	</tr>
</table>
</form>
<% cnt3++;  }else{%><script>alert("테스트가 종료되었습니다. 총점은 <%=request.getParameter("score2")%>점 입니다."); location.href='test1.jsp';</script><%cnt3=0;} %>
</article>
</center>
<%} %>
</body>
</html>