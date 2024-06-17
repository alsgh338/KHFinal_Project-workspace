<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="updatePwd.me" method="post">
현재 비밀번호를 입력하세요 : <input type="text" id="randomPwd" name="randomPwd">
새로운 비밀번호를 입력하세요 : <input type="password" id="newPwd" name="newPwd">

<input type="hidden" name="memNo" value="${ sessionScope.loginMember.memNo }">
<input type="hidden" name="memPwd" value="${ sessionScope.loginMember.memPwd }">
<button type="submit">비밀번호 변경</button>
</form>
</body>
</html>