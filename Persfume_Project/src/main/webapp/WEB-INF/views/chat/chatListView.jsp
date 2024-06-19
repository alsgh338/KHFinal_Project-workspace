<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅방 리스트</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f7f7f7;
        margin: 0;
        padding: 0;
    }

    h1 {
        text-align: center;
        color: #333;
        padding: 20px 0;
        margin: 0;
        background-color: #ffeb3b;
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
        <div class="class-list" onclick="openChat('${chat.classNo}');">
            <div class="class-title">클래스명: ${chat.className}</div>
            <div class="class-teacher">강사명: ${chat.classTeacher}</div>
            <div class="class-period">${chat.startTime} ~ ${chat.endTime}</div>
        </div>
        <hr>
    </c:forEach>

    <script>
        function openChat(classNo) {
            location.href = "showChat?classNo=" + classNo;
        }
    </script>
</body>
</html>