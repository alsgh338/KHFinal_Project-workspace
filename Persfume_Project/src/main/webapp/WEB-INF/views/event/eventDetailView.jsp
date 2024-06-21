<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 상세 정보</title>

<style>
    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f8f9fa;
    }

    .content-area,
    .content-area > div:not(.content-main) {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }

    .content-title {
        height: 320px;
        background: url(resources/images/event-header.jpg) no-repeat center center;
        background-size: cover;
        text-align: center;
        line-height: 320px;
        font-size: 50px;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
        color: white;
        width: 100%;
        margin-bottom: 20px;
    }

    .content-subtitle {
        width: 100%;
        max-width: 1400px;
        line-height: 120px;
        font-size: 30px;
        font-weight: 600;
        text-align: center;
        color: #343a40;
        margin-bottom: 20px;
    }

    .content-main {
        width: 100%;
        max-width: 1400px;
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
    }

    #event-info {
        display: flex;
        flex-direction: row;
        justify-content: center;
        margin-bottom: 20px;
        color: #868e96;
    }

    #event-info div {
        margin: 0 20px;
        font-size: 18px;
        line-height: 80px;
    }

    #event-detail {
        width: 100%;
        max-width: 1400px;
        border: 1px solid #dee2e6;
        border-radius: 10px;
        overflow: hidden;
        background-color: #ffffff;
        padding: 20px;
        margin-bottom: 20px;
    }

    #event-detail img {
        width: 100%;
        max-width: 1000px;
        border: none;
        border-radius: 10px;
    }

    #hidden {
        height: 200px;
    }

    #back-to-list {
        width: fit-content;
        margin: auto;
        text-align: center;
        margin-top: 20px;
    }

    #back-to-list a {
        color: #ffffff;
        background-color: #007bff;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    #back-to-list a:hover {
        background-color: #0056b3;
    }

</style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>
    
    <div class="content-area">
        <div class="content-title" id="home">EVENT</div>
        <div class="content-subtitle">${ requestScope.e.eventTitle }</div>
        
        <!-- 상세 정보 -->
        <div id="event-info">
            <div class="event-term">기간 : ${ requestScope.e.startDate } ~ ${ requestScope.e.dewDate }</div>
            <div class="count">조회수 : ${ requestScope.e.eventCount }</div>
        </div>
        
        <div class="content-main">
            <div id="event-detail">
                <img src="../persfumeAdmin/${ requestScope.e.eventImgPath }" alt="${ requestScope.e.eventTitle }">
                <div id="hidden"></div>
            </div>
        </div>
        
        <!-- 목록으로 돌아가기 버튼 -->
        <div id="back-to-list">
            <a href="list.ev?condition=onGoing">목록으로 돌아가기</a>
        </div>
    </div>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>