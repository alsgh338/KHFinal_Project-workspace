<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 변경</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f1f1f1;
        margin: 0;
        padding: 0;
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
  black;
        color: white;
        width: 100%;
        margin-bottom: 20px;
        
    }

    #outer {
        max-width: 1000px;
        margin: auto;
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    #updatePwdformDiv {
        max-width: 500px;
        margin: auto;
        padding: 20px;
        background-color: #ffffff;
        /* box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); */
        border-radius: 5px;
        text-align: center;
    }

    #loginform {
        padding: 20px;
        /* border: 1px solid #e0e0e0; */
        border-radius: 5px;
        /* background-color: #f9f9f9; */
    }

    input[type="text"], input[type="password"] {
        width: calc(100% - 20px);
        padding: 10px;
        margin: 8px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        font-size: 16px;
    }

    button[type="submit"] {
        background-color: #4285f4;
        color: white;
        width: 100%;
        padding: 12px 20px;
        margin: 10px 0;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 16px;
    }

    button[type="submit"]:hover {
        background-color: #357ae8;
    }

    @media only screen and (max-width: 600px) {
        .content-title {
            font-size: 40px;
        }
        input[type="text"], input[type="password"], button[type="submit"] {
            width: 100%;
        }
    }
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<div class="content-title">비밀번호 변경</div>
<div id="outer">
    <div id="updatePwdformDiv">
        <form action="updatePwd.me" method="post" id="loginform">
            현재 비밀번호를 입력하세요 : <input type="text" id="randomPwd" name="randomPwd"><br><br>
            새로운 비밀번호를 입력하세요 : <input type="password" id="newPwd" name="newPwd">

            <input type="hidden" name="memNo" value="${ sessionScope.loginMember.memNo }">
            <input type="hidden" name="memPwd" value="${ sessionScope.loginMember.memPwd }">
            <br>
            <button type="submit">비밀번호 변경</button>
        </form>
    </div>
</div>
</body>
</html>
