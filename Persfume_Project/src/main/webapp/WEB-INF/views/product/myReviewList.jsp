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
.container {
    width: 80%;
    max-width: 600px;
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    margin-bottom: 20px;
    color: #333;
}

.coupon-list {
    display: flex;
    flex-direction: column;
    gap: 20px;
}

.coupon-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px;
    background-color: #f9f9f9;
    border-radius: 8px;
    border: 1px solid #ddd;
}

.coupon-info {
    flex-grow: 1;
}

.coupon-title {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 5px;
    color: #0073e6;
}

.coupon-description {
    font-size: 14px;
    margin-bottom: 10px;
    color: #555;
}

.coupon-expiry {
    font-size: 12px;
    color: #999;
}

.coupon-code {
    font-size: 16px;
    font-weight: bold;
    color: #333;
    background-color: #e7f1ff;
    padding: 10px;
    border-radius: 5px;
}
    .content-area {
		text-align: center;
		}
        .content-title{
            height: 190px;
            background: url(resources/images/perfume-subtitle.jpg);
            background-size: cover;
            background-position: center;
            object-fit: cover;
            text-align: center;
            line-height: 230px;
            font-size: 50px;
            text-shadow: 1px 1px black, -1px 1px black, 1px -1px black, -1px -1px black;
            color: white;
            width: 100%;
        }
</style>

</head>
<body>
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
            <h1>나의 리뷰 목록</h1>
        
            <table class="order-table">
                <thead>
                    <tr>
                        <th>주문 번호</th>
                        <th>상품 이미지</th>
                        <th>리뷰 내용</th>
                        <th>리뷰 작성일</th>
                        <th>리뷰별점</th>
                  
                     
                        
                    </tr>
                </thead>
                <tbody>
                	 <c:forEach var="re" items="${ requestScope.relist }" varStatus="status">
                    <tr>
                        <td>${re.reviewNo}</td>
                        <td><img src="${re.reviewImgPath}" /></td>
                        <td>${re.reviewContent}</td>
                        <td>${re.reviewDate}</td>
                      <td>${re.reviewRating}</td>
                      
                </tr>
						</c:forEach>
                   
                      
                       
             
             
                 
              
                </tbody>
            </table>
         
        </div>
        

        

    </div>
 

  <jsp:include page="../common/footer.jsp" />
  
</body>
</html>