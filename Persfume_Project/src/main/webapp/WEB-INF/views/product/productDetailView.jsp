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
            object-fit:cover;           
        }
        #c2 img{
	        width: 175px;
	        height: 145px;
	        margin: 13px;
         object-fit:cover;
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
        border-radius: 9px;
            text-align: center;
            width: 100px;
            height: 40px;
            color: black;
            background-color: white;
            border: 1px solid black;  
                        }
        #buy{
            margin-left: 30px;
         border-radius: 9px;
            padding: 0px;
            font-size: 20px;
            border: 0px;
            text-align: center;
            width: 100px;
            height: 40px;
            background-color: black;
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
        
        #heart-button {
        margin-left:20px;}

/* 리뷰부분 gpt*/
.review-list {
    display: flex;
    flex-direction: column;
    gap: 20px;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    margin: 20px auto;
    max-width: 800px;
}

/* 리뷰 스타일 설정 */
.review {
    border: 1px solid #e0e0e0;
    border-radius: 8px;
    padding: 20px;
    background-color: #fafafa;
    transition: box-shadow 0.3s;
}

.review:hover {
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
}

/* 리뷰 헤더 스타일 설정 */
.review-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
}

.user-name {
    font-size: 16px;
    font-weight: bold;
    color: #333;
}

.rating .review-rating {
    font-size: 16px;
    color: #FFD700; /* 별 색상 */
    margin: 0;
}

/* 리뷰 본문 스타일 설정 */
.review-body {
    margin-bottom: 10px;
}

.review-text {
    font-size: 14px;
    color: #555;
    line-height: 1.5;
    margin: 0;
}

/* 리뷰 푸터 스타일 설정 */
.review-footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.review-image {
    max-width: 100px;
    max-height: 100px;
    border-radius: 8px;
    margin-right: 10px;
}

.date {
    font-size: 12px;
    color: #999;
}
/* 모달창 */
.modal {
    display: none; /* 기본적으로 보이지 않음 */
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.5);
}

.modal-content {
    background-color: #fff;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
    max-width: 600px;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    text-align: center;
}

.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: #000;
    text-decoration: none;
    cursor: pointer;
}

.modal-image {
    width: 100%;
    height: auto;
    border-radius: 8px;
    margin-bottom: 20px;
}

.modal-text {
    font-size: 16px;
    color: #555;
    margin-bottom: 10px;
}

