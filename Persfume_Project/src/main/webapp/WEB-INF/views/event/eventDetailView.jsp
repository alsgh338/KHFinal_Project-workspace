<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <div class="content-subtitle">(이벤트 상세내용)</div>
        <div class="content-main">
        
        	<div id="event-detail">
        		<img src="resources/images/images.jpg" alt="">
				<div id="hidden"></div>
        	</div>
	        
			
        </div>
    </div>

	
	
	
	<jsp:include page="../common/footer.jsp"/>

	<script>
	
	
	</script>
</body>
</html>