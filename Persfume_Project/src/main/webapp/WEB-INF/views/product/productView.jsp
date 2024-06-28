<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>persfume</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
	body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    width: 80%;
    margin: 20px auto;
    background: #fff;
    padding: 20px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    color: #333;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

table, th, td {
    border: 1px solid #ddd;
}

th, td {
    padding: 12px;
    text-align: center;
}

th {
    background-color: #f2f2f2;
}

tr:nth-child(even) {
    background-color: #f9f9f9;
}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
    <div class="container">
        <h1>상품 목록</h1>
        <table>
            <thead>
                <tr>
                    <th>상품 번호</th>
                    <th>상품명</th>
                    <th>카테고리</th>
                    <th>가격</th>
                    <th>할인</th>
                    <th>등록일</th>
                    <th>성별</th>
                    <th>탑노트</th>
                    <th>미들노트</th>
                    <th>베이스노트</th>
                    <th>재고</th>
                    <th>상태</th>
                </tr>
            </thead>
            <tbody>
                 <c:forEach var="p" items="${ requestScope.list }" varStatus="status">
             <div class="oneday-class" name="${p.productNo}" > 
                 <tr class="oneday-class" name="${p.productNo}" >
                    <td>${p.productNo}</td>
                    <td>${p.productName}</td>
                    <td>${p.category}</td>
                    <td>${p.productPrice}</td>
                    <td>${p.discount}</td>
                    <td>${p.registDate}</td>
                    <td>${p.gender}</td>
                    <td>${p.topNote}</td>
                    <td>${p.middleNote}</td>
                    <td>${p.baseNote}</td>
                    <td>${p.productStock}</td>
                    <td>${p.productStatus}</td>
                </tr>
            </div>
					</c:forEach>
     
                <!-- 더 많은 상품 행을 추가할 수 있습니다 -->
            </tbody>
        </table>
    </div>
    <jsp:include page="../common/footer.jsp" />
    <script>
	$(function() {
		
		$(".oneday-class").click(function() {
		
			let pno = $(this).attr('name');
			
			console.log(pno);
			
			location.href = "http://localhost:8006/persfume/updateProduct.po?pno=" + pno;
		});
	});
	</script>
	
</body>

</html>