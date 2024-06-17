<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<form action="IDfind.me" method="post">
<input type="text" id="email" name="email">가입 시 입력했던 이메일을 입력해주세요

<button type="submit">아이디 찾기</button>

아이디 : <input type="text" id="ID" name="findID" value="${ sessionScope.ID }"> 
</form>

</body>
</html>