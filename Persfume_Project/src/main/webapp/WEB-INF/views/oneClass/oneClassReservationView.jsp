<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 포트원 결제 -->
    <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<!-- 포트원 결제 -->


    <style>
        
        /* 여기서부턴 공통 스타일? (아마도) */
                .content-area,
        .content-area div:not(.content-main, .class-review *){
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        

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

        .content-main{
            margin: 5% 0;
        }
        

        .content-subtitle{
            line-height: 150px;
            font-size: 30px;
            font-weight: 600;
        }

        .content-main{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 30px;
        }

        /* 여기서부턴 개별 스타일? (아마도) */
        .content-main>div{
            border-radius: 10px;
            box-shadow: 5px 15px 30px rgba(0,0,0,0.30);
            width: 90%;
        }

        .content-main>#reservation-class{
            display: flex;
            flex-direction: row;
            justify-content: space-around;
            height: 300px;
        }

        .content-main>#reservation-class>div{
            /* border: 1px solid blue; */
            width: 40%;
            height: 100%;
        }

        .content-main>#reservation-class img{
            width: 90%;
            object-fit: cover;
        }

        .content-main>#reservation-class>.class-data{
            height: 100%;
            width: 40%;
            display: flex;
            flex-direction: column;
            align-items: start;
        }

        .content-main>#reservation-class>.class-data>div{
            color: lightgray;
        }

        .content-main>#reservation-class>.class-data>#class-title{
            font-size: 20px;
        }

        #reservation-user>.reservation-item,
        #reservation-user>.reservation-item *{
            width: 90%;
            margin: 5px 0;
        }

        #reservation-user>.reservation-item{
            padding: 20px 0;
        }


        #reservation-user>.reservation-item>.item-var{
            display: flex;
            flex-direction: row;
            justify-content: start;
            font-size: 30px;
            font-weight: 800;
        }

        #reservation-user>#headcount>.item-content{
            display: flex;
            flex-direction: row;
            justify-content: space-between

        }

        #reservation-user>.reservation-item:not(#submit-btn){
            border-bottom: 2px dotted lightslategray;
        }

        /* #reservation-user>.reservation-item>.item-var{
            font-size: 30px;
            font-weight: 800;
        } */

        
        #reservation-user>#headcount>.item-content>.activate{
            background-color: #072f57;
            color: white;
        }

        #reservation-user>.reservation-item>.item-content>.reservation-headCount{
            width: 20%;
            border-radius: 10px;
            height: 50px;
            color: #072f57;
            border: 1px solid #072f57;
        }

        #reservation-user>#person>.item-content>div{
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
        }

        #reservation-user>#person>.item-content input{
            height: 30px;
        }

        #reservation-user hr{
            border: 0;
            border-top: 3px double #8c8c8c;
        }

        #reservation-user>#Pay>.item-content>div{
            display: flex;
            flex-direction: row;
            justify-content: space-around;
        }

        #reservation-user>#submit-btn *{
            height: 50px;
            font-size: 25px;
            border-radius: 10px;
            border: none;
            background-color: #072f57;
            color: white;
        }


    </style>


