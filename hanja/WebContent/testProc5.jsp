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
	String[] hanja = {"汗", "雲", "霜", "抱", "海", "洋", "財", "花", "溢", "朗", "霖", "想", "頭", "問", "苦", "結", "江", "梅", "字", "聲", "停", "件", "淸", "暗"};
	String[] means ={"땀 한", "구름 운", "서리 상", "안을 포", "바다 해", "큰 바다 양", "재물 재", "꽃 화", "넘칠 일", "밝을 랑", "장마 림", "생각할 상", "머리 두", "물을 문", "괴로울 고", "맺을 결", "강 강", "매화나무 매", "글자 자", "소리 성", "정자 정", "물건 건", "맑을 청", "어두울 암"};
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
<table width="100%" align="right"><tr><td align="right"> 점수 :  <%if(request.getParameter("score")==null) out.print(0); else out.print(request.getParameter("score"));%> 점</td></tr></table><br>
<br><br><br><span style="text-align:left; margin-left:10px;font-weight:700;font-size:18px;">한자 맞추기</span><br><br><br>
<% if(cnt8<10){ %>
<form action="resultTest4.jsp">
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
<% }else{
	
	String[] hanja = {"汗", "雲", "霜", "抱", "海", "洋", "財", "花", "溢", "朗", "霖", "想", "頭", "問", "苦", "結", "江", "梅", "字", "聲", "停", "件", "淸", "暗"};
	String[] means ={"땀 한", "구름 운", "서리 상", "안을 포", "바다 해", "큰 바다 양", "재물 재", "꽃 화", "넘칠 일", "밝을 랑", "장마 림", "생각할 상", "머리 두", "물을 문", "괴로울 고", "맺을 결", "강 강", "매화나무 매", "글자 자", "소리 성", "정자 정", "물건 건", "맑을 청", "어두울 암"};
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
<% if(cnt4<10){ %>
<form action="resultTest4.jsp">
<table width="70%" align="center" >
	<tr>
		<td><span class="han"><%=test1[cnt4] %></span></td>
	</tr>
	<tr>
		<td><input id="mean" type="text" name="<%=test1[cnt4] %>"></td>
	</tr>
</table>
<br><br>
<table width="100%">
	<tr>
		<td><input type="submit" value="결과" style="width:30%;"></td>
	</tr>
</table>
</form>
<% cnt4++;  }else{%><script>alert("테스트가 종료되었습니다. 총점은 <%=request.getParameter("score2")%>점 입니다."); location.href='test1.jsp';</script><%cnt4=0;} %>
</article>
</center>
<%} %>
</body>
</html>