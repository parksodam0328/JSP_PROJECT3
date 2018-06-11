<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>단어장</title>
<link rel="stylesheet" href="main.css">
</head>
<body>
<center>
<article>
<div>
<br><br><br><br>
	<form action="wordProc.jsp" method="post">
	<center><span style="color:#35D995; font-size:40px;font-weight:900;">단어추가</span></center><br><br><br>
	<input type="text" id="hanja" name="h"><br>
	<input type="text" id="mean" name="m" ><br><br>
	<table width="100%" align="center">
	<tr>
	<td width="50%"><input type="submit" value="추가하기"></td>
	<td width="50%"><input type="button" value="단어장보기" onclick="location.href='word.jsp'"></td>
	</tr>
	</table>
	</form>
	</div>
	<br><br><br><br>
	</article></center>
</body>
</html>