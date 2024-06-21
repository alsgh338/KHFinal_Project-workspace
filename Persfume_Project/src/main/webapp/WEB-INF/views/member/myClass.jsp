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
        height: 800px;
        border: 1px solid red;
        margin: auto;
        box-sizing: border-box;
        text-align: center; /* 버튼을 가운데로 정렬하기 위한 설정 */
    }


	#classList{
		display: flex;
		justify-content: center;
		align-items: center;
	}
    
    

        /* 여기서 부터 MypageList css */
    
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
	            <a id="class" href="" onclick="classGo(); return false;">클래스 예약조회</a>
	            <form method="post" action="myClass.me" id="myClassForm">
	                <input type="hidden" name="memNo" value="${ sessionScope.loginMember.memNo }">
	            </form>
	        </li>
	    </ul>
	    
	    
	    <div id="classList">
	    	<c:choose>
	    		<c:when test="${empty requestScope.registlist}">
	    			<h1>예약된 클래스가 없습니다.</h1>
	    		</c:when>
	    		<c:otherwise>
		    		<table>
				    	<tr>
				    		<th>번호</th>
				    		<th width="300">클래스 예약 번호</th>
				    		<th width="200">클래스 이름</th>
				    		<th width="150">클래스 일자</th>
				    		<th width="100">취소</th>
				    		<th width="100">기능</th>
				    	</tr>
				    	<tr>
							<c:forEach var="i" begin="0" end="${fn:length(registlist) - 1}">
							    <td>
							        ${i + 1}
							    </td>
							    <td>
							        ${registlist[i].registNo}
							    </td>
							    <td>
							        ${classList[i].className}
							    </td>
							    <td>
							        ${classList[i].startTime}
							    </td>
						    	<c:choose>
							    	<c:when test="${classList[i].isFuture eq 'N'}">
							    		<td>
							    			<button class="btn btn-sm btn-danger cancel-link" data-toggle="modal" data-target="#delete-regist" onclick="deleteRegist(this);">예약 취소</button>
							    		</td>
							    		<td>
							    			<button class="btn btn-sm btn-info" onclick="enrollChat(this);">채팅방 입장</button>
							    		</td>
							    	
							    	</c:when>
							    	<c:otherwise>
							    		<td>
							    			<button class="btn btn-sm btn-secondary cancel-link" data-toggle="modal" data-target="#delete-regist" disabled>기간 만료</button>
							    		</td>
							    		<td>
							    			<c:choose>
							    				<c:when test="${ requestScope.registlist[i].writeReview == 0}">
							    					<button class="btn btn-sm btn-info cancel-link" data-toggle="modal" data-target="#insert-review" onclick="insertReview(this);">리뷰 작성</button>
							    				</c:when>
							    				<c:otherwise>
							    					<button class="btn btn-sm btn-info cancel-link" data-toggle="modal" data-target="#insert-review" onclick="insertReview(this);" disabled>리뷰 작성</button>
							    				</c:otherwise>
							    			
							    			</c:choose>
							    			<input type="hidden">
							    		</td>
							    	</c:otherwise>
						    	
						    	</c:choose>
							    
							</c:forEach>
				    	</tr>
				    
				    </table>
	    		
	    		</c:otherwise>
	    	</c:choose>
	    
	    	    
