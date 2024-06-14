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

<c:forEach var="productReview" items="${reviewList}">
    <div>
        <p>${productReview.reviewContent}</p>
    </div>
</c:forEach>

<jsp:include page="../common/footer.jsp" />

    <script>

    </script>
</body>
</html>