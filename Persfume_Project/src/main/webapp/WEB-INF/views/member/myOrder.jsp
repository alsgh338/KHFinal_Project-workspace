<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:include page="../common/header.jsp" />

<c:forEach var="OrderDetail" items="${orderList}">
    <div>
    	<p>주문번호 : ${OrderDetail.orderNo} </p>
        <p>주문일자 : ${OrderDetail.orderDate} 배송상태 :   ${OrderDetail.deliveryStatus}</p>
        
    </div>
</c:forEach>

<jsp:include page="../common/footer.jsp" />

</body>
</html>