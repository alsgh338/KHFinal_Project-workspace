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
    /* 장바구니 스타일 */
    .wrap {
        width: 1200px;
        /* height : 1260px; */
        margin: auto;
        box-sizing: border-box;
      
      
    }

    #cart>div {
        height: 100%;
        float: left;
    }

    #cart {
        /* width: 100%; */
        display: flex;
 
        height: 100%; /* 부모 요소의 높이 설정 */
    }

    #left {
        width: 55%;
       	 
        /* margin-right: 59px;
            margin-left: 100px; */
    }

    #right {
  	
        width: 40%;
        /* margin-top: 43px; */
    }

    #right button {
        border: none;
        background-color: rgb(224, 224, 224);
        width: 100%;
        height: 50px;
        font-size: 15px;
        font-weight: 500;
    }

    #checkedDel+label:hover {
        cursor: pointer;
    }

    .product {
        width: 100%;
        height: 100%;
    }

    .product>img {
        display: inline-block;
        width: 30%;
    }

    .product>div {
        display: inline-block;
    }

    #pro1_about {
        width: 60%;
    }

    #amount {
        display: inline-block;
    }

    #amount>p {
        display: inline-block;
    }

    .acount {
        display: inline-block;
    }

    .acount>p {
        display: inline-block;
    }

    #total {
        width: 100%;
        height: 20%;
        margin-top: 8px;
        margin-bottom: 50px;
        background-color: #f3f3f3;
    }

    #total_1 {
        margin-top: 20px;
        margin-bottom: 40px;
    }

    #total_2 {
        margin-bottom: 10px;
    }

    #total_1>p {
        display: inline-block;
        font-size: 15px;
        font-weight: 900;
        margin-left: 10px;
    }

    #total_2>p {
        display: inline-block;
        font-size: 15px;
        font-weight: 900;
        /* margin-left: 10px; */
    }

    #total>h2 {
        margin-top: 50px;
        /* margin-left: 10px; */
    }

    .pro_about {
        margin-left: 30px;
    }

    .pro_about>img {
        width: 300px;
        height: 200px;
    }

    #order_1 {
        width: 100%;
        height: 100%;
    }
</style>

</head>
    <jsp:include page="../common/header.jsp" />   
 
      <c:if test="${requestScope.memNo != null}">
    
 <div class="wrap">
    
            <div id="left">
                <div>
                    <br><br>
                    <hr>
                  
         
                 
                </div>
                <div id="order_1">
                    <div class="product" id="product_1">
                       
                        <div class="pro_about">
                       
                         <c:choose> 
                       		  <c:when test="${ requestScope.clist eq null }">	
                            <p id="product1_name" style="font-size:20px; color:red;"> 장바구니에 담긴 상품이 없습니다.</p>
                              </c:when>
                           
                         </c:choose>
                            <br>
                            
                        </div>
                       
                        <hr>
                    </div>
                </div>
            </div>
           
                
</div>
 	

 <div class="wrap">
    <form id="cart" action="basketOrder.ba" method="post">
    	<input type="number" value="${requestScope.memNo}" id="memNo" name="memNo" style="display:none;" />
    
            <div id="left">
                <div>
                    <br><br>
                    <hr>
                    <input type="checkbox" id="selectAll"/><label>전체선택</label>
                    &nbsp; | &nbsp;
                    <button type="button" id="checkedDel" onclick="deleteSelectedItems();">선택삭제</button>

				
                   
                </div>
             <c:forEach var="c" items="${ requestScope.clist }" varStatus="status">
                <c:if test="${ c.quantity > 0 }">
                <div id="order_1">
                		
                    <div class="product" id="product_"${status.index}>
                        <input type="checkbox" id="pro_check" required />
                        <img src="${pilist[status.index].productImgPath}" width="300px" height="200px" />
                        <div class="pro_about">
                            <p id="product1_name">${plist[status.index].productName}</p>
                            <div class="acount">
					                            수량 : <p id="acount_${status.index}">${c.quantity}</p> &nbsp; 
					                            <input type="hidden" name ="BasketNo" value="${c.cartNo}" />
					                            <button type="button" class="plus-btn" data-index="${status.index}" data-basketNo="${c.cartNo}">+</button>
					                            <button type="button" class="minus-btn" data-index="${status.index}">-</button>
					                            <button type="button" class="update-btn" data-index="${status.index}" 
					                            		onclick="updateQuantity(${c.cartNo});"
					                            		>수정</button>
					                            </div>
					                            <br>
					                            <div id="amount">
					                            개당가격 : <p id="product_price"> <fmt:formatNumber value="${ (plist[status.index].productPrice * (100-(plist[status.index].discount)))/100}" type="number" /></p>
					                            </div>
                        </div>
                        <hr>
                  
                    </div>
                   	
                </div>
                </c:if>
                	</c:forEach>
            </div>
   <div id="right" >
                <div id="total">
                  
                        <div id="total_1">
                            <p> 상품금액 : </p> <p id="total_price"></p>                    
                        </div>
                        <div id="total_2">
                            <p> 배송비 : </p>3,000<p id="delivery_fee"></p>
                        </div>
                        <hr>
                        <h3>결제예정금액</h3> <p id="total_amount"></p>
                   
                </div>
                <button type="submit">결제</button>
            </div>
    </form>
    </div>
    </c:if>
    <script>
        // 서버에서 받아온 장바구니 항목들의 정보를 JavaScript 배열로 저장
  var cartItems = [
      	<c:forEach var="c" items="${requestScope.clist}" varStatus="status">
      	{  
           quantity: '${c.quantity}',
           price: '${c.price}'
      	},
      	</c:forEach> 
        ];
   
