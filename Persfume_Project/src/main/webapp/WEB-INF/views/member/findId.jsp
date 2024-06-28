<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Google Style Page</title>

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

<!-- CSS Styles -->
<style>
    body {
        font-family: 'Roboto', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f0f0f0;
        color: #333;
    }

    .header {
        background-color: #4285f4;
        color: white;
        padding: 10px;
        text-align: center;
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
        margin-bottom: 20px;
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

    .button:hover {
        background-color: #3c78dc;
    }
</style>
</head>

<body>
    <jsp:include page="../common/header.jsp" />
<div class="content-title" id="home"></div>
<br><br><br><br>
<div class="content">
    <form action="IDfind.me" method="post">
        <label for="email"></label><br>
        <input type="text" id="email" name="email" class="input-box" required placeholder="가입시 작성했던 이메일을 입력해주세요"><br>


        <input type="text" id="ID" name="findID" value="${ sessionScope.ID }" class="input-box" readonly placeholder="아이디"> <br><br>
        <button type="submit" class="button">아이디 찾기</button><br><br>
    </form>
</div>

</body>
</html>
