<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>

        /* 여기서부턴 공통 스타일? (아마도) */
        .content-area,
        .content-area div:not(.content-main, .class-review *){
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        

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
            
            margin: 5% 0;
            padding: 30px 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 50px;
            border: 3px solid rgba(9,9,121,1);
            border-radius: 30px;
            box-shadow:  15px 25px 10px gray;
        }

        div{
            /* border: 1px solid red; */
        }

        
        .content-main>div:nth-child(1){
            font-size: 50px;
            font-weight: 900;
            color: black;
        }

        .content-main>div:nth-child(2){
            color: white;
            flex-direction: row;
            font-size: 40px;
            font-weight: 900;
            background-color: transparent;
            background: linear-gradient(90deg, rgba(2,0,36,1) 0%, rgba(9,9,121,1) 35%, rgba(0,212,255,1) 100%);
            border-radius: 30px;
            padding: 10px 50px;
        }

        .content-main>div:nth-child(3){
            gap: 30px;
            font-size: 25px;
            width: 60%;
        }

        .content-main>div:nth-child(3)>div{
            width: 100%;
            flex-direction: row;
            justify-content: space-between;
            border-bottom: 3px dotted lightgray;
        }
        .content-main>div:nth-child(3)>div>div:nth-child(1){
            font-weight: 800;
            font-size: 35px;
        }

        
        
        .content-main>div:nth-child(4){
            flex-direction: row;
            gap: 20px;        
        }

        .content-main>div:nth-child(4)>button{
            color: blue;
            font-weight: 700;
            font-size: 15px;
            border-radius: 10px;
            padding: 10px;
            background-color: white;
            transition: all .3s ease;
            
        }

        .content-main>div:nth-child(4)>button:nth-child(1){
            background-color: rgba(9,9,121,1);
            color: white;
        }

        .content-main>div:nth-child(4)>button:nth-child(2){
            color: rgba(9,9,121,1);
            background-color: white;
        }

        .content-main>div:nth-child(4)>button:hover{
            cursor: pointer;
        }



    </style>

</head>



<body>

	<jsp:include page="../common/header.jsp"/>

    <div class="content-area">
        <div class="content-title" id="home">ONEDAY CLASS</div>
        <div class="content-subtitle">RESERVATION CHECK</div>
        <div class="content-main">
			<div>예약 완료</div>
            <div>주문 번호 - <span>${ requestScope.ocr.registNo} </span> </div>

            <div>
                <div>
                    <div>Class</div>
                    <div>${ requestScope.oc.className} - ${ requestScope.oc.classTeacher}</div>
                </div>
                <div>
                    <div>Date</div>
                    <div>${ requestScope.oc.startDate} ${ requestScope.oc.startTime } - ${ requestScope.oc.endTime }</div>
                </div>
                <div>
                    <div>예약자 정보</div>
                    <div>
                    	<%-- ${ sessionScope.loginUser.memName}  --%>
                    	안해준
                    	등 ${ requestScope.ocr.registPersonNo }명
                   	</div>
                </div>
                <div>
                    <div>결제 금액</div>
                    <div><fmt:formatNumber value="${requestScope.ocr.registPrice}" type="number" groupingUsed="true" /> 원</div>
                </div>
            </div>

            <div>
                <button type="button" onclick="afterReservation('class')">클래스 목록 돌아가기</button>
                <button type="button" onclick="afterReservation('myList')">나의 신청 목록가기</button>
            </div>
        </div>
    </div>
    
   	<jsp:include page="../common/footer.jsp"/>
    
    <script>
    
    	function afterReservation(dest) {
    		
    		if(confirm("클래스 단체 채팅방에 참여하시겠습니까?")){
    			$.ajax({
					url : "enrollChat.ct",
					type : "post",
					data : {
						ocrno : "${requestScope.ocr.registNo}"
					},
					success : function(result) {
						// 성공시 
						console.log("일단1");
						if(result == "success"){
							const message = "채팅방 입장하였습니다.";
	    	    		        window.alert(message);
						} else {
							const message2 = "채팅방 입장에 실패하였습니다. 관리자에게 문의해주세요.";
			            	window.alert(message2);
						}
	    				 
					},
					error : function() {
						const message2 = "채팅방 입장에 실패하였습니다. 관리자에게 문의해주세요.";
		            	window.alert(message2);
					}
				});
    		}
    		
    		if(dest == "class"){
    			location.href="list.oc";
    		} else{
    			location.href="";
    		}
    		
			
		}
    	
    </script>
    
    
</body>
</html>