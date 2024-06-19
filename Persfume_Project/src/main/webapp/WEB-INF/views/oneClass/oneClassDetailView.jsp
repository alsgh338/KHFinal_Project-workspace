<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
        .content-area,
        .content-area div:not(.content-main, .class-review *){
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
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


        /* 여기서부턴 공통 스타일? (아마도) */

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
        }


        /* 여기서부터 여기 페이지 디자인 속성 */

        .main-wrap{
            /* border: 1px solid black; */
            border-radius: 10px;
            box-shadow: 5px 15px 30px rgba(0,0,0,0.30);
        }

        .content-main>.main-wrap>.class-data{
            display: flex;
            flex-direction: row;
            width: 100%;
        }



        .content-main>.main-wrap>.class-data>div{
            width: 50%;
            height: 500px;
        }
        
        .content-main>.main-wrap>.class-data>.class-simple-data{
        	display: flex;
        	flex-direction: column;
        	justify-content: space-around;
        	align-items: start;
       	}
       	
       	.content-main>.main-wrap>.class-data>.class-simple-data>#class-data1{
       		width:100%;
       		display: flex;
       		flex-direction: row;
       		justify-content: center;
            transform: translateY(-40px);
       		gap: 50%;
       	}
       	
       	.content-main>.main-wrap>.class-data>.class-simple-data>#class-data1>div{
       		color: lightgray;
       	}
       	
       	.content-main>.class-detail-data>#class-data>h1{
       		margin-bottom:40px;
       		font-size: 60px;
       		font-weight: 900;
       	}
       	
       	.content-main>.main-wrap>.class-data>.class-simple-data>div:not(#class-name, #class-data1, #class-data1>*){
       		font-size: 30px;
       		font-weight:700;
       		margin: 0 50px;
       		transform: translateY(-40px);
       		
       	}
       	.content-main>.main-wrap>.class-data>.class-simple-data>#class-name{
       		font-size: 50px;
       		font-weight:900;
       		width: 100%;
       	}
       	
       	
        

        .class-data .class-img>img{
            width: 90%;
            height: 90%;
            border-radius: 15px;
        }




        .content-main>.main-wrap>.class-reservation{
            display: flex;
            flex-direction: row;
            width: 100%;
            height: 100px;
            justify-content: end;
            align-items: end;
            gap: 10px;
            border-top: 1px solid lightgray;
        }

        .content-main>.main-wrap>.class-reservation>.class-sale{
            width: 200px;
            font-size: 40px;
            font-weight: 800;
            color: red;
        }

        .content-main>.main-wrap>.class-reservation>.class-price{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: end;
        }

        .content-main>.main-wrap>.class-reservation>.class-price>#origin{
            text-decoration: line-through;
            color: rgb(173, 171, 171);
        }

        .content-main>.main-wrap>.class-reservation>.class-price>#change{
            font-weight: 800;
            font-size: 50px;
        }

        .content-main>.main-wrap>.class-reservation>.class-reservation-btn,
        .content-main>.main-wrap>.class-reservation>.class-reservation-btn>button{
            height: 90%;
            width: 300px;
        }

        .content-main>.main-wrap>.class-reservation>.class-reservation-btn>button:not(:disabled){
            font-size: 50px;
            border: none;
            border-radius: 15px;
            color: white;
            background-color: #072f57;
        }
        
        .content-main>.main-wrap>.class-reservation>.class-reservation-btn>button[disabled]{
            font-size: 50px;
            border: none;
            border-radius: 15px;
            color: white;
            background-color: lightgray;
        }
        
        .content-main>.main-wrap>.class-reservation>.class-reservation-btn>button:not(:disabled):hover,
        .content-main>.class-detail-data>.class-detail-menu>button:hover{
        	background-color: #134b83;
        }

        .content-main>.class-detail-data{
            margin-top: 5%;
            border-radius: 0px 0px 10px 10px;
            box-shadow: 5px 15px 30px rgba(0,0,0,0.30);
        }

        .content-main>.class-detail-data>.class-detail-menu{
            display: flex;
            flex-direction: row;
            width: 100%;
        }

        .content-main>.class-detail-data>.class-detail-menu>button{
            width: 25%;
            height: 40px;
            background-color: #072f57;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            font-size: 20px;
            color: white;
        }

        .content-area>.content-main .class-detail-area:not(.activate){
            display: none;
        }

        /* .class-detail-area *, */
        .class-detail-area{
        	padding : 100px 0;
        	/*
            border: 1px solid red;*/
            width: 90%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 15px;
        }

        .class-detail-area>#map{
        	width : 90%;
            height: 800px;
        }

        .class-detail-area>#loc-data,
        .class-detail-area>#loc-data>table{
        	width:90%;
            height: 150px;
        }
        
		.class-detail-area>#loc-data>table *{ text-align: center; font-size: 20px;}
		.class-detail-area>#loc-data>table button{
			background-color:#072f57; 
			color: white; 
			width: 70%; 
			height: 50%; 
			font-size: 15px;
			border-radius: 15px
		}

        .footer{
            background-color: lightgray;
        }

        .content-area>.content-main>.class-detail-data>#class-review>.class-review{
            /* border: 1px solid red; */
            display: flex;
            width:100%
            flex-direction: column;
            align-items: start;
            justify-content: center;
            border-bottom: 1px solid lightgray;
        }

        #class-review>div{
            width: 90%;
        }

        
        #class-review>.class-review-count{
            /* border: 1px solid red; */
            font-size: 35px;
            font-weight: 800;
        }


        .class-review>.class-review-section1{
            display: flex;
            flex-direction: column;
            justify-content: start;
            align-items : start;
            gap: 5px;
        }
        
        
        
        .class-review>.class-review-section2{
            color: lightgray;    
        }
        
        .class-review>.class-review-section3{
            font-size: 20px;
        }

        .class-review .class-review-author{
            font-size: 30px;
            font-weight: 700;
        }

        .class-review .class-review-date{
            color: lightgray;
        }

        
        /* 4페이지(환불 규정) 스타일 코드 */
        #class-refund>.wrap {
            margin: 30px 0;
            width: 90%;
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            align-items: start;
        }

        #class-refund h1, #class-refund h2, #class-refund h3 {
            color: #333;
        }

        #class-refund ul {
            list-style-type: disc;
        }
        #class-refund ol {
            list-style-type: decimal;
        }

    </style>
