<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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



/* 여기서부터 비번찾기 css */
* {
	font-family: "Nanum Gothic", sans-serif;
}

#outer {
	width: 1000px;
	/* border: 1px solid red; */
	margin: auto;
	box-sizing: border-box;
	text-align: center; /* 버튼을 가운데로 정렬하기 위한 설정 */
}

</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />

<br><br><br>
<div id="outer">
	<form method="post" action="delete.me">
	비밀번호 : <input type="password" id="CheckPwd" name="CheckPwd" >
	
	<button type="submit" id="delBtn">회원탈퇴</button>
	<input type="hidden" name="memId" value="${ sessionScope.loginMember.memId }">
	<input type="hidden" name="memPwd" value="${ sessionScope.loginMember.memPwd }">
	</form>
</div>


<script>
document.getElementById("delBtn").addEventListener('click',Del);

function Del(){
    alert("정말 탈퇴하시겠습니까??");
}
</script>

</body>
</html>