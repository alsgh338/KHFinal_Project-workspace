<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
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

    
	#classList{
		display: flex;
		justify-content: center;
		align-items: center;
		margin: 50px 0;
	}

	#classList img{
		width: 500px;
		height: 500px;
		object-fit: cover;
	}
	
	#classList>table td>img{
		width: 50px;
		height: 50px;
		object-fit: cover;
	}
    
    /* 여기서 부터 MypageList css */
    
	#myPagelist{
        display: flex;
        list-style-type: none; /* 기본 목록 스타일 제거 */
        padding: 0;
        margin-top: 20px;
        justify-content: space-around;
        width: 100%;
    }

	#myPagelist a{
		text-align: center;
		text-decoration: none;
		color: #1c4469;
		font-weight: 800;
	}

    #myPagelist li {
    	position:relative;
        display: flex;
        align-items: center;
        justify-content: center;
        text-align: center;
        margin-right: 10px; /* 각 항목 간 간격 추가 */
        height: 50px; /* 필요에 따라 높이 조정 */
        font-size: 20px;
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
                    <a id="class" href="" onclick="couponGo(); return false;">내 쿠폰 조회</a>
                    <form method="post" action="myCoupon.me" id="myCouponForm">
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
            
            
            <div id="classList">
                <c:choose>
                    <c:when test="${empty requestScope.flist}">
                        <div id="oneclass-not-found">
                            <img alt="힝..." src="resources/images/error-sad.png"> <br>
                            <h1>찜 목록이 존재하지 않습니다.</h1>
                        </div>
                    </c:when>
                    <c:otherwise>
	                    
	                    <table class="table">
					    	<tr>
					    		<th>번호</th>
					    		<th width="250">상품 이미지</th>
					    		<th width="150">상품 이름</th>
					    		<th width="150">상품 가격</th>
					    		<th width="100">상품 재고</th>
					    		<th width="120">상세 보기</th>
					    		<th width="120">상품 제거</th>
					    	</tr>
					    	<tr>
								<c:forEach var="i" begin="0" end="${fn:length(flist) - 1}">
								    <td>
								        ${i + 1}
								    </td>
								    <td>
								    	<img alt="${requestScope.pilist[i].productImgPath}" src="${pageContext.request.contextPath}/../persfumeAdmin/${requestScope.pilist[i].productImgPath}">
								    </td>
								    <td>
								        ${plist[i].productName}
								    </td>
								    <td>
								        ${plist[i].productPrice}
								    </td>
								    <td>
								        ${plist[i].productStock}
								    </td>
								    	
								    <td>
								        <div class="btn btn-sm btn-info" onclick="location.href = 'detail.po?pno='+ ${plist[i].productNo}">
								        	상품 보기
								        </div>
								    </td>
								    <td>
			                       		<form method="post" action="delFavorite.me" id="likeForm">
                    						<input type="hidden" name='productNo' value="${plist[i].productNo}">
                    						<input type="hidden" name='memNo' value="${sesssionScope.loginMember.memNo}">
									        <div class="btn btn-sm btn-danger" onclick="$('#likeForm').submit();">
									        	상품 제거
									        </div>
					                    </form>
								    </td>
								    
								</c:forEach>
					    	</tr>
					    
					    </table>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    
        
        
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

        function couponGo() {
            
            console.log("classGO야 실행 돼?");
            
            $("#myCouponForm").submit();

        }
            
            
        function reviewGo() {
            $("#myReviewForm").submit();
        }
        
        function deleteMem() {
    
            let url = "delete.fo"
    
            $("#deleteMem").attr("href", url);
        }

    </script>

    <jsp:include page="../common/footer.jsp" />
    
    
    </body>
</html>