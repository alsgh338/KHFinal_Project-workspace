<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

<style>
    body {
        font-family: 'Roboto', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f0f0f0;
        color: #333;
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
        text-shadow: 1px 1px black, -1px 1px black, 1px -1px black, -1px -1px black;
        color: white;
        margin-bottom: 20px;
    }

    #outer {
        width: 1000px;
        margin: auto;
        box-sizing: border-box;
        text-align: center;
    }

    input[type="text"], button {
        padding: 10px;
        margin: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
        box-sizing: border-box;
    }

    button {
        background-color: #4285f4;
        color: white;
        border: none;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    button:hover {
        background-color: #3c78dc;
    }

	#ID{
		width: 300px;
	}

	#email{
		width: 300px;
	}
</style>
</head>
<body>

<jsp:include page="../common/header.jsp" />
<div class="content-title" id="home"></div>
<br><br><br><br>
<div class="content">
    <form action="PWDfind.me" method="post">
        <input type="text" id="ID" name="ID" placeholder="아이디를 입력해주세요"><br>
		<input type="text" id="email" name="email" placeholder="이메일을 입력해주세요"><br><br>

        <button type="submit">비밀번호 찾기</button>
    </form>
</div>

</body>
</html>
