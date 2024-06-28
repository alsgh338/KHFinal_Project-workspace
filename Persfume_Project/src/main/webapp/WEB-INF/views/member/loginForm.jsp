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
        	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);

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

.content {
        max-width: 800px;
        margin: auto;
        padding: 20px;
        background-color: #ffffff;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        border-radius: 5px;
        text-align: center;
 }

 .input-box {
        width: calc(100% - 40px);
        max-width: 300px;
        margin: 10px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
        box-sizing: border-box;
    }
	.button {
        background-color: #4285f4;
        color: white;
        border: none;
        padding: 6px 20px;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

	/* #loginform{
		width: 100%;
		height: 100%;
		margin: auto;
		border : solid;
		padding-top: 40px;
	} */

	/* #login_btn {
		background-color: #0c263f;
		color: white;
		width: 100px;
		height: 32px;
		margin-top: 10px;
		border-radius: 5px;
		box-sizing: border-box;
		display: inline-block;
	} */

	#findId {
		text-decoration: none; /* 링크의 밑줄 제거 */  
		color: inherit; /* 링크의 색상 제거 */
	}

	#findPwd {
		text-decoration: none; /* 링크의 밑줄 제거 */  
		color: inherit; /* 링크의 색상 제거 */
	}

	#IDCheck{
		
		padding-right: 100px;
	}


</style>

</head>
<body>

<jsp:include page="../common/header.jsp" />
<div class="content-title" id="home">LOGIN</div>

<div id="outer">
	<br><br>
	<br>
	<div class="content">
		<form action="login.me" method="post" id="loginform">
			<div id="ID">
				아이디 : <input type="text" id="memId" name="memId" class="input-box" value="${ cookie.saveId.value }">
			</div>
			<!-- 만약 saveId 라는 쿠키가 있다면 : 체크박스가 체크되게끔 -->
			<div id="IDCheck">
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
				비밀번호 : <input type="password" id="memPwd"  class="input-box" name="memPwd">
			</div>
			
				<a id="findId" href="" onclick="findId();">아이디 찾기 | </a>
				<a id="findPwd" href="" onclick="findPwd();" >비밀번호 찾기</a>
				<button type="submit" id="login_btn" class="button">로그인</button>
		
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