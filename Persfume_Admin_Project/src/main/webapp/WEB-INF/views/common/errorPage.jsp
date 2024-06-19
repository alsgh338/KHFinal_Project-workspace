<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// errorMsg 라는 키값으로 에러 문구 꺼내기
	String errorMsg = (String)request.getAttribute("errorMsg");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	<br>
	 <br>
	 
	 <h1 align="center" style="color: red;">
		<%= errorMsg %>
	</h1>
	

</body>
</html>