//------------------ 전체 선택 관련 함수 ---------------------------------------------------------       
     // 전체선택 함수 실행
        $(document).on("click", "#selectAll", function(){
        	selectAll();
        });

         // 전체선택 함수 정의
         function selectAll() {
            const checkboxes = document.querySelectorAll('.product input[type="checkbox"]');
            const selectAllCheckbox = document.getElementById('selectAll');
            const isChecked = selectAllCheckbox.checked; // 체크 여부 확인
                    
            if (isChecked) {
                for (let i = 0; i < checkboxes.length; i++) {
                    checkboxes[i].checked = true; // 전체 선택 체크박스가 선택되면 모든 상품 체크박스도 선택됨
                }
            } else {
                for (let i = 0; i < checkboxes.length; i++) {
                    checkboxes[i].checked = false; // 전체 선택 체크박스가 선택 해제되면 모든 상품 체크박스도 선택 해제됨
                }
            }
        }
         
//------------------- 선택 삭제 관련 함수 -----------------------------------------------------------
      
      // 선택 삭제 함수 정의
         function deleteSelectedItems() {
             // 선택된 상품들의 정보를 담을 배열
             var selectedItems = [];

             // 각 상품에 대해 체크박스의 상태를 확인 -> 선택된 상품들의 정보를 수집
             $(".product").each(function() {
                 if ($(this).find("input[type='checkbox']").prop("checked")) {
                     var index = $(this).attr("id").split("_")[1]; // 인덱스 1번째 자리인걸 index에 변수로 저장하기
                     var basketNo = $(this).find("input[name='BasketNo']").val(); // hidden 으로 넘긴 basketNo 값을 가져옴
                     selectedItems.push(basketNo);
         	
                 }
             });

             // 배열을 삭제함수로 넘기기
            
       deleteItems(selectedItems);
         }

		

         // 선택된 상품 삭제하는 함수
         function deleteItems(selectedItems) {
             
        	
             $.ajax({
                 url: "BasketDelete.ba",
                 type: "post", 
                 traditional: true, //  배열 넘기는 속성
                 dataType: "text", // 배열 넘기는 속성 
                 data: {
                     "selectedItems" : selectedItems // 상품들의 basketNo 배열 전송
                 },
                 success: function(result) {
                	 if(result >0){
                     window.alert("선택 상품이 삭제되었습니다."); 
                     window.location.reload(true);
                	 }
                 },
                 error: function() {
                     console.log("상품 삭제 실패");
                 }
             });
        	
         }
         
//-------------------- 금액 합계 관련 함수 ----------------------------------
    
        // 총 합계를 계산하는 함수
        function calculateTotal() {
            var total = 0;
            for (var i = 0; i < cartItems.length; i++) {
                total += (cartItems[i].price * 1);
            }
            return total;
        }
       
    
        // 화면에 총 합계를 표시하는 함수
        function total_price() {
            var total = calculateTotal();
            document.getElementById('total_price').innerText = total.toLocaleString(); // 화폐 포맷 적용을 위해 toLocaleString() 사용
        }
    
        
        function total_amount() {
        	var amount = calculateTotal() + 3000 ;
        	  document.getElementById('total_amount').innerText = amount.toLocaleString(); // 화폐 포맷 적용을 위해 toLocaleString() 사용
              
        }
        // 페이지 로드 시 총 합계를 계산하여 화면에 표시
        window.onload = function() {
            total_price();
            total_amount();
        };
        
// -------------- 수량 수정 관련 함수 --------------------------------------------------------------
    
        // 수량 증가
        function increaseQuantity(index) {
            const quantityElement = $("#acount_" + index);
            let quantity = parseInt(quantityElement.text());
            quantity =  quantity + 1;
            quantityElement.text(quantity);
            
        }

        // 수량 감소
        function decreaseQuantity(index) {
            const quantityElement = $("#acount_" + index);
            let quantity = parseInt(quantityElement.text());
            if (quantity > 0) {
                quantity -= 1;
                quantityElement.text(quantity);
            }
        }
        
        
        // 수량 증감 이벤트 핸들러
        $(".plus-btn").click(function() {
            const index = $(this).data("index");
            increaseQuantity(index);
        });
    
        $(".minus-btn").click(function() {
            const index = $(this).data("index");
            decreaseQuantity(index);
        });
        

        // 수정한 수량 db에 저장하기 
        function updateQuantity(basketNo){
            let target = window.event.target;
          	let quantity =$(target).parent().children("p").text();

          	if(quantity == 0){
          		 deleteItems(basketNo);
          	}
          	

        	$.ajax({
                url: "BasketEdit.ba",
                type: "get",
                data: {
                    basketNo: basketNo,
                    quantity: quantity
                },
                success: function(result) {
                    console.log("수량 업데이트 성공");
                    console.log(result);
                },
                error: function() {
                    console.log("수량 업데이트 실패");
                }
            })
        	 calculateTotal();
        	 total_price();
        	 total_amount();
        	 window.location.reload(true);
        }
       
    </script>
 
  <jsp:include page="../common/footer.jsp" />
  
</body>
</html>