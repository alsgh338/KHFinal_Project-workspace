<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
    <form action="IDfind.me" method="post">
    가입 시 입력했던 이메일을 입력해주세요 : <input type="text" id="email" name="email">

    <button type="submit">아이디 찾기</button> <br><br>

    아이디 : <input type="text" id="ID" name="findID" value="${ sessionScope.ID }"> 
    </form>
</div>

</body>
</html>