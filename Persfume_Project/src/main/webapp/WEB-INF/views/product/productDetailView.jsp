<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
     import="java.text.DecimalFormat"
     %>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" /> <!--  구글 CDN -->
    <link rel="preconnect" href="https://fonts.googleapis.com"><!--  구글 CDN -->
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><!--  구글 CDN -->
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet"><!--  구글 폰트 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Color+Emoji&display=swap" rel="stylesheet"><!--  구글 이모지 -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>   
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
 
    <style>
 
     /* 구글 이모지 css*/
	    .noto-color-emoji-regular {
		  font-family: "Noto Color Emoji", sans-serif;
		  font-weight: 400;
		  font-style: normal;
		}
		   
	/* 전체 화면 영역 확인용 스타일 */ 
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: sans-serif;
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

        .wrap {
            width : 1400px;  
            padding-top: 300px;
            margin: auto;
           
        }
    
        #content_1 {  
            width: 100%;
            height: 580px;
        }

         #content_2 {
            height: 80px;
            text-align: center;         
            margin: 0;
        } 
         #content_3 {
            width: 100%;
        } 
        /* 콘텐츠 영역 관련 스타일*/   
        .p{ margin: 0;}
        #p2 {
        font-size: 15px;}
    
        #content_1>div{
            float:left;
        }
        #content_1L{
            width: 50%;
            height: 100%;
        }
        #content_1R{
            width: 50%;
            height: 100%;
        }
        #content_1R div{
        display: inline-block;
        }
        #c1{
        width: 100%;
        height: 70%;
        text-align: center;
        }
        #c2{
        width: 90%;
        height: 30%;       
        margin-left: 25px;
        float: left;
        }
        #c1 img{
            width: 85%;
            height: 95%;
            margin-right: 25px;           
        }
        #c2 img{
        width: 175px;
        height: 145px;
        margin: 13px;
        }
        #c3 {
            width: 100%;
            height: 30%;
        }
        #c4 {
            width: 100%;
       
            font-size: 15px;
        }
        #c5{
            border-top: 1px solid lightgray;
            width: 100%;
            height: 40%;
            font-size: 15px;
        }
        #c5 a{
            margin-left: 20px;
        
            font-size: 20px;
            text-decoration: none;
            display: inline-block
        }
        #cb *{
           float: left;
        }
        #cart{
            text-align: center;
            width: 200px;
            height: 40px;
            color: black;
            background-color: white;
            border: 1px solid black;  
                        }
        #buy{
            margin-left: 20px;
         
            padding: 0px;
            font-size: 20px;
            border: 0px;
            text-align: center;
            width: 200px;
            height: 40px;
            background-color: purple ;
            color: white;
        }
        /* 상품 가격부분 */
        #c5_1>p{
            display: inline-block;
        }
        #c5_2>p{
            display: inline-block;
        }
        #pro_title{
            margin-top: 10px;
            margin-right: 20px;
        }
        #select{
            margin-right: 20px;
        }
        #select_amount{
            margin-right: 10px;
            text-decoration: line-through;
        }
    
        #total_amount{
            margin-left: 55px;
            margin-right: 20px;
            text-decoration: line-through;
        }
    
        #total_acount{
            margin-left: 20px;
        }
        /* content2 버튼 스타일 */
        #content_2>table{
            border-top: none;
            border-bottom: none;
            border-left: none;
            border-right: none;
            width: 100%;
            height: 100%;
            margin: auto;
            font-size: 25px;
            font-weight: 550;
            text-align: center;
            background-color: navy ;
            color: white;
        }
    
        /* 상품설명 부분 스타일 */
        #about_salade>img{
            width: 100%;
        }
  .review-section {
    margin-top: 20px;
}

.review-section h2 {
    margin-bottom: 10px;
    color: #333;
}

.review-list {
    display: flex;
    flex-direction: column;
    gap: 20px;
}

