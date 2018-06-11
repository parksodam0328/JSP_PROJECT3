<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contentPage = request.getParameter("CONTENTPAGE");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구몬</title>
</head>
<body>
<center>
<table width=100%>
	<tr>
		<td width=80% height=60>
			<jsp:include  page="top.jsp" flush="false"></jsp:include>
		</td>
	</tr>
	<tr>
		<td width=100% valign="top">
			<jsp:include  page="<%=contentPage%>" flush="false"></jsp:include>
		</td>
	</tr>
	<tr>
		<td width=80%>
			<jsp:include  page="bottom.jsp" flush="false"></jsp:include>
		</td>
	</tr>
</table>
</center>
</body>
</html>