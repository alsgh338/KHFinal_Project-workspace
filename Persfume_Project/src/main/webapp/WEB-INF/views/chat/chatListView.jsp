<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅방 리스트</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f7f7f7;
        margin: 0;
        padding: 0;
    }

    h1 {
        text-align: center;
        color: white;
        padding: 20px 0;
        margin: 0;
        background-color: #0C263F;
    }

    .class-list {
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        margin: 15px auto;
        padding: 15px;
        width: 90%;
        max-width: 600px;
        transition: transform 0.2s, box-shadow 0.2s;
        cursor: pointer;
    }

    .class-list:hover {
        transform: scale(1.02);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    .class-title {
        font-size: 18px;
        font-weight: bold;
        color: #333;
    }

    .class-teacher {
        font-size: 14px;
        color: #777;
    }

    .class-period {
        font-size: 12px;
        color: #aaa;
        margin-top: 5px;
    }

    hr {
        border: none;
        border-top: 1px solid #eee;
        margin: 0;
    }
</style>
</head>
<body>

    <h1>채팅방 리스트</h1>
    <br>
    <c:forEach var="chat" items="${requestScope.list}">
        <div class="class-list" onclick="openChat(this , ${chat.classNo});">
        
		<form id="postForm" method="post" action="showChat" style="display:none;">
			<input type="hidden" name="classNo" id="classNo">
        </form>
       
        <div class="class-title">클래스명: ${chat.className}</div>
        <div class="class-teacher">강사명: ${chat.classTeacher}</div>
        <div class="class-period">${chat.startTime} ~ ${chat.endTime}</div>
           
        </div>
        <hr>
    </c:forEach>
	
	<form id="postForm" method="post" action="showChat" style="display:none;">
		<input type="hidden" name="classNo" id="classNo">
	</form>


    <script>
        function openChat(element, classNo) {
        	let div = $(element).children('form'); // 폼태그 저장
        	
        	div.children('input').val(classNo);
        	
        	console.log(div.html());
        	console.log(classNo);

        	
        	// 폼태그 아래의 인풋태그 찾고 .val(classNo)
        	div.submit();

        }
        
    </script>
</body>
</html>