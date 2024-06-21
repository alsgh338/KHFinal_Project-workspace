<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
body {
    font-family: 'Noto Sans KR', sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.wrapper {
    display: flex;
}

.sidebar {
    width: 250px;
    background-color: #2e86de;
    padding: 20px;
    color: #fff;
    min-height: 100vh;
}

.sidebar h2 {
    text-align: center;
    margin-bottom: 20px;
    font-size: 1.5em;
}

.sidebar ul {
    list-style: none;
    padding: 0;
}

.sidebar ul li {
    margin-bottom: 10px;
}

.sidebar ul li a {
    color: #fff;
    text-decoration: none;
    display: block;
    padding: 10px;
    border-radius: 4px;
    transition: background-color 0.3s;
}

.sidebar ul li a:hover {
    background-color: #1b4f9c;
}

.container {
    flex-grow: 1;
    max-width: 900px;
    margin: 50px auto;
    padding: 20px;
    background-color: #ffffff;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    margin-bottom: 20px;
    color: #333;
    font-size: 1.8em;
    font-weight: 700;
}

.order-table {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
    font-size: 1em;
}

.order-table th, .order-table td {
    border: 1px solid #dddddd;
    text-align: center;
    padding: 12px 8px;
}

.order-table th {
    background-color: #2e86de;
    color: white;
}

.order-table tr:nth-child(even) {
    background-color: #f9f9f9;
}

.order-table tr:hover {
    background-color: #f1f1f1;
    transition: background-color 0.2s;
}

.order-table td {
    color: #555;
}

@media (max-width: 600px) {
    .sidebar {
        width: 100%;
        min-height: auto;
        padding: 10px;
    }

    .sidebar h2 {
        font-size: 1.2em;
    }

    .container {
        max-width: 100%;
        margin: 20px 0;
    }
}
</style>
  

</head>
    <jsp:include page="../common/header.jsp" />   
 
    
    
 <div class="wrapper">
        <nav class="sidebar">
            <h2>메뉴</h2>
            <ul>
                <li><a href="#">홈</a></li>
                <li><a href="#">카테고리</a></li>
                <li><a href="#">나의 주문 내역</a></li>
                <li><a href="#">장바구니</a></li>
                <li><a href="#">계정 정보</a></li>
                <li><a href="#">고객센터</a></li>
            </ul>
        </nav>
        <div class="container">
            <h1>관리자 배송 시스템</h1>
            <table class="order-table">
                <thead>
                    <tr>
                        <th>주문 번호</th>
                        <th>상품명</th>
                        <th>수량</th>
                        <th>가격</th>
                        <th>주문 날짜</th>
                        <th>배송 상태</th>
                        <th>택배 발송</th>
                    </tr>
                </thead>
                <tbody>
                	 <c:forEach var="op" items="${ requestScope.oplist }" varStatus="status">
                    <tr>
                        <td>${op.odId}</td>
                        <td>${plist[status.index].productName}</td>
                        <td>${op.quantity}</td>
                        <td>${op.price}</td>
                      
                        <c:forEach var="od" items="${ requestScope.odlist }" varStatus="status">
                          <c:choose>
                     		   <c:when test="${op.orderNo == od.orderNo}"><td>${od.orderDate}</td>
          
                     		    <c:if test="${od.deliveryStatus eq 'Y'}"> <td>배송완료</td></c:if>
               					<c:if test="${od.deliveryStatus eq 'N'}"><td>배송준비</td></c:if> 
	                                   <c:if test="${od.deliveryStatus eq 'Y'}"> <td><a href="orderdelivery.po?odId=${op.odId}&pno=${op.productNo}&mno=${od.memNo}&ono=${od.orderNo}" onclick="del();">택배 발송</a></td></c:if> 
	                                   <c:if test="${od.deliveryStatus eq 'N'}">   </c:if>                    
                     		   </c:when>

                     	  </c:choose>
						</c:forEach>
                   
                      
                       
                    </tr>
                    </c:forEach>
                 
                    <!-- 추가 주문 내역은 여기에 -->
                </tbody>
            </table>
        </div>
        
     
        
        
    </div>
<script>
function del(){
	window.alert("택배 발송 완료");
	
}
</script>
  <jsp:include page="../common/footer.jsp" />
  
</body>
</html>