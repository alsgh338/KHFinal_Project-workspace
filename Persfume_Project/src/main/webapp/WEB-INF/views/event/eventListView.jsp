<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
       .content-area,
        .content-area>div:not(.content-main){
          display: flex;
          flex-direction: column;
          justify-content: center;
          align-items: center;
        }

        /* 여기서부턴 공통 스타일? (아마도) */

        .content-title{
            height: 320px;
            background: url(resources/images/class_title.jpg);
            background-size: cover;
            background-position: center;
            object-fit: cover;
            text-align: center;
            line-height: 320px;
            font-size: 50px;
            text-shadow: 1px 1px black, -1px 1px black, 1px -1px black, -1px -1px black;
            color: white;
            width: 100%;
        }

        .content-subtitle,
        .content-main
        {
            width: 1400px;
        }
        

        .content-subtitle{
            line-height: 150px;
            font-size: 30px;
            font-weight: 600;
        }

        .content-main{
            display: inline-block;
            text-align: center;
        }

        /* 여기서부턴 개별 스타일? (아마도) */
		
		.event{
            display: inline-block;
            width: 600px;
            height: 200px;
             border: 1px solid blue; 
            margin: 15px 15px;
            transition: all .5s ease;
        }

		.event>.event-img{
            width: 100%;
            height: 100%;
        }
        
        .event:hover{
        	cursor: pointer;
        }
        
        .event>.event-img>img{
            width: 100%;
            height: 100%;
            object-fit: cover;
            /*border-radius: 10px;*/
        }
        
        #event-status {
			display: flex;
			flex-direction: row;
		}
		
		#event-status div {
			border: 1px solid black;
			margin: 2px;
		}
		
		#event-status div:hover {
        	cursor: pointer;
		}
        
        #pagingArea {width:fit-content; margin:auto;}
        
</style>


</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
    <div class="content-area">
        <div class="content-title" id="home">EVENT</div>
        <div class="content-subtitle">LIST</div>
        <div id="event-status">
        	<div id="status-left" onclick="">진행중인 이벤트</div>
        	<div id="status-right" onclick="">종료된 이벤트</div>
        </div>
        
        <a href="enrollForm.ev">이벤트 작성창으로 이동(임시)</a>
        
        
        <div class="content-main">
        
        	<c:forEach var="event" items="${ requestScope.list }">
				<div class="event">
					<div class="event-img">
						<input type="hidden" value="${ event.eventNo }">
						<img src="${ event.eventImgPath }" alt="">
					</div>
					<div>${ event.eventTitle }</div>
					<div>기간 : ${ event.startDate } ~ ${ event.dewDate }</div>
			</div>
			</c:forEach>
	        <!-- sysdate 가 시작일과 종료일 사이라면 진행중인 이벤트 -->
			<!-- sysdate 가 종료일보다 늦을 경우 종료된 이벤트 -->
			
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
					<a class="page-link" href="#">Previous</a>
					</li>
				</c:when>
				<c:otherwise>
				<li class="page-item">
					<a class="page-link" href="list.ev?cpage=${ requestScope.pi.currentPage - 1 }">Previous</a>
					</li>
				</c:otherwise>
			</c:choose>

			<c:forEach var="p" begin="${ requestScope.pi.startPage }"
						end="${ requestScope.pi.endPage }" step="1">
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
			<c:when test="${ requestScope.pi.currentPage eq requestScope.pi.maxPage }">
				<li class="page-item disabled">
					<a class="page-link" href="#">Next</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="page-item">
					<a class="page-link" href="list.ev?cpage=${ requestScope.pi.currentPage + 1 }">Next</a>
				</li>
			</c:otherwise>
			</c:choose>
		</ul>
	</div>
            
            
	<jsp:include page="../common/footer.jsp"/>
            
</body>
</html>