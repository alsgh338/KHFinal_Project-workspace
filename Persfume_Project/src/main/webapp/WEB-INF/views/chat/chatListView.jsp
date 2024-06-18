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

	<h1>채팅방 리스트</h1>
	<br>
	<c:forEach var="chat" items="${ requestScope.list }">
  		<div onclick="openChat('${ chat.classNo }');">
  			클래스명 : ${ chat.className }
  			<br>
  			강사명 : ${ chat.classTeacher }
  			<br>
  			${ chat.startTime }~${ chat.endTime }
  			<br>
  		</div>
  		<br>
	</c:forEach>
	
	<script>
		function openChat(classNo) {
			
			location.href = "showChat?classNo=" + classNo;
			
		}
	
	</script>
</body>
</html>