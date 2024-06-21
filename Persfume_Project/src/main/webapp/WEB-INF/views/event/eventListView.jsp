<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이벤트 목록</title>

<style>
    body {
        font-family: 'Arial', sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f8f9fa;
    }
    .content-area,
    .content-area>div:not(.content-main){
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
        line-height: 150px;
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
        flex-wrap: wrap;
        justify-content: space-around;
        margin: 0 auto;
    }

    .event {
        display: flex;
        flex-direction: column;
        width: 600px;
        height: 300px;
        border: 1px solid #e9ecef;
        border-radius: 10px;
        margin: 5px;
        transition: transform 0.3s, box-shadow 0.3s;
        overflow: hidden;
        background-color: #ffffff;
    }
	
    .event:hover {
        cursor: pointer;
        transform: translateY(-10px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .event-img {
        width: 100%;
        height: 200px;
        overflow: hidden;
    }

    .event-img img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

	.event-img.expired img {
        filter: grayscale(100%); /* 이미지를 회색조로 만듦 */
        opacity: 0.7; /* 이미지 투명도 조정 */
    }
	
    .event-title {
        font-size: 20px;
        font-weight: 600;
        text-align: center;
        margin: 10px 0;
        color: #343a40;
    }

    .event-duration {
        text-align: center;
        color: #868e96;
    }

    #event-status {
        display: flex;
        flex-direction: row;
    }

    #event-status a {
        color: black;
        text-decoration: none;
        font-weight: 600;
        margin: 0 10px;
        transition: transform 0.3s, color 0.3s;
    }

    #event-status a:hover {
        transform: scale(1.05);
        color: #007bff;
    }

	#event-status a.selected {
        color: #007bff;
    }
	
    #toEnroll {
        width: 100%;
        max-width: 1400px;
        display: flex;
        justify-content: flex-end;
        margin-bottom: 20px;
    }

    #toEnroll a {
        color: #ffffff;
        background-color: #007bff;
        padding: 10px 20px;
        text-decoration: none;
        border-radius: 5px;
        transition: background-color 0.3s;
        margin-left: auto;
    }

    #toEnroll a:hover {
        background-color: #0056b3;
    }

    #pagingArea {
        width: fit-content;
        margin: auto;
    }

    .pagination {
        display: flex;
        list-style: none;
        padding: 0;
    }

    .pagination li {
        margin: 0 5px;
    }

    .pagination a {
        color: #007bff;
        text-decoration: none;
        padding: 8px 16px;
        border: 1px solid #dee2e6;
        border-radius: 5px;
        transition: background-color 0.3s, color 0.3s;
    }

    .pagination a:hover {
        background-color: #e9ecef;
        color: #0056b3;
    }

    .pagination .active a {
        background-color: #007bff;
        color: #ffffff;
        border: none;
    }

    .pagination .disabled a {
        color: #6c757d;
        pointer-events: none;
    }
</style>
</head>
<body>
    <jsp:include page="../common/header.jsp"/>

    <div class="content-area">
        <div class="content-title" id="home">EVENT</div>
        <div class="content-subtitle">LIST</div>
        <div id="event-status">
            <a id="expired" href="list.ev?condition=expired" class="${ param.condition == 'expired' ? 'selected' : '' }">종료된 이벤트</a>
            <a id="onGoing" href="list.ev?condition=onGoing" class="${ param.condition == 'onGoing' ? 'selected' : '' }">진행중인 이벤트</a>
            <a id="scheduled" href="list.ev?condition=scheduled" class="${ param.condition == 'scheduled' ? 'selected' : '' }">진행예정 이벤트</a>
        </div>
        <br>
        <div class="content-main">
        <c:forEach var="event" items="${ requestScope.list }">
            <div class="event">
                <div class="event-img ${ param.condition == 'expired' ? 'expired' : '' }"> <!-- condition이 '종료된 이벤트'일 때 클래스 추가 -->
                    <input type="hidden" value="${ event.eventNo }">
                    <img src="../persfumeAdmin/${ event.eventImgPath }" alt="${ event.eventTitle }">
                </div>
                <div class="event-title">${ event.eventTitle }</div>
                <div class="event-duration">기간: ${ event.startDate } ~ ${ event.dewDate }</div>
            </div>
        </c:forEach>
    	</div>
    </div>

    <script>
        $(function(){
            $(".event").click(function(){
                let eventNo = $(this).find('input[type="hidden"]').val();
                location.href = "detail.ev?eno=" + eventNo;
            });
        });
    </script>

    <div id="pagingArea">
        <ul class="pagination">
            <c:choose>
                <c:when test="${ requestScope.pi.currentPage eq 1 }">
                    <li class="page-item disabled">
                        <a class="page-link" href="#">이전</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="list.ev?cpage=${ requestScope.pi.currentPage - 1 }">이전</a>
                    </li>
                </c:otherwise>
            </c:choose>

            <c:forEach var="p" begin="${ requestScope.pi.startPage }" end="${ requestScope.pi.endPage }" step="1">
                <c:choose>
                    <c:when test="${ requestScope.pi.currentPage ne p }">
                        <li class="page-item">
                            <a class="page-link" href="list.ev?cpage=${ p }">${ p }</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item active">
                            <a class="page-link">${ p }</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:choose>
                <c:when test="${ requestScope.pi.currentPage eq requestScope.pi.maxPage or requestScope.pi.currentPage eq 1}">
                    <li class="page-item disabled">
                        <a class="page-link" href="#">다음</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link" href="list.ev?cpage=${ requestScope.pi.currentPage + 1 }">다음</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>

	
	
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>