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
<%! int cnt2=0; int cnt6=0; %>
<%
	int cnt=0;
	String id = (String)session.getAttribute("login");
	if(id!=null){
	String[] hanja = {"日", "上", "小", "本", "末", "寸", "下", "中", "二", "三", "入", "回", "出" ,"了", "乃", "于", "乎", "申", "匕", "出", "才", "克", "壬", "之"};
	String[] means ={"한 일", "위 상", "작을 소", "근본 본", "끝 말", "마디 촌", "아래 하", "가운데 중", "두 이", "석 삼", "들 입", "돌아올 회", "날 출", "마칠 료", "이에 내", "어조사 우", "어조사 호", "펼 신", "비수 비", "날 출", "재주 재", "이길 극", "북방 임", "갈 지"};
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
<table width="100%" align="right"><tr><td align="right"> 점수 : <%if(request.getParameter("score")==null) out.print(0); else out.print(request.getParameter("score"));%>  점</td></tr></table><br>
<br><br><br><span style="text-align:left; margin-left:10px;font-weight:700;font-size:18px;">한자 맞추기</span><br><br><br>
<% if(cnt6<10){ %>
<form action="resultTest2.jsp">
<table width="70%" align="center" >
	<tr>
		<td><span class="han"><%=test1[cnt6] %></span></td>
	</tr>
	<tr>
		<td><input id="mean" type="text" name="<%=test1[cnt6] %>"></td>
	</tr>
</table>
<br><br>
<table width="100%">
	<tr>
		<td><input type="submit" value="결과" style="width:30%;"></td>
	</tr>
</table>
</form>
<% cnt6++;  }else{%><script>alert("테스트가 종료되었습니다. 총점은 <%=request.getParameter("score")%>점 입니다."); location.href='test1.jsp';</script><%cnt6=0;} %>
</article>
</center>
<% }else{
	
	String[] hanja = {"一", "上", "小", "本", "末", "寸", "下", "中", "二", "三", "入", "回", "出" ,"了", "乃", "于", "乎", "申", "匕", "出", "才", "克", "壬", "之"};
	String[] means ={"한 일", "위 상", "작을 소", "근본 본", "끝 말", "마디 촌", "아래 하", "가운데 중", "두 이", "석 삼", "들 입", "돌아올 회", "날 출", "마칠 료", "이에 내", "어조사 우", "어조사 호", "펼 신", "비수 비", "날 출", "재주 재", "이길 극", "북방 임", "갈 지"};
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
<% if(cnt2<10){ %>
<form action="resultTest2.jsp">
<table width="70%" align="center" >
	<tr>
		<td><span class="han"><%=test1[cnt2] %></span></td>
	</tr>
	<tr>
		<td><input id="mean" type="text" name="<%=test1[cnt2] %>"></td>
	</tr>
</table>
<br><br>
<table width="100%">
	<tr>
		<td><input type="submit" value="결과" style="width:30%;"></td>
	</tr>
</table>
</form>
<% cnt2++;  }else{%><script>alert("테스트가 종료되었습니다. 총점은 <%=request.getParameter("score2")%>점 입니다."); location.href='test1.jsp';</script><%cnt2=0;} %>
</article>
</center>
<%} %>
</body>
</html>