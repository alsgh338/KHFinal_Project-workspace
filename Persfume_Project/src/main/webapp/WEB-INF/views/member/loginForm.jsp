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

<form action="login.me" method="post">
아이디 : <input type="text" id="memId" name="memId" value="${ cookie.saveId.value }">
<!-- 만약 saveId 라는 쿠키가 있다면 : 체크박스가 체크되게끔 -->
<c:choose>
	<c:when test="${ not empty cookie.saveId }">
		<!-- 만약 saveId 라는 쿠키가 있다면 : 체크박스가 체크되게끔 -->
		<input type="checkbox" id="saveId" name="saveId" value="y" checked>
		<label for="saveId">아이디 저장</label>
	</c:when>
	<c:otherwise>
		<!-- 만약 saveId 라는 쿠키가 있다면 : 체크박스가 해제되게끔 -->
		<input type="checkbox" id="saveId" name="saveId" value="y">
		<label for="saveId">아이디 저장</label>
	</c:otherwise>
</c:choose>
비밀번호 : <input type="text" id="memPwd" name="memPwd">

<a id="findId" href="" onclick="findId();">아이디 찾기</a>
<a id="findPwd" href="" onclick="findPwd();" >비밀번호 찾기</a>
<button type="submit">로그인</button>
</form>



<script>
	function findId() {
		
		let url = "findId.me"
    
		$("#findId").attr("href", url);
	}

	function findPwd() {

		let url = "findPwd.me"
    
		$("#findPwd").attr("href", url);
	}
</script>
</body>
</html>