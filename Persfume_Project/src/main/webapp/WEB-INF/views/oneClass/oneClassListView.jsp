<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
       /* div:not(#header, #header *, .oneday-class, .content-main, .oneday-class *){
          display: flex;
          flex-direction: column;
          justify-content: center;
          align-items: center;
        } */
        
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

        .oneday-class{
            display: inline-block;
            width: 400px;
            height: 600px;
            /* border: 1px solid blue; */
            margin: 15px 15px;
            transition: all .5s ease;
        }

        .onHover{
            cursor: pointer;
            border-radius: 10px;
            border-color: rgba(0, 0, 0, 0.2);
            opacity: 85%;
            transform: scale(1.04);
            box-shadow: 0 19px 38px rgba(0,0,0,0.30), 0 15px 12px rgba(0,0,0,0.22);
        	/* box-shadow: 0 4px 8px rgba(0,0,0,0.2); */
        }

        .oneday-class *:not(.class-teacher *) {
            /* border: 1px solid green; */
        }

        .oneday-class>.class-img{
            width: 100%;
            height: 60%;
        }

        .oneday-class>.class-img>img{
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 10px;
        }

        .oneday-class>.class-title{
            height: 20%;
            line-height: 90px;
            font-size: 35px;
        }

        .oneday-class .class-price{
            font-size: 25px;
            text-align: right;
        }

        .oneday-class .class-teacher{
            font-size: 15px;
            line-height: 35px;
            display: flex;
            flex-direction: row;
            justify-content: start;
            align-items: center;
            margin-left: 5px;
            gap: 10px;
        }

        .oneday-class .class-teacher>div{
            width: 30px;
            height: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .oneday-class .class-teacher>div>img{
            width: 100%;
            height: 100%;
            border-radius: 50%;
            object-fit: cover;
        }

        .oneday-class .class-location{
            background-color: rgb(120, 206, 235);
            color: white;
            border-radius: 5px;
            font-size: 15px;
            font-weight: 700;
        }

        .oneday-class .class-data{
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
            height: 10%;
        }
        
        #oneclass-not-found{
        	color: blue;
        	font-size: 40px;
        	font-weight: 800;
        	margin : 100px 0;
        }
        #oneclass-not-found>img{
        	width: 200px;
        	height: 200px;
        	object-fit: cover;
        }
        
        #pagingArea {width:fit-content; margin:auto;}

</style>


</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
    <div class="content-area">
        <div class="content-title" id="home">ONEDAY CLASS</div>
        <div class="content-subtitle">LIST</div>
        <div class="content-main">
            <c:choose>
            	<c:when test="${ empty requestScope.list}">
   	            	<div id="oneclass-not-found">
   	            		<img alt="힝..." src="resources/images/error-sad.png"> <br>
		            	클래스가 존재하지 않습니다.
	            	</div>
            	</c:when>
            	
            	<c:otherwise>        
		            <c:forEach var="oc" items="${ requestScope.list }">
			            <div class="oneday-class">
				            <input type="hidden" value="${ oc.classNo }">
			                <div class="class-img">
			                    <img src= "${pageContext.request.contextPath}/../persfumeAdmin/${oc.thumbnailImg}" alt="쌈네일">
			                </div>
			
			                <div class="class-data">
			                    <div class="class-teacher">
			                        <div class="teacher-img">
			                            <img src="resources/images/person-circle.svg" alt="강사">
			                        </div>
			                        ${oc.classTeacher} 강사
			                    </div>
			                    <div class="student_cnt">인원 : ${oc.currentStudent} / ${oc.studentMaxNo}</div>
			                </div>
			                
			                <div class="class-title">${oc.className}</div>
			
			                <div class="class-data">
			                    <div class="class-location">사랑시 고백구 행복동</div>
			                    <div class="class-price">${oc.price}원</div>
			                </div>
			            </div>
		            
		            
		            </c:forEach>
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
		                    		<a class="page-link" 
		                    		   href="list.oc?cpage=${ requestScope.pi.currentPage - 1 }">
		                    			Previous
		                    		</a>
		                    	</li>
		                    </c:otherwise>
		                    </c:choose>
		                    
		                    <c:forEach var="p" begin="${ requestScope.pi.startPage }"
		                    		   end="${ requestScope.pi.endPage }"
		                    		   step="1">
		                    	
		                    	<c:choose>	   
		                    	<c:when test="${ requestScope.pi.currentPage ne p }">
		                    		<li class="page-item">
				                    	<a class="page-link" href="list.oc?cpage=${ p }">
											${ p }
										</a>
				                    </li>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<li class="page-item active">
				                    	<a class="page-link">
											${ p }
										</a>
				                    </li>
		                    	</c:otherwise>
			                    </c:choose>
		                    </c:forEach>
		                    
		                    <c:choose>
		                    <c:when test="${ requestScope.pi.currentPage eq requestScope.pi.maxPage }">
			                    <li class="page-item disabled">
			                    	<a class="page-link" href="#">
			                    		Next
			                    	</a>
			                    </li>
		                    </c:when>
		                    <c:otherwise>
			                    <li class="page-item">
			                    	<a class="page-link" 
			                    	   href="list.oc?cpage=${ requestScope.pi.currentPage + 1 }">
			                    		Next
			                    	</a>
			                    </li>
			                </c:otherwise>
		                    </c:choose>
		                </ul>
		            </div>
               	</c:otherwise>
            </c:choose>
        </div>
    </div>

    <script>
        $(function(){
            $(".oneday-class").hover(function(){
                $(this).toggleClass("onHover");
            });
            
            $(".oneday-class").on("click",function(){
            	let ocno = $(this).children().eq(0).val();
            	location.href = "detail.oc?ocno=" + ocno;
            });

        });


    </script>
	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>