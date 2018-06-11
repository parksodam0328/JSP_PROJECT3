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
<%!int cnt5=0; %>
<%!int s9=0; %>
<%
int cnt=0;
String id = (String)session.getAttribute("login");
List hanja = new ArrayList();
List means = new ArrayList();
	
	if(id!=null){

String filename = id+"_word.txt";
String filePath = application.getRealPath("/WEB-INF/bbs/"+filename);
File theFile = new File(filePath);
FileReader theFileReader = new FileReader(theFile); //파일 읽기
BufferedReader theBufferedReader = new BufferedReader(theFileReader);
String[] userInfor={};
String infor=""; // 파일의 내용 한 줄씩 읽어오기 위한 변수 선언
while((infor = theBufferedReader.readLine())!=null){
	userInfor = infor.split("/"); // 유저의 아이디와 비밀번호는 공백으로 구분
	hanja.add(userInfor[0]);
	means.add(userInfor[1]);
	cnt++;
}
String[] test1 = new String[cnt];
int[] ran = new int[30];
Random rand = new Random();
int tmpN=0;
String text="";
String res="";
String re="";
int num=0;
int total1=0;
for(int i=0;i<hanja.size();i++){
	res = request.getParameter(hanja.get(i).toString());
	if(res!=null){
		re=means.get(i).toString();
	}
	if(means.get(i).toString().equals(res)){
		s9+=10;
		num=i;
		System.out.print(num);
		text = res;
	}else{}
	test1[i] = hanja.get(i).toString();
	for(int j=0;j<=i;j++){
		if(test1[i].equals(test1[j])&& i!=j){
			i--;
			break;
		}
	}
}
	 
if(text==""){ %>
<script>
alert("틀렸습니다. 정답은 <%=re%>입니다."); location.href='test6.jsp';
</script>
<%} %>

<center>

<article>
<hr width="100%">
<table width="100%" align="right"><tr><td align="right"> 점수 : <%=s9 %> 점</td></tr></table><br>
<br><br><br><span style="text-align:left; margin-left:10px;font-weight:700;font-size:18px;">한자 맞추기</span><br><br><br>
<% if(cnt5<5){ %>
<form action="test5.jsp">
<table width="70%" align="center" >
<%if(res==""){%>
	<tr>
		<td><span class="han"><%out.print("답 입력안함"); %></span></td>
	</tr>
	<%}else{ %>
	<tr>
		<td><span class="han"><%=hanja.get(num).toString() %></span></td>
	</tr>
	<tr>
		<td><input id="mean" type="text" value="<%=text %>" readonly></td>
	</tr>
	<%} %>
</table>
<br><br>
<table width="100%">
	<tr>
		<td><input type="button" value="돌아가기" style="width:30%;" onclick="location.href='test6.jsp?score=<%=s9%>'"></td>
	</tr>
</table>
</form>
<% cnt5++;  
}else{
	cnt5=0;
	String filename2 = id+"_"+s9+".txt";
	PrintWriter writer=null;
	BufferedWriter bufferW = null;
	try{
	String filePath2 = application.getRealPath("/WEB-INF/score/"+filename2);
	bufferW = new BufferedWriter(new FileWriter(filePath2,true)); // 파일 내용 계속 추가
	writer = new PrintWriter(bufferW,true); 
	writer.printf("%s\r\n",s9);

    writer.flush();
	}catch(Exception e){
		out.println("오류발생");
	}



s9=0;}}%>
</article>
</center>
</body>
</html>
</body>
</html>