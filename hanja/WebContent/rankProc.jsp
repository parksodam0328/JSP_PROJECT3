<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("login");
int num=0;
if(id==null){
	%>
	<script>
	alert("회원만 열람하실 수 있습니다. 로그인 해주세요!"); location.href="login.jsp";
	</script>
	<%}else{%>
	<table width="80%" align="center">
	
	<% 
	try{
		String filePath = application.getRealPath("/WEB-INF/score/");
		File theFile = new File(filePath);
		 File [] files = theFile.listFiles(); //파일의 리스트를 대입
		 	
		 	
		  for ( int i = 0; i < files.length; i++ ) {
			  int index =  files[i].getName().indexOf("_");
			 	int index2 =  files[i].getName().indexOf(".");
			  if(files[i].getName().substring(0, index).equals(id)){
			 	 
		  %>
			  <tr><td align="center" style="border-bottom: 1px solid #b9b9b9;"><%=num+1%></td><td align="center" style="border-bottom: 1px solid #b9b9b9;">
		    <%if ( files[i].isFile()){ 
		    out.println(files[i].getName().substring(0, index));
		    }%>
		    </td>
		    <td align="center" style="border-bottom: 1px solid #b9b9b9;"><%out.println(files[i].getName().substring(index+1, index2)); %></td>
		    </tr>
		    <%
		  }num++;
		  }
    
	}catch(Exception e){
		
	}
	} %>
	
	</table>
</body>
</html>