.modal-rating {
    font-size: 16px;
    color: #FFD700;
    margin-bottom: 10px;
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
                        <img id="img4" src="../persfumeAdmin/${ requestScope.pi.productImgPath }" alt="이미지">
                    </div>
                    <div id="c2">
                          
                       <c:forEach var="i" items="${ requestScope.pilist }" varStatus="status">
               			     <img id="img${status.count}" src="../persfumeAdmin/${i.productImgPath}" alt="이미지">
                   	   </c:forEach>
                   	   		 <img id="img3"  src="../persfumeAdmin/${ requestScope.pi.productImgPath }" alt="이미지">
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
				                   <input type='button' style=" background-color: white; color: black; border: none; font-weight:700; width:25px; border-radius: 5px; cursor: pointer;  transition: background-color 0.3s, transform 0.3s;"
				                    onclick='count("plus")'
				                    value='+'/>
				                   <input type='button' style=" background-color: white; color: black; border: none; font-weight:700; width:25px; border-radius: 5px; cursor: pointer;  transition: background-color 0.3s, transform 0.3s;"
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
                            <p id="total_amount" name='total_amount' style="font-size: 20px; margin: 0px; color:lightgray; font-weight:400; ">
                             <fmt:formatNumber value="${ requestScope.p.productPrice}" type="number" /></p>
                             <b style="font-size: 20px; margin: 0px; color:lightgray; font-weight:400;">원</b>   &nbsp;&nbsp;             
                            <b style="font-size: 20px;"> → </b>  
                            <p id="total_acount" name='total_account' style="font-size: 20px; color: red; font-weight:600;">
                 			 <fmt:formatNumber value="${ requestScope.p.productPrice * (100-(requestScope.p.discount))/100}" type="number" /> </p>
                		      <b style="font-size: 20px; margin: 0px; color:red; font-weight:600;">원</b>
                   
                            <input type="text" id="result1" name="result1" style="display:none;">
                        
                            
                        </div>
                        <div id="cb" >                  
                            <a id="cart" href="" onclick = 'sendit();' style="width: 200px; margin-bottom: 5px;">장바구니</a>   
                            <button id="buy" type="submit" style="width: 200px;">바로구매</button>
                        
                            <c:choose>
                            <c:when test="${requestScope.fa != null}"> <img src="resources/images/redheart.jpg"  id="heart-button" onclick="favorite();"/></c:when>
                            <c:when test="${requestScope.fa == null}"> <img src="resources/images/heart.jpg"  id="heart-button" onclick="favorite();"/></c:when>
                            
                              </c:choose>
                        </div>
                    </form>
    
                </div>
               </div>
           
                 <div id="content_2">
               
                 </div>
    
                <div id="content_3">
  
                <img style="display: block; vertical-align: top; margin: 0px auto; text-align: center;" result="success" name="copy-1715050123-ECA1B0EBA788EB939C_EB8BB9EC9DBCECB69CEAB3A0_gif.gif" size="1000px/649px" filesize="348,45 kB" error="" src="resources/images/gogo.gif">
                 <img style="display: block; vertical-align: top; margin: 0px auto; text-align: center;" result="success" name="copy-1715050123-ECA1B0EBA788EB939C_EB8BB9EC9DBCECB69CEAB3A0_gif.gif" size="1000px/649px" filesize="348,45 kB" error="" src="resources/images/gogo1.gif">
                 <img style="display: block; vertical-align: top; margin: 0px auto; text-align: center;" result="success" name="copy-1715050123-ECA1B0EBA788EB939C_EB8BB9EC9DBCECB69CEAB3A0_gif.gif" size="1000px/649px" filesize="348,45 kB" error="" src="resources/images/gogo3.jpg">
                 <img style="display: block; vertical-align: top; margin: 0px auto; text-align: center;" result="success" name="copy-1715050123-ECA1B0EBA788EB939C_EB8BB9EC9DBCECB69CEAB3A0_gif.gif" size="1000px/649px" filesize="348,45 kB" error="" src="resources/images/go.gif">
                 <img style="display: block; vertical-align: top; margin: 0px auto; text-align: center;" result="success" name="copy-1715050123-ECA1B0EBA788EB939C_EB8BB9EC9DBCECB69CEAB3A0_gif.gif" size="1000px/649px" filesize="348,45 kB" error="" src="resources/images/go2.gif">
                 <img style="display: block; vertical-align: top; margin: 0px auto; text-align: center;" result="success" name="copy-1715050123-ECA1B0EBA788EB939C_EB8BB9EC9DBCECB69CEAB3A0_gif.gif" size="1000px/649px" filesize="348,45 kB" error="" src="resources/images/go5.jpg">
                
                </div>
            </div>
            </div>
            
            
            
            
            
            
            
            <div class="review-section">
            <h2>리뷰</h2>
            <div class="review-list">
            	 <c:forEach var="pr" items="${ requestScope.prlist }" varStatus="status">
                   
       
              
					                 <div class="review">
					            <div class="review-header">
					                <span class="user-name">user1321</span>
					                <span class="rating">                  
			<c:if test="${pr.reviewRating == 10}"> <p class="review-rating">★★★★★</p></c:if>    
                   <c:if test="${pr.reviewRating == 9}"> <p class="review-rating">★★★★☆</p></c:if>
                    <c:if test="${pr.reviewRating == 8}"> <p class="review-rating">★★★★</p></c:if>
                     <c:if test="${pr.reviewRating == 7}"> <p class="review-rating">★★★☆</p></c:if>
                      <c:if test="${pr.reviewRating == 6}"> <p class="review-rating">★★★</p></c:if>
                       <c:if test="${pr.reviewRating == 5}"> <p class="review-rating">★★☆</p></c:if>
                        <c:if test="${pr.reviewRating == 4}"> <p class="review-rating">★★</p></c:if>
                         <c:if test="${pr.reviewRating == 3}"> <p class="review-rating">★☆</p></c:if>
                          <c:if test="${pr.reviewRating == 2}"> <p class="review-rating">★</p></c:if>
                           <c:if test="${pr.reviewRating == 1}"> <p class="review-rating">☆</p></c:if></span>
					            </div>
					            <div class="review-body">
					                <p class="review-text">${pr.reviewContent}</p>
					            </div>
					            <div class="review-footer">
					                      <img src="${pr.reviewImgPath}" class="review-image">
					                <span class="date">${pr.reviewDate}</span>
					            </div>
					        </div>
					          </c:forEach>
					               
            </div>
        </div>
            
            <!-- 모달 창 HTML -->
<div id="reviewModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <img id="modalImage" class="modal-image" src="" alt="Review Image">
        <p id="modalText" class="modal-text"></p>
        <p id="modalRating" class="modal-rating"></p>
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
<script>
function openModal(imagePath, content, rating) {
    document.getElementById('modalImage').src = imagePath;
    document.getElementById('modalText').innerText = content;
    document.getElementById('modalRating').innerText = getRatingStars(rating);
    document.getElementById('reviewModal').style.display = "block";
}

function closeModal() {
    document.getElementById('reviewModal').style.display = "none";
}

function getRatingStars(rating) {
    const fullStar = '★';
    const halfStar = '☆';
    let stars = '';
    for (let i = 1; i <= 10; i++) {
        stars += i <= rating ? fullStar : halfStar;
    }
    return stars.substring(0, 5); // 최대 5개의 별만 표시
}

// 모달 창 외부 클릭 시 닫기
window.onclick = function(event) {
    const modal = document.getElementById('reviewModal');
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

     
</body>
</html>