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



/* 여기서부터 비번찾기 css */
* { font-family: "Nanum Gothic", sans-serif;}

.content {
        max-width: 800px;
        margin: auto;
        padding: 20px;
        background-color: #ffffff;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        border-radius: 5px;
        text-align: center;
    }

	.button {
        background-color: #4285f4;
        color: white;
        border: none;
        padding: 10px 20px;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
	

	.input-box {
        width: calc(100% - 40px);
        max-width: 400px;
        margin: 10px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
        box-sizing: border-box;
    }



</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<div class="content-title" id="home"></div>
<br><br><br>
<div class="content">
	<form method="post" action="delete.me">
		<label for="Pwd"></label>비밀번호<br>
		<input type="password" id="Pwd" name="CheckPwd" class="input-box"><br><br>
	
	<button type="submit" id="delBtn" class="button">회원탈퇴</button>
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