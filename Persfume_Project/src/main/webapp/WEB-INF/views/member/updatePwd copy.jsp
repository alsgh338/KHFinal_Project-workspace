<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>persfume</title>

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

    
    #ID{
        padding-left: 15px;
    }

    #updatePwdformDiv{
        width: 500px;
        height: 200px;
        margin: auto;
    }

    #loginform{
        width: 100%;
        height: 100%;
        margin: auto;
        border : solid;
        padding-top: 40px;
    }

    #update_btn {
        background-color: #0c263f;
        color: white;
        width: 150px;
        height: 32px;
        margin-top: 10px;
        border-radius: 5px;
        box-sizing: border-box;
        display: inline-block;
    }

    
    </style>

</head>
<body>
    <jsp:include page="../common/header.jsp" />
<div class="content-title" id="home"></div>
<div id="outer">
    <div id="updatePwdformDiv">
        <form action="updatePwd.me" method="post" id="loginform">
        &nbsp; &nbsp; 현재 비밀번호를 입력하세요 : <input type="text" id="randomPwd" name="randomPwd">
        <br><br>
        새로운 비밀번호를 입력하세요 : <input type="password" id="newPwd" name="newPwd">

        <input type="hidden" name="memNo" value="${ sessionScope.loginMember.memNo }">
        <input type="hidden" name="memPwd" value="${ sessionScope.loginMember.memPwd }">
        <br>
        <button type="submit" id="update_btn">비밀번호 변경</button>
        </form>
    </div>
</div>
</body>
</html>