<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="delete.me">
비밀번호 : <input type="password" id="CheckPwd" name="CheckPwd" >

<button type="submit" id="delBtn">회원탈퇴</button>
<input type="hidden" name="memId" value="${ sessionScope.loginMember.memId }">
<input type="hidden" name="memPwd" value="${ sessionScope.loginMember.memPwd }">
</form>


<script>
document.getElementById("delBtn").addEventListener('click',Del);

function Del(){
    alert("정말 탈퇴하시겠습니까??");
}
</script>

</body>
</html>