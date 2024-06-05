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
            line-height: 120px;
            font-size: 30px;
            font-weight: 600;
        }
		
        .content-main{
            display: inline-block;
            text-align: center;
        }

        /* 여기서부턴 개별 스타일? (아마도) */
        
		#event-info{
			display: flex;
			flex-direction: row;
		}
		
		#event-info div{
			line-height: 80px;
		}
        
		#event-detail {
			width: 100%;
			align-items: center;
			border: 1px solid black; 
		}
		
		#event-detail>img {
			width: 70%;
			align-items: center;
			border: 1px solid black; 
		}
		
		#hidden {
			height: 200px;
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
        	<div class="event-term">기간 : ${ requestScope.e.startDate } ~ ${ requestScope.e.dewDate }</div>&emsp;&emsp;
        	<div class="count">조회수 : ${ requestScope.e.eventCount }</div>
        </div>
        
        <div class="content-main">
        
        	<div id="event-detail">
        		<img src="${ requestScope.e.eventImgPath }" alt="">
				<div id="hidden"></div>
        	</div>
	        
			
        </div>
    </div>

	
	
	
	<jsp:include page="../common/footer.jsp"/>

	<script>
	
	
	</script>
</body>
</html>