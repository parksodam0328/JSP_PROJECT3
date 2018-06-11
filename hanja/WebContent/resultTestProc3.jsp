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
<%! int cnt3=0; int cnt7=0; %>
<%!int s5=0; int s6=0; %>
<%
int cnt=0;
String id = (String)session.getAttribute("login");
if(id!=null){
	String[] hanja = {"男", "解", "相", "同", "行", "休", "孝", "品", "炎", "林", "信", "明", "依", "學", "師", "多", "朋", "晶", "好", "功", "森", "易", "位", "仕"};
	String[] means ={"사내 남", "풀 해", "서로 상", "한가지 동", "다닐 행", "쉴 휴", "효도 효", "물건 품", "불꽃 염", "수풀 림", "믿을 신", "밝을 명", "의지할 의", "배울 학", "스승 사", "많을 다", "벗 붕", "밝을 정", "좋아할 호", "공 공", "나무 빽빽할 삼", "바꿀 역", "벼슬 위", "벼슬할 사"};
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
			s5+=10;
			num=i;
			text = res;
		}else{}
	}
		 
	if(text==""){ %>
	<script>
	alert("틀렸습니다. 정답은 <%=re%>입니다."); location.href='test4.jsp';
	</script>
	<%} %>

<center>

<article>
<hr width="100%">
<table width="100%" align="right"><tr><td align="right"> 점수 : <%=s5 %> 점</td></tr></table><br>
<br><br><br><span style="text-align:left; margin-left:10px;font-weight:700;font-size:18px;">한자 맞추기</span><br><br><br>
<% if(cnt7<10){ %>
<form action="test4.jsp">
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
		<td><input type="button" value="돌아가기" style="width:30%;" onclick="location.href='test4.jsp?score=<%=s5%>'"></td>
	</tr>
</table>
</form>
<% cnt7++;  
}else{
	cnt7=0;
	String filename = id+"_"+s5+".txt";
	PrintWriter writer=null;
	BufferedWriter bufferW = null;
	try{
	String filePath = application.getRealPath("/WEB-INF/score/"+filename);
	bufferW = new BufferedWriter(new FileWriter(filePath,true)); // 파일 내용 계속 추가
	writer = new PrintWriter(bufferW,true); 
	writer.printf("%s\r\n",s5);

    writer.flush();
	}catch(Exception e){
		out.println("오류발생");
	}



s5=0;}%>
</article>
</center>
<%}else{
	
	String[] hanja = {"男", "解", "相", "同", "行", "休", "孝", "品", "炎", "林", "信", "明", "依", "學", "師", "多", "朋", "晶", "好", "功", "森", "易", "位", "仕"};
	String[] means ={"사내 남", "풀 해", "서로 상", "한가지 동", "다닐 행", "쉴 휴", "효도 효", "물건 품", "불꽃 염", "수풀 림", "믿을 신", "밝을 명", "의지할 의", "배울 학", "스승 사", "많을 다", "벗 붕", "밝을 정", "좋아할 호", "공 공", "나무 빽빽할 삼", "바꿀 역", "벼슬 위", "벼슬할 사"};
int tmpN=0; 
String[] test1 = new String[10];
String text="";
int num=0;
String res = "";
int[] ran = new int[10];
Random rand = new Random();
int total2=0;
String re ="";
for(int i=0;i<hanja.length;i++){
	res = request.getParameter(hanja[i]);
	if(res!=null){
		re=means[i];
	}
	if(means[i].equals(res)){
		s6+=10;
		num=i;
		text = res;
	}else{}
}
if(text==""){ %>
<script>
alert("틀렸습니다. 정답은 <%=re%>입니다."); location.href='test4.jsp';
</script>
<%} %>
<center>

<article>
<hr width="100%">
<table width="100%" align="right"><tr><td align="right"> 점수 : <%out.print(s6);%> 점</td></tr></table><br>
<br><br><br><span style="text-align:left; margin-left:10px;font-weight:700;font-size:18px;">한자 맞추기</span><br><br><br>
<% if(cnt3<10){ %>
<form>
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
		<td><input id="mean" type="text" id="id" value="<%=text %>" readonly></td>
	</tr>
	<%} %>
</table>
<br><br>
<table width="100%">
	<tr>
		<td><input type="button" value="돌아가기" style="width:30%;" onclick="location.href='test4.jsp?score2=<%=s6%>'"></td>
	</tr>
</table>
</form>
<% cnt3++;  }else{cnt3=0;s6=0;}%>
</article>
</center>
<%} %>
</body>
</html>
</body>
</html>