</head>
<body>

	<jsp:include page="../common/header.jsp"/>
    <div class="content-area">
        <div class="content-title" id="home">ONEDAY CLASS</div>
        <div class="content-subtitle">RESERVATION</div>
        <div class="content-main">
            <div id="reservation-class">
                <div id="class-img">
                    <img src="${ requestScope.oc.thumbnailImg }" alt="썸네일 이미지">
                </div>
                <div class="class-data">
                    <h1>Class Reservation</h1>
                    <div id="class-title">${ requestScope.oc.className} - ${ requestScope.oc.classTeacher}</div>
                    <div id="class-date">${ requestScope.oc.startDate.substring(5,7)} / ${ requestScope.oc.startDate.substring(8,10)}  ${ requestScope.oc.startTime } - ${ requestScope.oc.endTime }  </div>
                    
                    
                </div>
            </div>
            <div id="reservation-user">
                <div class="reservation-item" id="headcount">
                    <div class="item-var">인원 선택(명)</div>
                    <div class="item-content">
                        <div class="reservation-headCount activate">1</div>
                        <div class="reservation-headCount">2</div>
                        <div class="reservation-headCount">3</div>
                        <div class="reservation-headCount">4</div>
                    </div>
                </div>

                <div class="reservation-item" id="person">
                    <div class="item-var">예약자 정보</div>
                    <div class="item-content">
                        <div id="reservation-person">
                            신청자 이름:
                            <input type="text" value="안해준">
                        </div>
                        <div id="reservation-phone">
                            전화번호 : 
                            <input type="tel" value="010-2750-6902">
                        </div>
                        
                        <div id="reservation-email">
                            이메일 : 
                            <input type="email" value="hskef@naver.com">
                        </div>
                    </div>
                </div>

                <div class="reservation-item" id="Pay">
                    <div class="item-var">결제 금액</div>
                    <div class="item-content">
                        <div id="section-pay">
                            <div class="pay-var">예약 금액 : </div>
                            <div class="pay-num"><fmt:formatNumber value="${requestScope.oc.price}" type="number" groupingUsed="true" /></div>
                        </div>
                        <div id="section-headCnt"> 
                            <div class="pay-var">인원 수 : </div>
                            <div class="pay-num">1</div>
                        </div>
                        <div id="section-sale"> 
                            <div class="pay-var">할인 금액 : </div>
                            <div class="pay-num"><fmt:formatNumber value="2000" type="number" groupingUsed="true" /></div>
                        </div>
                        <hr>
                        <div id="section-final"> 
                            <div class="pay-var">결제 금액 : </div>
                            <div class="pay-num"><fmt:formatNumber value="${requestScope.oc.price-2000}" type="number" groupingUsed="true" /></div>
                        </div>
                    </div>
                </div>

                <div class="reservation-item" id="submit-btn">
                    <button type="button" onclick="payment();">예약하기</button>
                </div>
            </div>


        </div>
    </div>

    <div style="background-color: lightblue;">
        <br><br><br><br><br>
        푸터다 
        <br><br><br><br><br>
    </div>

    <script>
        $(function(){
            $(".item-content>.reservation-headCount").click(function(){
                // console.log($(this).text());
                $(".activate").removeClass("activate");
                $(this).addClass("activate");

                // console.log($("#Pay>.item-content").children(1).html());

                let classPay = ${requestScope.oc.price};
                let salePay = 2000;
                let reservPeople = $(this).text();
                let totalPay = (classPay-salePay)*reservPeople;
                
                console.log(totalPay);


                $("#Pay>.item-content>#section-headCnt>.pay-num").text(reservPeople);
                let formattedTotalPay = totalPay.toLocaleString();
                $("#Pay>.item-content>#section-final>.pay-num").text(formattedTotalPay);
                

                
                
                
                
            });
        });


        function payment(){
        	console.log("힁");
        	/* let merchant_uid = "B" + new Date().getTime()+${sessionScope.loginUser.phone.replaceAll("-","")}; */
        	let merchant_uid = "B" + new Date().getTime()+${"010-2750-6902".replaceAll("-","")};
        	//const myAmount = Number(document.getElementById("amount").value);
			const myAmount = 100;
			const buyer_name = $("#reservation-person>input").val();
			const buyer_email = $("#reservation-email>input").val();
			const buyer_tel = $("#reservation-phone>input").val();
			const registPrice = Number($("#section-final>.pay-num").text().replaceAll(",",""));
			const registPersonNo = $(".item-content>.activate").text();

			const name = $("#class-title").text() + registPersonNo + "명";
			
			console.log(buyer_email);
			console.log(buyer_tel);
			console.log(registPrice);
			console.log(registPersonNo);
  	      
  	      
	  	    const IMP = window.IMP; // 생략 가능
		    IMP.init(${requestScope.impApiKey}); // Example: imp00000000
		    IMP.request_pay(
		      {
		        // param
		        pg: "html5_inicis",
		        pay_method: "card",
		        merchant_uid: merchant_uid, //주문번호
		        name: name,
		        amount: myAmount,
		        buyer_email: buyer_email,
		        buyer_name: buyer_name,
		        buyer_tel: buyer_tel,
		      },
		      async (rsp) => {
    			if(rsp.success == true){
    				
    				$.ajax({
    					url : "regist.oc",
    					type : "post",
    					data : {
    						registNo : merchant_uid,
    						registPaycode : ${requestScope.impApiKey},
    						registPrice : registPrice,
    						registPersonNo : registPersonNo,
    						classNo : ${ requestScope.oc.classNo},
    						memNo : 1//${ sessionScope.loginUser.memNo},
    					},
    					success : function(result) {
    						// 성공시 
    						console.log("일단1");
    						if(result == 1){
    							const message = "결제에 성공하였습니다. 감사합니다.";
  	    	    		        window.alert(message);
  	    	    				location.href = 'complete.oc?ocrno='+merchant_uid;
    						} else {
    							console.log("일단2");
    							const message2 = "결제에 실패하였습니다. 다시 시도해주세요.";
   	    		            	window.alert(message2);
    						}
    	    				 
    					},
    					error : function() {
    						const message2 = "결제에 실패하였습니다. 다시 시도해주세요.";
       		            	window.alert(message2);
       		            	console.log("일3");
    					}
    				});

    			
    			}else{
    				// 결제 실패시
    				console.log("일4");
    				
    			}
		          
		      }
		    );
            
        }


    </script>
    
</body>
</html>