<%-- 	        <c:forEach var="OneClassRegist" items="${classList}">
	            <div id="class">
	                클래스예약번호 : <span id="registNo">${OneClassRegist.registNo}</span>
	                <a class="cancel-link" data-toggle="modal" data-target="#delete-regist" onclick="deleteRegist(this);">예약 취소</a>
	             </div>
	         </c:forEach>
	
	    </div>
	    <div id="classAboutList">
	        <c:forEach var="OneClass" items="${classAboutList}">
	            <span>${OneClass.className}</span> | 
	            <span>${OneClass.startTime}</span>    
	         <br>
	         </c:forEach>
	    </div> --%>
	    </div>
		</div>
	</div>
	
	
	<script>
	// 원데이 클래스 취소 버튼 스크립트
	/*     $(document).ready(function() {
	        $('.cancel-link').on('click', function(event) {
	            event.preventDefault();
	            // 클릭된 링크의 기본 동작(페이지 이동)을 막음
	
	            let registNo = $(this).parent().find("#registNo").text().trim();
	            // 클릭된 요소의 부모 요소 내의 #registNo 요소의 텍스트 값 가져와서 공백 제거 후 registNo 변수에 저장
	
	            let form = $(this).parent().find(".cansleClass");
	            // 클릭된 요소의 부모 요소 내의 .cansleClass 폼을 찾음
	
	            form.find('input[name="registNo"]').val(registNo);
	            // 폼의 hidden input 요소에 registNo 값을 설정
	
	            console.log(registNo);
	
	           form.submit();
	           
	        });
	    }); */
	
	
	//     $(document).ready(function() {
	//     $('.cancel-link').on('click', function(event) {
	//         event.preventDefault();
	//         // 클릭된 링크의 기본 동작(페이지 이동)을 막음
	
	//         // 클릭된 링크에 해당하는 클래스 예약 번호 가져오기
	//         let registNo = $(this).siblings("#registNo").text().trim();
	
	//         let form = $(this).siblings(".cansleClass");
	//         // 클릭된 링크의 형제 요소 중에서 .cansleClass 폼을 찾음
	
	//         form.find('input[name="registNo"]').val(registNo);
	//         // 폼의 hidden input 요소에 registNo 값을 설정
	
	//         console.log(registNo);
	
	//         // form.submit();
	//     });
	// });
	
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
	
	    // 예약 취소 함수
	    function deleteRegist(element){
	    	let ocrno = $(element).parent().siblings().eq(1).text().trim();
	    	console.log(ocrno);
	    	$("#delete-regist .modal-body>.classRegistNo").attr("value", ocrno);
	    }
	    
	    function insertReview(element) {
	    	let ocrno = $(element).parent().siblings().eq(1).text().trim();
	    	console.log(ocrno);
	    	$("#insert-review .modal-body>.classRegistNo").attr("value", ocrno);
	    	
		}
	    
	    function enrollChat(element){
	    	
	    	let ocrno = $(element).parent().siblings().eq(1).text().trim();
	    	
	    	if(confirm("클래스 단체 채팅방에 참여하시겠습니까?")){
    			$.ajax({
					url : "enrollChat.ct",
					type : "post",
					data : {
						ocrno : ocrno
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

	    	
	    }
	
	</script>
	
	
	
	<!-- The Modal -->
				<div class="modal" id="delete-regist">
				  <div class="modal-dialog">
				    <div class="modal-content">
				
				      <!-- Modal Header -->
				      <div class="modal-header">
				        <h4 class="modal-title">예약 취소</h4>
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				      </div>
	
					  <form action="deleteRegist.oc" method="post">			
				      <!-- Modal body -->
				      <div class="modal-body" align="center">
				      <input type="hidden" name="ocrno" class="classRegistNo">
				        <h3>정말 예약을 취소하시겠습니까?</h1><br> 
				       	<input type="text" name=refundMsg placeholder="취소 사유 " required> 
				      </div>
				
				      <!-- Modal footer -->
				      <div class="modal-footer">
				        <button type="submit" class="btn btn-danger">네</button>
				        <button type="button" class="btn btn-light" data-dismiss="modal">아니오</button>
				      </div>
					</form>
				    </div>
				  </div>
				</div>
				<!-- End of Modal-->
				
			<!-- The Modal -->
			<div class="modal" id="insert-review">
			  <div class="modal-dialog">
			    <div class="modal-content">
			
			      <!-- Modal Header -->
			      <div class="modal-header">
			        <h4 class="modal-title">리뷰 작성</h4>
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			      </div>

				  <form action="insertReview.oc" method="post">			
			      <!-- Modal body -->
			      <div class="modal-body" align="center">
			      <input type="hidden" name="listNo" class="classRegistNo">
			      <input type="hidden" name="reviewWriter" value="${sessionScope.loginMember.memNo}">
			      
			        <h3>해당 클래스에 대한 리뷰를 작성해주세요</h1><br> 
			       	<input type="text" name="classReviewContent" placeholder="리뷰를 작성해주세요 " required> 
			      </div>
			
			      <!-- Modal footer -->
			      <div class="modal-footer">
			        <button type="submit" class="btn btn-danger">네</button>
			        <button type="button" class="btn btn-light" data-dismiss="modal">아니오</button>
			      </div>
				</form>
			    </div>
			  </div>
			</div>
			<!-- End of Modal-->


</body>
</html>