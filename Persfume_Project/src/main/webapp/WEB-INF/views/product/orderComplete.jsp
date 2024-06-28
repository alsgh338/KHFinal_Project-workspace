<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>persfume</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
 
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

    <style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: sans-serif;
         
        }


        .header{
            width: 100%;
            height: 90px;
            position: fixed;
            z-index: 999;
            display: flex;
            justify-content: space-around;
            background-color: rgba(240, 240, 240, 30%);
        }


.container {
    max-width: 700px;
    width: 100%;
    padding: 20px;
    background-color: #ffffff;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    text-align: center;
}

.order-complete h1 {
    color: #27ae60;
    font-size: 2em;
    margin-bottom: 10px;
}

.order-complete p {
    margin-bottom: 20px;
    color: #555;
}

.order-summary, .customer-info {
    text-align: left;
    margin-bottom: 20px;
}

.order-summary h2, .customer-info h2 {
    font-size: 1.5em;
    color: #333;
    margin-bottom: 10px;
}

.order-summary ul, .customer-info ul {
    list-style: none;
    padding: 0;
}

.order-summary li, .customer-info li {
    margin-bottom: 8px;
}

.order-summary li strong, .customer-info li strong {
    display: inline-block;
    width: 100px;
}

.actions {
    display: flex;
    justify-content: center;
    gap: 10px;
}

.button {
    padding: 10px 20px;
    background-color: #2e86de;
    color: white;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s;
}

.button:hover {
    background-color: #1b4f9c;
}

@media (max-width: 600px) {
    .order-summary h2, .customer-info h2 {
        font-size: 1.2em;
    }

    .button {
        padding: 8px 16px;
    }
}



        /* 여기서부턴 공통 스타일? (아마도) */
		.content-area {
		text-align: center;
		}
        .content-title{
            background: url(resources/images/perfume-subtitle.jpg);
            height: 320px;
            background-size: cover;
            background-position: center;
            object-fit: cover;
            text-align: center;
            line-height: 320px;
            font-size: 50px;
        	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
            color: white;
            width: 100%;
        }

  

    

    /* 화살표 버튼색 변경 (기본색은 파란색) */
    div[class^=swiper-button] {
        color : white;
         display : none; 
    }
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />

  
    <div class="content-area">
        <div class="content-title" id="home">Perfume</div>

      <div class="container">
        <div class="order-complete">
            <h1>주문이 완료되었습니다!</h1>
            <p>주문해주셔서 감사합니다. 아래는 주문 정보입니다.</p>
            <div class="order-summary">
                <h2>주문 번호: ${requestScope.od.payCode}</h2><hr>
                <ul>
				 <c:forEach var="o" items="${ requestScope.oplist }" varStatus="status">
			        <li><strong>상품명:</strong>${plist[status.index].productName}</li>
                    <li><strong>수량:</strong>${o.quantity}</li>
                    <li><strong>가격:</strong><fmt:formatNumber value="${o.price}" type="number"/></li>
                    <li><strong>주문 날짜:</strong> ${requestScope.od.orderDate}</li><hr>
        	       </c:forEach>    
                </ul>
            </div>
            <div class="customer-info">
                <h2>고객 정보</h2>
                <ul>
                    <li><strong>주문자명:</strong> ${ sessionScope.loginMember.memName }</li>
                    <li><strong>전화번호:</strong>${requestScope.od.phone}</li>
                    <li><strong>배송주소:</strong>(${requestScope.od.addressNo}) ${requestScope.od.address} </li>
                    <li><strong>요청사항</strong> ${requestScope.od.orderWant}</li>
                </ul>
            </div>
            <div class="actions">
                <a href="myOrder.me?memNo=${ sessionScope.loginMember.memNo }" class="button">마이페이지 </a>
                <a href="list.po" class="button">쇼핑하기</a>
            </div>
        </div>
    </div>
    
    
 </div>

      <jsp:include page="../common/footer.jsp" />
  
<script>
	console.log( ${ sessionScope.loginMember } );
</script>
   




</body>
</html>