</head>
<body>


    <!-- Kakao Develoeper -->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${requestScope.kakakoMapApiKey}"></script>

	<jsp:include page="../common/header.jsp"/>

	<div class="content-area">
       <div class="content-title" id="home">ONEDAY CLASS</div>
       <div class="content-subtitle">원데이 클래스 </div>
       <div class="content-main">
           <div class="main-wrap">
               <div class="class-data">
                   <div class="class-img">
                   		<img src="${pageContext.request.contextPath}/../persfumeAdmin/${oc.thumbnailImg}" alt="썸네일 이미지">
                       
                   </div>
                   <div class="class-simple-data">
                       <div id="class-name">${ requestScope.oc.className}</div>
                       <div id="class-data1"> 
                       		<div>예약 현황 : ${ requestScope.oc.currentStudent} / ${ requestScope.oc.studentMaxNo}</div>
                       		<div>등록일 : ${requestScope.oc.enrollDate}</div>
                   		</div>
                       <div id="class-teacher">Teacher : ${ requestScope.oc.classTeacher}</div>
                       <div id="class-startDate">Date : ${ requestScope.oc.startDate}</div>
                       <div id="class-Time"> Time : ${ requestScope.oc.startTime } - ${ requestScope.oc.endTime } </div>
                       
                   </div>
               </div>
               <div class="class-reservation">
                   <div class="class-sale">10%</div>
                   <div class="class-price">
                       <div class="class-price" id="origin"><fmt:formatNumber value="${requestScope.oc.price}" type="number" groupingUsed="true" /></div>
                       <div class="class-price" id="change"><fmt:formatNumber value="${requestScope.oc.price*(9/10)}" type="number" groupingUsed="true" /></div>
                   </div>
                   <div class="class-reservation-btn">
                   		<c:choose>
                   			<c:when test="${ requestScope.oc.currentStudent} >= ${ requestScope.oc.studentMaxNo}">
                       			<button disabled>예약 종료</button>
                   			</c:when>
                   			<c:otherwise>
                       			<button type="button">예약하기</button>
                   			</c:otherwise>
                   		</c:choose>
                   </div>
               </div>
           </div>

           <div class="class-detail-data">
               <div class="class-detail-menu">
                   <button id="menu-btn1">클래스 정보</button>
                   <button id="menu-btn2">리뷰</button>
                   <button id="menu-btn3">위치</button>
                   <button id="menu-btn4">취소 및 환불</button>
               </div>
               <div class="class-detail-area activate" id="class-data">
               		<h1>클래스 정보</h1>
               		<img src="${pageContext.request.contextPath}/../persfumeAdmin/${oci[0].classImgPath}" alt="썸네일 이미지">
                   ${ requestScope.oc.classDetail}
               </div>

               <div class="class-detail-area" id="class-review">
                   <div class="class-review-count">
                       <div></div>
                   </div>
                   <div class="class-review">
                       <div class="class-review-section1">
                           <div class="class-review-author">안해준</div>
                           <div class="class-review-date">2023.01.01</div>
                       </div>
                       <div class="class-review-section2 ">
                           공건희의 즐거운 향수 교실
                       </div>
                       <div class="class-review-section3">
                           정말정말 재미있던 클래스 어쩌구 다른 분들도 꼭 한번 저쩌구
                       </div>
                   </div>
               </div>

               <div class="class-detail-area" id="class-location">
                   <div id="map">
                       	
                   </div>
                   <div id="loc-data">
                       <table>
                       		<tr>
                       			<th>
                       				지번주소 : 
                       			</th>
                       			<td>
	                       			인천광역시 연수구 송도국제대로 261
                       			</td>
                       			<td>
                       				<button type="button" class="copy-address">주소 복사</button>
                       			</td>
                       		</tr>
                     		<tr>
	                     		<th>
	                     			도로명 주소 : 
	                     		</th>
	                     		<td>
		                     		인천광역시 연수구 송도동 190-4
	                     		</td>
	                     		<td>
		                     		<button type="button" class="copy-address">주소 복사</button>
	                     		</td>
                       		</tr>
                       </table>
          				
                   </div>
                   
               </div>

               <div class="class-detail-area" id="class-refund">
                   <div class="wrap">
                       <div class="section">
                           <h2>1. 예약대기(“예약확정” 전)</h2>
                           <p>“예약대기”일 경우, 청약 체결 전이므로 취소 요청 시 전체환불 가능합니다.</p>
                           <p>판매자 미승인시, “예약불가”에 대한 기준은 다음과 같습니다.</p>
                           <ol>
                               <li>결제일 기준, “예약 희망일”이 3일 이후인 결제건
                                   <ul>
                                       <li>“예약 희망일” 2일 전까지 “예약확정” 통보를 받지 못한 경우</li>
                                   </ul>
                               </li>
                               <li>결제일 기준, “예약 희망일”이 2일이내인 결제건
                                   <ul>
                                       <li>“예약 희망일” 당일 까지 “예약확정” 통보를 받지 못한 경우</li>
                                   </ul>
                               </li>
                               <li>“예약 희망일”이 없는 결제건
                                   <ul>
                                       <li>“결제일” 기준 2일 이내 “예약확정” 통보를 받지못한 경우</li>
                                   </ul>
                               </li>
                           </ol>
                       </div>
                   
                       <div class="section">
                           <h2>2. 예약확정</h2>
                           <p>“예약확정”일 경우, 청약체결된 상태이므로 이용자의 취소요청 시, 청약철회에 대한 취소수수료가 발생하거나 발생하지 않을 수 있습니다.</p>
                           <h3>(1) 전체환불이 되는 경우</h3>
                           <ul>
                               <li>“예약일” 7일전 취소 요청 시</li>
                               <li>”예약확정” 완료 시간 기준, 1시간 이내 취소 요청 시</li>
                               <li>판매자의 사정으로, “예약일” 구매한 서비스를 제공받지 못하였거나, 안내 받은 경우</li>
                           </ul>
                           <h3>(2) 부분환불이 되는 경우</h3>
                           <p>부분환불의 경우 “원데이클래스”, “1회체험권”, “이용권” 및 “정규 수강권”에 대한 부분환불 배상 비율이 다음과 같이 다르게 적용됩니다.</p>
                           <ol>
                               <li>원데이클래스, 1회체험권
                                   <ul>
                                       <li>예약일 6일전 ~ 2일전 취소시, 결제금액의 10% 배상 후 환불</li>
                                       <li>예약일 1일 전 취소시, 결제금액의 50% 배상 후 환불</li>
                                   </ul>
                               </li>
                               <li>이용권, 정규 수강권
                                   <ul>
                                       <li>예약일 6일전 ~ 2일전 취소시, 결제금액의 5% 배상 후 환불</li>
                                       <li>예약일 1일 전 취소시, 결제금액의 10% 배상 후 환불</li>
                                   </ul>
                               </li>
                           </ol>
                           <h3>(3) 환불이 불가능한 경우</h3>
                           <ul>
                               <li>”이용자”의 사정으로, “예약일” 당일, 이후 취소 요청시</li>
                               <li>“이용자”의 “구매확정” 이후 취소 요청시</li>
                           </ul>
                       </div>
                   
                       <div class="section">
                           <h2>3. 예약불가</h2>
                           <p>“예약불가”일 경우, 청약 미체결로, 전체환불됩니다.</p>
                       </div>
                   
                       <div class="section">
                           <h2>[환불 처리 기간]</h2>
                           <p>환불 처리 기간은 취소 요청 후 “회사” 영업일 기준 24시간 이내입니다.</p>
                           <p>이용자의 적법한 환불 등 요청에도 불구하고, “판매자”가 “이용자”의 요청시로부터 24시간 이내에 그 요청을 승인하지 않는 경우 해당 거래는 자동적으로 취소되고 구매대금은 이용자에게 환불됩니다. 단, “이용자”는 “판매자”의 환불, 취소의 요청에 대한 승인이 있기 전까지 그 의사를 철회할 수 있습니다.</p>
                           <p>카드 결제에 대한 환불인 경우, “회사”가 결제대행사에 요청하는 카드의 결제 취소는 즉시 접수되나, 카드사 사정에 따라 7~10영업일 정도의 취소기간이 소요될 수 있습니다. 카드대금 결제일에 따라 청구작업기간이 다를 수 있으며, 자세한 내용은 해당 카드사에서 확인해야 합니다. (단, 주말, 공휴일은 제외)</p>
                       </div>
                   
                       <div class="section">
                           <h2>[취소 환불 예외규정]</h2>
                           <p>“재화 등”에 대한 이용이 전부 완료 되었으나 아래 해당 사유가 있을 시 환불 가능합니다.</p>
                           <p>“재화 등” 이용 상 문제가 있었다고 판단될 시, 상호 합의 하에 “판매자”가 “이용자”에게 금액을 개인적으로 환불 조치 하는 것은 가능하지만 “회사” 측에서 관여하지 않습니다.</p>
                           <p>“이용자”가 “판매자”에게 문제가 있다고 판단하여 “재화 등”에 대한 이용 중단 및 환불을 요청하는 경우, “회사” 측에서는 개입할 수 있으며 이에 대한 사유 확인과 이용 과정상의 문제가 없었는지 여부를 확인 합니다. 즉, 이용 중 불쾌감 조성, 준비 소홀, 협박, 폭행, 추행, 불법적인 회유 등의 “판매자”의 의무에 맞지 않는 행위를 확인하여, 해당 사실이 발견되는 형사 고발 및 법적인 조치를 가할 수 있습니다. 또한, “판매자”의 자격을 정지 또는 서비스 이용을 제한하는 조치를 취할 수 있습니다.</p>
                       </div>
                   </div>
               </div>
           </div> <!--여기-->
       </div>
   </div>
   
   <script>   
        $(function(){          
        	
        	
        	$(".class-detail-menu>button").click(function(){
                console.log($(this).attr("id"));

                $(".activate").removeClass("activate");

                switch($(this).attr("id")){
                    case "menu-btn1" :
                        $("#class-data").addClass("activate");
                        console.log(1);
                        break;
                    case "menu-btn2" : 
                        $("#class-review").addClass("activate");
                        console.log(2);
                        $.ajax({
            				url : "review.oc",
            				type : "post",
            				data : {
            					oneClassNo : ${requestScope.oc.classNo}
            				},
            				success : function(list) {
            					console.log(list);
            					
            					let resultStr = "<div class='class-review-count'>" +
					                                "<div>"+ list.length + "개의 리뷰</div>" +
				                                "</div>";
            					
            					for(let i = 0; i < list.length; i++){
            						
            						resultStr += "<div class='class-review'>" + 
				            	                       "<div class='class-review-section1'>" +
				                                       "<div class='class-review-author'>" + list[i].reviewWriter + "</div>" + 
				                                       "<div class='class-review-date'>" + list[i].startDate + "</div>" + 
				                                   "</div>"+
				                                   "<div class='class-review-section2 '>"+
				                                   		list[i].className + 
				                                   "</div>" +
				                                   "<div class='class-review-section3'>" + 
				                                   		list[i].classReviewContent + 
				                                   "</div>" + 
				                               "</div>";
            					}
            					
            					$("#class-review").html(resultStr);
            					
            				},
            				error : function() {
            					console.log("ajax 통신 실패!");
            				}
            			});
                        
                        break;
                    case "menu-btn3" : 
                        $("#class-location").addClass("activate");
                        var mapContainer = document.getElementById('map');
                        console.log(mapContainer);
                     	
                  	   var mapOption = {
                  	       center : new kakao.maps.LatLng(37.373742230721, 126.65127934527), // 초기 중심 좌표 이레빌딩으로잡음
                  	       level: 3 // 초기 확대 (1~14)
                  	   };
                  	   var map = new kakao.maps.Map(mapContainer, mapOption);
                  	   var markerPosition = new kakao.maps.LatLng(37.373742230721, 126.65127934527); // 마커 위치
                  	   var marker = new kakao.maps.Marker({
                  	       position: markerPosition
                  	   });       
                  	   marker.setMap(map);
                        console.log(3);
                        break;
                    case "menu-btn4" : 
                        $("#class-refund").addClass("activate");
                        console.log(4);
                        break;
                }


            });
        	
        	$(".class-reservation-btn>button").on("click",function(){

            	location.href = "reservation.oc?ocno=" + ${requestScope.oc.classNo};
        	
        	});
        	
        	$(".copy-address").on("click",function(){
      			  // 복사문구값 가져오기
      			  var copyTxt = $(this).parent().prev();

      			  // 복사문구 선택
      			  copyTxt.select();
      			   // 복사
      			  navigator.clipboard.writeText($.trim(copyTxt.text()));

      			  // 복사완료에 대해 Alert으로 띄우기
      			  alert("복사되었습니다.");
        			
        	});
        });

    </script>
   
   	<jsp:include page="../common/footer.jsp"/>
   

</body>
</html>