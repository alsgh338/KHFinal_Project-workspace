<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    .font {
        font-family: "Nanum Gothic", sans-serif;
    }
    
    .content-title {
        height: 320px;
        background-color: #0c263f;
        background-size: cover;
        background-position: center;
        object-fit: cover;
        text-align: center;
        line-height: 320px;
        font-size: 50px;
        text-shadow: 1px 1px black, -1px 1px black, 1px -1px black, -1px -1px
            black;
        color: white;
        width: 100%;
    }
    
    .content-subtitle, .content-main {
        width: 1400px;
    }
    
    .content-subtitle {
        line-height: 150px;
        font-size: 30px;
        font-weight: 600;
    }
    
    .content-main {
        display: inline-block;
        text-align: center;
    }
    
    #outer {
        width: 1000px;
        /* border: 1px solid red; */
        margin: auto;
        box-sizing: border-box;
        text-align: center; /* 버튼을 가운데로 정렬하기 위한 설정 */
    }
    /* 여기서 부터 myPagelist css */
    
     #myPagelist{
        display: flex;
        list-style-type: none; /* 기본 목록 스타일 제거 */
        padding: 0;
        margin: 0;
        justify-content: space-around;
        width: 100%;
    }
    
	#myPagelist a{
		text-align: center;
		text-decoration: none;
	}

    #myPagelist li {
        display: flex;
        align-items: center;
        justify-content: center;
        text-align: center;
        margin-right: 10px; /* 각 항목 간 간격 추가 */
        height: 50px; /* 필요에 따라 높이 조정 */
        font-size: 20px;
        position:relative;
        
    }


    #nav-btn{
        width: 70%;
        display: flex;
        align-items: center;
    }

    #myPagelist a::after {
        content: "";
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 0;
        height: 4px;
        background: rgba(217, 93, 48, 1)/*#D95D30*/;
        transition: all .5s ease-out;
    }

    #myPagelist a:hover::after {
        width: 100%;
    }

    #mem_info input {
	box-sizing: border-box;
    }

    #mem_info2 input {
        box-sizing: border-box;
    }
    #mem_info2 th {
	text-align: center;
	padding: 20px;
	background-color: aliceblue;
	color: grey;
	font-size: 15px;
    }

    .table_css {
	width: 100%;
	box-sizing: border-box;
	border-spacing: 0;
    }

    #mem_info2 input {
	box-sizing: border-box;
    }

    .table_css {
        width: 100%;
        box-sizing: border-box;
        border-spacing: 0;
    }

    .table_css fieldset {
        box-sizing: border-box;
    }

    .table_css input {
        box-sizing: border-box;
        border: 1px solid lightgray;
        border-radius: 4px;
        padding: 5px; /* 입력 필드 안의 패딩 */
    }

    .table_css td {
        padding: 20px;
    }

    
    </style>

</head>
<body>

<jsp:include page="../common/header.jsp" />
<div class="content-area">
	<div class="content-title" id="home">WELCOME</div>
<div id="outer">
    <ul id="myPagelist">
        <li>
            <a href="/persfume/myPage.me">내 정보 조회</a>
        </li>
        <li>
            <a id="Review" href="" onclick="reviewGo(); return false;">내 리뷰 조회</a>
            <form method="post" action="myReview.me" id="myReviewForm">
                <input type="hidden" name="memNo" value="${ sessionScope.loginMember.memNo }">
            </form>
        </li>
        <li>
            <a id="Like" href="" onclick="likeGo(); return false;">내 찜목록 조회</a>
            <form method="post" action="myLike.me" id="myLikeForm">
                <input type="hidden" name="memNo" value="${ sessionScope.loginMember.memNo }">
            </form>
        </li>
        <li>
            <a id="order" href="" onclick="orderGo(); return false;">내 주문목록(배송상태)</a>
            <form method="post" action="myOrder.me" id="myOrderForm">
                <input type="hidden" name="memNo" value="${ sessionScope.loginMember.memNo }">
            </form>
        </li>
        <li>
            <a id="class" href="" onclick="classGo(); return false;">클래스 예약조회</a>
            <form method="post" action="myClass.me" id="myClassForm">
                <input type="hidden" name="memNo" value="${ sessionScope.loginMember.memNo }">
            </form>
        </li>
    </ul>
<c:forEach var="OrderDetail" items="${orderList}">
    <table id="mem_info2" class="table_css" border="1">
        <tr>
            <th >주문번호</th>
            <td>
                ${OrderDetail.orderNo}
            </td>
        </tr>
        <tr>
            <th>주문일자</th>
            <td>${OrderDetail.orderDate}</td>
        </tr>
        <tr>
            <th>배송상태</th>
            <td>${OrderDetail.deliveryStatus}</td>
        </tr>
    </table>
    <br><br>
</c:forEach>
</div>
</div>

<jsp:include page="../common/footer.jsp" />

<script>
  function likeGo() {
                
                console.log("likeGO야 실행 돼?");
                
                $("#myLikeForm").submit();

            }
		
    function orderGo() {
        
        console.log("orderGO야 실행 돼?");
        
        $("#myOrderForm").submit();

    }

    function classGo() {
        
        console.log("classGO야 실행 돼?");
        
        $("#myClassForm").submit();

    }
		
		
    function reviewGo() {
        $("#myReviewForm").submit();
    }
    
    function deleteMem() {

        let url = "delete.fo"

        $("#deleteMem").attr("href", url);
    }

</script>

</body>
</html>