.review-item {
    background-color: #f9f9f9;
    padding: 15px;
    border-radius: 10px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.review-item h3 {
    margin: 0 0 5px;
    color: #007bff;
}

.review-rating {
    margin: 0;
    color: #ff9900;
}

.review-text {
    margin: 10px 0;
    color: #555;
}

.review-image {
    width: 130px;
    height: 120px;
    border-radius: 5px;
    margin-top: 10px;
}

#heart-button {
    background-color: transparent;
    border: none;
    cursor: pointer;
    outline: none;
    width: 50px;
    height: 50px;
    background-size: cover;
    transition: background-image 0.3s ease-in-out;
    color: red;
}
    .content-area {
		text-align: center;
		}
        .content-title{
            height: 190px;
            background: url(resources/images/class_title.jpg);
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
       <div class="content-area">
        <div class="content-title" id="home"></div>
        <div class="content-subtitle"></div>
        <div class="content-main">
        </div>
        
    </div>
        <div class="wrap">
         
        <div id="content">
            <div id="content_1" >
                <div id="content_1L">
                    <div id="c1">
                        <img id="img4" src="${ requestScope.pi.productImgPath }" alt="이미지">
                    </div>
                    <div id="c2">
                          
                       <c:forEach var="i" items="${ requestScope.pilist }" varStatus="status">
               			     <img id="img${status.count}" src="${i.productImgPath}" alt="이미지">
                   	   </c:forEach>
                   	   		 <img id="img3"  src="${ requestScope.pi.productImgPath }" alt="이미지">
                    </div>               
                </div>
               <div id="content_1R">
                    <div id="c3"> 
                                <p style="font-size: 20px;"> ${ requestScope.p.productName }</p>
                                <hr>
								 <b style="font-weight:400; font-size: 13px;  overflow-y: auto;">${ requestScope.p.productExplain }</b>
                                <hr>
                                <b style="font-size:15px;">[부향률]</b>  <br>      
                                <img src="resources/images/perfumeIcon.jpg"> <b> ${requestScope.p.category}</b> <br>
                                
	                            <b style="font-weight:400; font-size: 13px;">탑노트 : ${ requestScope.p.topNote }</b> <br>
	                            <b style="font-weight:400; font-size: 13px;">미들노트 : ${ requestScope.p.middleNote }</b> <br>
	                            <b style="font-weight:400; font-size: 13px;">베이스노트 : ${ requestScope.p.baseNote }</b> <br>
                    </div>
                    <br>  <br>                 
                   <div id="c4">
                         <b style="font-size:15px;">[배송정보]</b> <br> 🚀 예상배송일 : 1~2일(배송비 : 3,000원)<br>📝 배송방법(수령장소 및 수령일)은 요청사항으로 작성해주세요.
                    <br><br>
				                        수량&nbsp;&nbsp;&nbsp;&nbsp;
				               <div id='result' name='result' style="width: 50px; display:contents" >1</div>
				                &nbsp;&nbsp;&nbsp;&nbsp;
				                   <input type='button' style=" background-color: gray; color: white; border: 0px; font-weight:700; width:25px;"
				                    onclick='count("plus")'
				                    value='+'/>
				                   <input type='button' style=" background-color: gray; color: white; border: 0px; font-weight:700; width:25px;"
				                     onclick='count("minus")'
				                     value='-'/>                            
                   </div> 
                    <br><br>
                    <form id="c5" action="order.po?pno=${requestScope.p.productNo}"  method="post">
                         <div id="c5_1">
                         <br>
				                           선택수량 : <b id="select" name="select">1</b>   
				                           개당가격 : &nbsp; <p id="select_amount"> <fmt:formatNumber value="${ requestScope.p.productPrice}" type="number" />원 </p>
				            
				          </div><br>
                         <div id="c5_2"> 
                            <b style="font-size: 20px;">총 합계금액</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <p id="total_amount" name='total_amount' style="font-size: 20px; margin: 0px; color:lightgray; font-weight:400;">
                             <fmt:formatNumber value="${ requestScope.p.productPrice}" type="number" /></p>
                             <b style="font-size: 20px; margin: 0px; color:lightgray; font-weight:400;">원</b>   &nbsp;&nbsp;             
                            <b style="font-size: 20px;"> → </b>  
                            <p id="total_acount" name='total_account' style="font-size: 20px; color: red; font-weight:600;">
                 			 <fmt:formatNumber value="${ requestScope.p.productPrice * (100-(requestScope.p.discount))/100}" type="number" /> </p>
                		      <b style="font-size: 20px; margin: 0px; color:red; font-weight:600;">원</b>
                   
                            <input type="text" id="result1" name="result1" style="display:none;">
                        
                            
                        </div>
                        <div id="cb" >                  
                            <a id="cart" href="" onclick = 'sendit();' style="width: 250px; margin-bottom: 5px;">장바구니</a>   
                            <button id="buy" type="submit" style="width: 250px;">바로구매</button>
                            <c:choose>
                            <c:when test="${requestScope.fa != null}"> <img src="resources/images/redheart.jpg"  id="heart-button" onclick="favorite();"/></c:when>
                            <c:when test="${requestScope.fa == null}"> <img src="resources/images/heart.jpg"  id="heart-button" onclick="favorite();"/></c:when>
                            
                              </c:choose>
                        </div>
                    </form>
    
                </div>
               </div>
           
                 <div id="content_2">
                    <table border="1" id="btn_3">
                        <tr>
                            <td>상품설명</td>
                            <td>구매후기</td>
                            <td>FAQ</td>
                            <td>상품문의</td>
                            <!-- jqeury function() 처리 예정 -->
                        </tr>
                    </table>
                 </div>
    
                <div id="content_3">
                    <div id="about_salade">
                        <img src="../../resources/Salade/cheese/cheese_01.jpg" alt="이미지">
                        <img src="../../resources/Salade/cheese/cheese_02.jpg" alt="이미지">
                        <img src="../../resources/Salade/cheese/cheese_03.jpg" alt="이미지">
                        <img src="../../resources/Salade/cheese/cheese_04.jpg" alt="이미지">
                        <img src="../../resources/Salade/cheese/cheese_05.jpg" alt="이미지">
                    </div>
                    <div id="about_delivery">
                        <h2>배송안내</h2>
                            <p>
                            배송 비용 : 1회 배송비 3,500원 (1회 배송 시 결제금액 50,000원 이상 무료) <br>
                            배송 기간 : 1일 (제주도, 도서산간 2~3일) <br>
                            배송 안내 : 결제 단계에서 희망 수령일 선택이 가능하며, 출고 당일 오전 제작 안내 알림톡 발송 <br>
                            <br><br>
                            
                            - 제주 및 도서 산간지역은 1회당 운임 3,000원이 추가 됩니다.  <br>
    
                            - 신선 식품 배송으로 월요일 및 공휴일 다음날은 배송이 불가합니다.  <br>
    
                            - 정기배송 상품의 홀딩기간은 주문일로부터 최대 3개월까지 입니다. <br>
    
                            - 새벽 배송 오전 8시 전 수령, 일반 배송은 자정 12시 전 수령 가능합니다. (네이버페이 구매 시 새벽배송 불가) <br>
     
                            - 배송 시 연락처 또는 주소 오기재(공동현관 비밀번호 누락 등)로 인해 대응 배송 또는 수령이
                             되지 않을 경우 반송될 수 있으니 꼭 확인 후 주문 부탁드립니다. <br>
    
    
                            - 상품 포장은 종이 박스(새벽 배송 일부) 또는 스티로폼 박스에 아이스팩과 함께 포장하여 배송됩니다. <br>
    
                            &nbsp;(단, 겨울철에는 아이스팩을 제외하고 배송됩니다) <br>
    
                            - 고객님께서 주문하신 상품은 발송되는 날, 당일 제작하여 당일 발송됩니다.  <br>
                            </p>
    
                        <h2>교환 및 반품안내</h2>
                            <p>
                            - 제품의 하자나 판매자의 실수로 인한 경우 100% 교환/반품/환불이 가능합니다. <br>
    
                            - 식품 특성상 고객님의 단순변심으로 인한 상품 교환 및 반품은 불가하며, 상품 수령 후 임의 반품 및 환불 역시 불가합니다.  <br>
    
                            - 정기배송 상품의 경우 첫 배송 수령 후, 구성품 변경이 가능하며 그 전에는 취소 후 재주문하시면 됩니다. <br>
    
                            ​- 제품 문제 발생 시에는 수령 후 6일 이내 고객센터나 문의하기 게시판으로 접수 부탁드립니다.<br>
    
                            &nbsp; (식품 배송 특성상 유선 상으로 제품 확인이 어려워 사진 촬영본 확인 후 검토하여 환불 또는 재발송으로 진행됩니다) <br>
                            - 제품에 하자가 있는 경우, 제품 배송 즉시 판매자에게 사전 전화통화를 해야 하며 판매자 승인없이 임의 반품하는 경우 반품/교환이 제한될 수 있습니다. <br>
    
    
                            - 상품 수령후 보관상 발생한 변질, 파손에 대해서는 반품/교환이 제한될 수 있습니다.<br>
                            </p>
                        <h2>환불안내</h2>
                            <p>
                                - 정기 상품은 고객님의 단순 변심/개인 사유 포함하여 취소 요청 시, <br>
                                쿠폰 사용 금액 제외한 실 결제 금액에서 배송 완료된 상품의 정상가 및 회차별 배송비를 합산한 금액을 제외하고 진행되며, <br>
                                결제 수단에서 부분 취소됩니다. (단, 휴대폰 결제의 경우 부분환불이 어려워 해당 금액 무통장 입금 후 전체 취소로 진행됩니다.) <br>
                            </p>
                        <h2>보관방법 및 유통기한</h2>
                            <p>
                                - 보관 방법: 냉장보관(0~5⁰ⅽ), 채소칸에 보관하는 것이 가장 좋습니다.<br>
    
                                - 유통기한: 제조일로부터 6일 (제품 전면 제조일 표기) 
                            </p> 
                    </div>
                </div>
            </div>
            </div>
            
            <div class="review-section">
            <h2>리뷰</h2>
            <div class="review-list">
            	 <c:forEach var="pr" items="${ requestScope.prlist }" varStatus="status">
                   
                <div class="review-item">
                    <h3>사용자1</h3>
                  <c:if test="${pr.reviewRating == 10}"> <p class="review-rating">★★★★★</p></c:if>    
                   <c:if test="${pr.reviewRating == 9}"> <p class="review-rating">★★★★☆</p></c:if>
                    <c:if test="${pr.reviewRating == 8}"> <p class="review-rating">★★★★</p></c:if>
                     <c:if test="${pr.reviewRating == 7}"> <p class="review-rating">★★★☆</p></c:if>
                      <c:if test="${pr.reviewRating == 6}"> <p class="review-rating">★★★</p></c:if>
                       <c:if test="${pr.reviewRating == 5}"> <p class="review-rating">★★☆</p></c:if>
                        <c:if test="${pr.reviewRating == 4}"> <p class="review-rating">★★</p></c:if>
                         <c:if test="${pr.reviewRating == 3}"> <p class="review-rating">★☆</p></c:if>
                          <c:if test="${pr.reviewRating == 2}"> <p class="review-rating">★</p></c:if>
                           <c:if test="${pr.reviewRating == 1}"> <p class="review-rating">☆</p></c:if>
                    <p class="review-text">${pr.reviewContent}</p>
                    <img src="${pr.reviewImgPath}" class="review-image">
                </div>
                </c:forEach>
                
               
            </div>
        </div>
            
          
            </div>
      
           <jsp:include page="../common/footer.jsp" />
      
    <!-- 사진 클릭시 큰 화면으로 바꿔주는 JS -->
<script>

let img1 = document.getElementById("img1");
let img2 = document.getElementById("img2");
let img3 = document.getElementById("img3");

img1.onclick = function() {
	$("#img4").attr("src", img1.src);
	
};

img2.onclick = function() {
	$("#img4").attr("src", img2.src);
	
};

img3.onclick = function() {
	$("#img4").attr("src", img3.src);
	
};
  
</script>  
<!--  +- 버튼 기능 + 데이터 주문서페이지로 넘겨주기 JS -->
<script>
function count(type)  {
	  const resultElement = document.getElementById('result');
	  const selectElement = document.getElementById('select');
	  const total_amountElement = document.getElementById('total_amount');
	  const total_acountElement = document.getElementById("total_acount");
	  // 현재 화면에 표시된 값
	 
	  let number = parseInt(resultElement.innerText);
	
	  // 더하기/빼기
	  if(type === 'plus') {
	    number = parseInt(number) + 1;
	  }else if(type === 'minus' && number >1)  {
		  
	    number = parseInt(number) - 1;
	  }
	  
	  // 결과 출력
	  resultElement.innerText = number;
	  selectElement.innerText = number;
	
	  total_amountElement.innerText =  (number * ${requestScope.p.productPrice}).toLocaleString('ko-KR');
	  total_acountElement.innerText =   (number * ${requestScope.p.productPrice *(1-(20/100))}).toLocaleString('ko-KR');
	  
	};
	

</script>
<!--  +- 버튼 클릭하지 않고 바로 구매 시 결제화면으로 데이터 넘기는 JS -->
<script>
const buy = document.getElementById('buy');
const resultElement = document.getElementById('result');

buy.addEventListener('mouseenter', (event) => {
	let number = parseInt(resultElement.innerText);
	document.getElementById('result1').value = number; // 구매수량

	})	
</script>

<script>
const cart = document.getElementById('cart');

cart.onclick = function() {

let quantity = $("#select").html();
let productNo = ${requestScope.p.productNo};
let mno = ${requestScope.memNo};

console.log("gg");

let url = "BasketAdd.ba?quantity=" + quantity + "&productNo=" + productNo + "&mno=" + mno;

$("#cart").attr("href", url);
};



</script>
<script>
function favorite(){
    $.ajax({
        url: "favorite.fa",
        type: "get", 
        data: {
            "mno" : ${requestScope.memNo},
            "pno" :  ${requestScope.p.productNo}
        },
        success: function(result) {
        	
       	 if(result >0){
       		 
       		 console.log("찜 등록 성공");
       	    window.location.reload(true);
       	 }else{
       		console.log("찜 등록 실패");
       	    window.location.reload(true);
       	 }
        },
        error: function() {
            console.log("찜 통신 실패");
        }
    })
	
}
</script>


     
</body>
</html>