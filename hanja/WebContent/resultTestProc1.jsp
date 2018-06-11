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
<%! int cnt1=0; int cnt5=0; %>
<%!int s=0; int s2=0; %>
<%
int cnt=0;
String id = (String)session.getAttribute("login");
if(id!=null){
String[] hanja = {"日", "月", "山", "木", "心", "身", "手", "足", "耳", "目", "角", "甲", "巨", "京", "高", "工", "果", "交", "南", "女", "大", "東", "力", "馬"};
String[] means ={"날 일", "달 월", "뫼 산", "나무 목", "마음 심", "몸 신", "손 수", "발 족", "귀 이", "눈 목", "뿔 각", "갑옷 갑", "클 거", "서울 경", "높을 고", "장인 공", "열매 과", "사귈 교", "남녘 남", "계집 녀", "큰 대", "동녘 동", "힘 력", "말 마"};
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
		s+=10;
		num=i;
		text = res;
	}else{}
}
	 
if(text==""){ %>
<script>
alert("틀렸습니다. 정답은 <%=re%>입니다."); location.href='test2.jsp';
</script>
<%} %>
<center>

<article>
<hr width="100%">
<table width="100%" align="right"><tr><td align="right"> 점수 : <%=s %> 점</td></tr></table><br>
<br><br><br><span style="text-align:left; margin-left:10px;font-weight:700;font-size:18px;">한자 맞추기</span><br><br><br>
<% if(cnt5<10){ %>
<form action="test1.jsp">
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
		<td><input type="button" value="돌아가기" style="width:30%;" onclick="location.href='test2.jsp?score=<%=s%>'"></td>
	</tr>
</table>
</form>
<% cnt5++;  
}else{
	cnt5=0;
	String filename = id+"_"+s+".txt";
	PrintWriter writer=null;
	BufferedWriter bufferW = null;
	try{
	String filePath = application.getRealPath("/WEB-INF/score/"+filename);
	bufferW = new BufferedWriter(new FileWriter(filePath,true)); // 파일 내용 계속 추가
	writer = new PrintWriter(bufferW,true); 
	writer.printf("%s\r\n",s);

    writer.flush();
	}catch(Exception e){
		out.println("오류발생");
	}



s=0;}%>
</article>
</center>
<%}else{
	
	String[] hanja = {"日", "月", "山", "木", "心", "身", "手", "足", "耳", "目", "角", "甲", "巨", "京", "高", "工", "果", "交", "南", "女", "大", "東", "力", "馬"};
String[] means ={"날 일", "달 월", "뫼 산", "나무 목", "마음 심", "몸 신", "손 수", "발 족", "귀 이", "눈 목", "뿔 각", "갑옷 갑", "클 거", "서울 경", "높을 고", "장인 공", "열매 과", "사귈 교", "남녘 남", "계집 녀", "큰 대", "동녘 동", "힘 력", "말 마",};
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
		s2+=10;
		num=i;
		text = res;
	}else{}
}
if(text==""){ %>
<script>
alert("틀렸습니다. 정답은 <%=re%>입니다."); location.href='test2.jsp';
</script>
<%} %>
<center>

<article>
<hr width="100%">
<table width="100%" align="right"><tr><td align="right"> 점수 : <%out.print(s2);%> 점</td></tr></table><br>
<br><br><br><span style="text-align:left; margin-left:10px;font-weight:700;font-size:18px;">한자 맞추기</span><br><br><br>
<% if(cnt1<10){ %>
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
		<td><input id="mean" type="text" value="<%=text %>" readonly></td>
	</tr>
	<%} %>
</table>
<br><br>
<table width="100%">
	<tr>
		<td><input type="button" value="돌아가기" style="width:30%;" onclick="location.href='test2.jsp?score2=<%=s2%>'"></td>
	</tr>
</table>
</form>
<% cnt1++;  }else{cnt1=0;s2=0;}%>
</article>
</center>
<%} %>
</body>
</html>
</body>
</html>