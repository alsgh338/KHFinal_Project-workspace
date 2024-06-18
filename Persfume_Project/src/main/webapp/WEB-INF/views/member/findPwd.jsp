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
<div class="content-title" id="home"></div>
<div id="outer">
    <form action="PWDfind.me" method="post">
    <input type="text" id="ID" name="ID">아이디를 입력해주세요<br>
    <input type="text" id="email" name="email"> 이메일을 입력해주세요<br>

    <button type="submit">비밀번호 찾기</button>

    </form>
</div>

</body>
</html>