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
<%! int cnt2=0; int cnt6=0; %>
<%!int s3=0; int s4=0; %>
<%
int cnt=0;
String id = (String)session.getAttribute("login");
if(id!=null){

String[] hanja = {"一", "上", "小", "本", "末", "寸", "下", "中", "二", "三", "入", "回", "出" ,"了", "乃", "于", "乎", "申", "匕", "出", "才", "克", "壬", "之"};
String[] means ={"한 일", "위 상", "작을 소", "근본 본", "끝 말", "마디 촌", "아래 하", "가운데 중", "두 이", "석 삼", "들 입", "돌아올 회", "날 출", "마칠 료", "이에 내", "어조사 우", "어조사 호", "펼 신", "비수 비", "날 출", "재주 재", "이길 극", "북방 임", "갈 지"};
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
		s3+=10;
		num=i;
		text = res;
	}else{}
}
	 
if(text==""){ %>
<script>
alert("틀렸습니다. 정답은 <%=re%>입니다."); location.href='test3.jsp';
</script>
<%} %>
<center>

<article>
<hr width="100%">
<table width="100%" align="right"><tr><td align="right"> 점수 : <%=s3 %> 점</td></tr></table><br>
<br><br><br><span style="text-align:left; margin-left:10px;font-weight:700;font-size:18px;">한자 맞추기</span><br><br><br>
<% if(cnt6<10){ %>
<form action="test3.jsp">
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
		<td><input type="button" value="돌아가기" style="width:30%;" onclick="location.href='test3.jsp?score=<%=s3%>'"></td>
	</tr>
</table>
</form>
<% cnt6++;  
}else{
	cnt6=0;
	String filename = id+"_"+s3+".txt";
	PrintWriter writer=null;
	BufferedWriter bufferW = null;
	try{
	String filePath = application.getRealPath("/WEB-INF/score/"+filename);
	bufferW = new BufferedWriter(new FileWriter(filePath,true)); // 파일 내용 계속 추가
	writer = new PrintWriter(bufferW,true); 
	writer.printf("%s\r\n",s3);

    writer.flush();
	}catch(Exception e){
		out.println("오류발생");
	}



s3=0;}%>
</article>
</center>
<%}else{
	
	String[] hanja = {"一", "上", "小", "本", "末", "寸", "下", "中", "二", "三", "入", "回", "出" ,"了", "乃", "于", "乎", "申", "匕", "出", "才", "克", "壬", "之"};
	String[] means ={"한 일", "위 상", "작을 소", "근본 본", "끝 말", "마디 촌", "아래 하", "가운데 중", "두 이", "석 삼", "들 입", "돌아올 회", "날 출", "마칠 료", "이에 내", "어조사 우", "어조사 호", "펼 신", "비수 비", "날 출", "재주 재", "이길 극", "북방 임", "갈 지"};
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
		s4+=10;
		num=i;
		text = res;
	}else{}
}
if(text==""){ %>
<script>
alert("틀렸습니다. 정답은 <%=re%>입니다."); location.href='test3.jsp';
</script>
<%} %>
<center>

<article>
<hr width="100%">
<table width="100%" align="right"><tr><td align="right"> 점수 : <%out.print(s4);%> 점</td></tr></table><br>
<br><br><br><span style="text-align:left; margin-left:10px;font-weight:700;font-size:18px;">한자 맞추기</span><br><br><br>
<% if(cnt2<10){ %>
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
		<td><input type="button" value="돌아가기" style="width:30%;" onclick="location.href='test3.jsp?score2=<%=s4%>'"></td>
	</tr>
</table>
</form>
<% cnt2++;  }else{cnt2=0;s4=0;}%>
</article>
</center>
<%} %>
</body>
</html>
</body>
</html>