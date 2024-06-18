<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<style>

.font {
	font-family: "Nanum Gothic", sans-serif;
}

.content-title {
	height: 320px;
	background-color: #0c263f;
	background-size: cover;
	background-position: center;
	object-fit: cover;
	text-align: center;
	line-height: 320px;
	font-size: 50px;
	text-shadow: 1px 1px black, -1px 1px black, 1px -1px black, -1px -1px
		black;
	color: white;
	width: 100%;
}

.content-subtitle, .content-main {
	width: 1400px;
}

.content-subtitle {
	line-height: 150px;
	font-size: 30px;
	font-weight: 600;
}

.content-main {
	display: inline-block;
	text-align: center;
}

#outer {
	width: 1000px;
	/* border: 1px solid red; */
	margin: auto;
	box-sizing: border-box;
	text-align: center; /* 버튼을 가운데로 정렬하기 위한 설정 */
}

#ID{
	padding-left: 15px;
}

#loginformDiv{
	width: 500px;
	height: 200px;
	margin: auto;
}

#loginform{
	width: 100%;
	height: 100%;
	margin: auto;
	border : solid;
	padding-top: 40px;
}

#login_btn {
	background-color: #0c263f;
	color: white;
	width: 100px;
	height: 32px;
	margin-top: 10px;
	border-radius: 5px;
	box-sizing: border-box;
	display: inline-block;
}



</style>

</head>
<body>

<jsp:include page="../common/header.jsp" />
<div class="content-title" id="home">LOGIN</div>

<div id="outer">
	<br><br>
	<br>
	<div id="loginformDiv">
		<form action="login.me" method="post" id="loginform">
			<div id="ID">
				아이디 : <input type="text" id="memId" name="memId" value="${ cookie.saveId.value }">
				<br>
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
			</div>
			<div id="PWD">
				비밀번호 : <input type="text" id="memPwd" name="memPwd">
			</div>
			
				<a id="findId" href="" onclick="findId();">아이디 찾기</a>
				<a id="findPwd" href="" onclick="findPwd();" >비밀번호 찾기</a>
				<button type="submit" id="login_btn">로그인</button>
		
		</form>
	</div>
</div>


<script>

	function findPwd() {

		let url = "findPwd.me"

		$("#findPwd").attr("href",url);
	}

	function findId() {

	let url = "findId.me"

	$("#findId").attr("href",url);
	}
</script>
</body>
</html>