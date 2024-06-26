<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- 구글 폰트/아이콘 API-->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    
    <style>
        /*  구글 아이콘 CDN 관련 스타일 */
        .material-symbols-outlined {
          font-variation-settings:
          'FILL' 20,
          'wght' 400,
          'GRAD' 0,
          'opsz' 24;
          font-size: 35px;
          background-color: transparent;
          border: 0cm;}
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
		#content {margin: auto; width: 1400px; display: inline-block;}
		#content>div{ display: inline-block;}
        #content_1 {width:100%;}
        #content_2 {width:100%; text-align: center;}
        #content_2 div {float:left;}
        #content_3 {width:100%; }
        #content_5 {width:100%;  display: inline-block;}
        #content_6 {width:100%; height: 12%; border-top: 1px solid gray; display: inline-block;}
        #content_7 {width:100%; height: 8%; display: inline-block;}
        #content_8 {width:100%; height: 14%; display: inline-block;}

        /* 콘텐츠 영역 관련 스타일*/   	
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
            #c2_1{ width: 350px; }  
            #c2_1 img {
                width: 100%;
                height: 100%;
                object-fit: fill;}
            #c2_2{      
            width:350px;
            	font-size: 22px;
            	 height:100%;
            	 margin-top: 100px;
            }
            #c2_3{
              width:350px;
              	font-size: 22px;
            	 height:100%;
            	  margin-top: 100px;
            	}             
            #c2_4
                {width:350px;
                  font-size: 22px;
            	 height:100%;
            	  margin-top: 100px;
            	 }
       
            #content_3>div {
                height: 100%;
                box-sizing: border-box;
                float: left;
                text-align: center;
            }
            #c3_d1{
                width: 20%;
                font-size: 25px;
                padding-top: 25px;}
            #c3_d2{
                width: 5%;
                font-size: 60px;
                padding-top: 20px;}
            #c3_d3{
                width: 20%;
                font-size: 25px;
                padding-top: 25px;}
            #c3_d4{
                width: 5%;
                font-size: 60px;
                padding-top: 20px;}
            #c3_d5{
                width: 20%;
                font-size: 25px;
                padding-top: 25px;}
            #c3_d6{
                width: 5%;
                font-size: 60px;
                padding-top: 20px;}
            #c3_d7{
                width: 25%;
                font-size: 25px;
                padding-top: 25px;}
  
            #content_5 {
              display: inline-block;
                }  
                #content_5 div{
                margin-top: 10px;}
            #c5_d1{
              
                font-size: 20px;
                font-weight: 600;
            
            }
            #c5_d1L{
                width: 10%;
                height: 100%;
            }
            #c5_d1R{
                width: 85%;
                height: 100%;
            }   
            #c5_d2{
                height: 100%;
                font-size: 15px;    
            }
            #c5_d2 div{
                float: left;
            }
            #c5_d2L{
                width: 10%;
                height: 100%;
            }
            #c5_d2R{
                width: 90%;
                height: 100%;
            }  
            #c5_d3{
                height: 13%;
                font-size: 15px;
            }
            #c5_d3 div{
                float: left;
            }
            #c5_d3L{
                width: 10%;
                height: 100%;
            }
            #c5_d3R{
                width: 90%;
                height: 100%;
            }
            #c5_d4{
                height: 35%;
                font-size: 15px;
            }
            #c5_d4 div{
                float: left;
            }
            #c5_d4L{
                width: 10%;
                height: 100%;
            }
            #c5_d4R{
                width: 90%;
                height: 100%;
            }
            #c5_d5{
             
                font-size: 15px;
            }
            #c5_d5 div{
                float: left;
            }
            #c5_d5L{
                width: 10%;
                height: 100%;
            }
            #c5_d5R{
                width: 90%;
                height: 100%;
            }   
            #c5_d6{
                height: 13%;
                font-size: 15px;
            }
            #c5_d6 div{
                float: left;
            }
            #c5_d6L{
                width: 10%;
            
            }
            #c5_d6R{
                width: 90%;
            
            }
            #c5_d7 {width:100%;
             font-size: 15px;
            }
            #c5_d7 div{ float: left;
            }
            #c5_d7L{ width: 10%;
            }
            #c5_d7R{ width: 90%;
            }
            #content_6 div{
                height: 25%;
                margin-left: 15px;
                font-size: 15px;
            }    
            #content_7 div{
                height: 50%;
                margin-left: 15px;

            }
            #content_8 p{text-align: center;
                margin: 12px;
            }
            #content_8 button {
              margin-left: 43%;
              margin-bottom: 5px;
            }      
			 #modalOpenButton, #modalCloseButton {
			  cursor: pointer;}
			    
			#modalContainer {
			  width: 100%;
			  height: 100%;
			  position: fixed;
			  top: 0;
			  left: 0;
			  display: flex;
			  justify-content: center;
			  align-items: center;
 		
			  }
			
			#modalContent {
			  position: absolute;
			
			  width: 800px;
			  height: 1000px;
			  padding: 15px;
			 display: block;
			 z-index: 10;
			  }
			#modalContent *{
			z-index: 10;}
			#modalContainer.hidden {
			  display: none;}
			 #modalOpenButton, #modalCloseButton {
			  cursor: pointer;}
			
			#modalContainer1 {
			  width: 100%;
			  height: 100%;
			  position: fixed;
			  top: 0;
			  left: 0;
			  display: flex;
			  justify-content: center;
			  align-items: center;
			  }
			
			#modalContent1 {
			  position: absolute;
			  width: 800px;
			  height: 1000px;
			  padding: 15px;
			 display: block;
			 z-index: 10;
			  }
			#modalContent1 *{
			z-index: 10;}
			#modalContainer1.hidden {
			  display: none;}
    
</style>


</head>

<body>
    <jsp:include page="../common/header.jsp" />   

<!-- 콘텐츠 영역 -->
    <div class="content-area">
        <div class="content-title" id="home">Perfume</div>
        
		<div id="content" style="text-align:left;">            
			<div id="content_1" style=" margin-top:10px; color:navy; font-size:20px">주문/결제</div>
            <hr>
            <div id="content_2">
                <div id="c2_1"><img src="../persfumeAdmin/${ requestScope.pi.productImgPath}"></div>
                <div id="c2_2">${ requestScope.p.productName }</div>                                                            
                <div id="c2_3">선택수량 :  ${ requestScope.pCount }개</div> 
                <div id="c2_4"><fmt:formatNumber value="${ requestScope.p.productPrice }" type="number"/>원</div> 
           </div>
 			<hr>
            <div id="content_3">
                <div id="c3_d1">총 상품금액<br><fmt:formatNumber value="${ requestScope.p.productPrice * requestScope.pCount}" type="number"/>원</div>
                <div id="c3_d2">-</div>
                <div id="c3_d3">총 할인금액<br><b id="buyprice3" style="font-weight: 400;"><fmt:formatNumber value="${ (requestScope.p.productPrice * requestScope.pCount)-(requestScope.p.productPrice*(1-(20/100))* requestScope.pCount)}" type="number"/></b>원</div>
                <div id="c3_d4">+</div>
                <div id="c3_d5">배송비<br>3000원</div>
                <div id="c3_d6">=</div>
                <div id="c3_d7"><b style="color: crimson;">결제금액</b><br>
             <b id="buyprice2"><fmt:formatNumber value="${requestScope.p.productPrice*(1-(20/100)) * requestScope.pCount +3000}" type="number"/></b><b>원</b></div>
            </div>
       <hr>     
       
      
            <div id="content_5">
		            <div id="c5_d1">  <div id="c5_d1L">배송정보</div> <div id="c5_d1R"></div>
		            </div>
		            <div id="c5_d2">  <div id="c5_d2L">배송지확인</div> <div id="c5_d2R"> <input id="jadong1" type="radio" onclick='btn1Click()'>회원정보와 동일</div>
		            </div>
		            <div id="c5_d3"> <div id="c5_d3L">받으실 분</div>  <div id="c5_d3R"> <input type="text" id="sitename" placeholder="장소명을 입력해주세요." name="sitename"   required></div>
		            </div>
		            <div id="c5_d4"> <div id="c5_d4L">받으실 곳</div> 
		            <div id="c5_d4R"> <input type="text" id="sample6_postcode" name="sample6_postcode" placeholder="우편번호" readonly>
		                <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"  style="background-color: white; color: rgb(150, 214, 177); border: 1px solid rgb(150, 214, 177); font-weight: 700;"><br>
		                <input type="text" id="sample6_address" name="sample6_address" placeholder="주소" readonly style="margin-top:5px;"><br>
		                <input type="text" id="sample6_detailAddress"  name="sample6_detailAddress" placeholder="상세주소">
		                <input type="text" id="sample6_extraAddress"  name="sample6_extraAddress" placeholder="지역구명" style="margin-top:5px;" readonly></div> 
		            </div>
		            <div id="c5_d5"> <div id="c5_d5L">연락처</div>  <div id="c5_d5R"><input type="text" id="sitephone" name="sitephone" placeholder="연락처를 입력해주세요." oninput="hypenTel(this)" required></div>
		            </div>
		            <div id="c5_d6"><div id="c5_d6L">요청사항 </div>  <div id="c5_d6R"><input type="text" id="want" name="want" placeholder="배송관련 요청사항을 입력해주세요." style="width:350px;" onkeyup='printName()' />
		            </div>
		            <input type="text" id="want1" style="display:none">
            		<div id="c5_d7"><div id="c5_d7L">쿠폰적용</div> <div id="c5_d7R"><button type="button" onclick="test1();">쿠폰 조회</button>
            		 <input type="number" id="mno" value="${requestScope.memNo}" style="display:none;"> 
            		<select name="couponlist" id="couponlist">         		
            		</select><button id="coupon" type="button" style="display:none" onclick="test2();" >쿠폰 적용</button></div>
		           <div id="viewcoupon" style="display:none;"> 주문완료 시 선택하신 해당 쿠폰이 사용됩니다.</div>
            		</div>
            		
            		</div>
            </div>
              
            <div id="content_6" >
                <div id="c6_d1" style=" font-size: 20px;
                font-weight: 600; margin-top: 0;"> 결제정보 수집 동의</div>
                <div id="c6_d2"> <input type="checkbox" name='agree' value='selectall' onclick='selectAll(this)'> 전체 동의합니다.</div>
                <div id="c6_d3"><input type="checkbox" name="agree" required> (필수) 개인정보 이용 및 수집에 대한 동의 
		
					<button id="modalOpenButton" style="background-color: white; color: rgb(150, 214, 177); border: 1px solid rgb(150, 214, 177); font-weight: 700;">상세보기</button>
			
						<div id="modalContainer" class="hidden">
			 				 <div id="modalContent">
 <pre style="background-color: white; border: 1px solid black;">
<b>「개인정보 보호법」은 개인정보 보호에 관해 규정한 일반법으로, 개인정보의 유출, 오용, 남용으로부터 사생활의 비밀 등을 보호함으로써 국민의 권리와 이익을 증진하고 개인의 존엄과 가치를 구현하기 위하여 개인정보의 처리에 관한 사항을 규정하고 있습니다.
개인정보보호법의 주요 내용</b>

1. 적용대상
분야별 개별법에 따라 시행되던 개인정보 보호 의무 적용 대상을 공공 민간부문의 모든 개인정보처리자료 확대 적용

2. 보호범위
동사무소 민원신청서류 등 종이문서에 기록된 개인정보 외의 컴퓨터 등에 의해 처리되는 정보,가명처리 된 개인정보도 보호대상에 포함

3. 개인정보 수집·이용·제공 기준
개인정보를 수집 할 때는 정보주체의 동의를 받아야 하며, 수집・이용 목적, 수집 항목, 보유 및 이용 기간, 동의 거부권 등을 알려야 함
개인정보를 수집할 때는 필요 최소한으로 수집해야 함
개인정보를 제3자에게 제공할 때는 정보주체의 동의를 받아야 함
개인정보는 수집한 목적 범위를 초과하여 이용하거나 제3자에게 제공 금지
4. 개인정보의 처리 제한
사상・신념, 노동조합, 정당의 가입・탈퇴, 정치적 견해, 건강, 성생활 등 정보주체의 사생활을 침해할 우려가 있는 정보 처리 금지
고유식별정보는 법령에서 구체적으로 처리를 요구한 경우를 제외하고 원칙적으로 처리 금지
5. 영상정보 처리기기 규제
공개된 장소에 설치·운영하는 영상정보처리기기 규제를 민간까지 확대
설치목적을 벗어난 카메라 임의조작, 다른 곳을 비추는 행위, 녹음 금지
6. 개인정보 유출 통지 및 신고제 도입
정보주체에게 개인정보 유출 사실을 통지
대규모 유출 시에는 보호위원회 또는 전문기관(한국인터넷진흥원)에 신고
7. 정보주체의 권리 보장
정보주체는 개인정보처리자에게 자신의 개인정보에 대한 열람, 정정・삭제, 처리정지 등을 요구 가능
정보주체는 개인정보처리자의 고의 또는 중대한 과실로 인하여 개인정보가 분실, 도난, 유출, 위조, 변조 또는 훼손 된 경우 손해에 대한 배상을 요청할 수 있음
8. 안전조치 의무
개인정보처리자는 개인정보가 분실, 도난, 유출, 위조, 변조 또는 훼손되지 않도록 내부관리계획 수립, 접속기록 보관 등 안전성 확보에 필요한 기술적・관리적 및 물리적 조치를 하여야 함

9. 가명정보의 처리에 관한 특례 도입
통계작성, 과학적 연구, 공익적 기록보존 등을 위하여 정보주체의 동의 없이도 가명정보 처리 허용
통계작성, 과학적 연구, 공익적 기록보존 등의 처리목적 외로 이용하거나 제3자에게 제공, 영리 또는 부정한 목적으로 이용 금지
그 밖의 관련 법과 제도
일반법인 「개인정보 보호법」과 달리 금융 등 개별 분야의 개인정보 보호에 관한 사항을 규정하는 신용정보법과 같은 개별법은 「개인정보 보호법」에 대해 특별법의 지위에 놓이게 됩니다.
이렇게 하나의 사안에 적용할 수 있는 일반법과 특별법이 있을 경우, 특별법 우선의 원칙에 따라 신용정보법과 같은 개별법이 우선 적용됩니다.
</pre>
			  					  <button id="modalCloseButton">닫기</button>
			 				 </div>
						</div>
				</div>
				  			   	   
                <div id="c6_d4"><input type="checkbox" name='agree' required> (필수) 쇼핑몰 이용약관에 대한 동의
               <button id="modalOpenButton1" style="background-color: white; color: rgb(150, 214, 177); border: 1px solid rgb(150, 214, 177); font-weight: 700;">상세보기</button></div>
               	<div id="modalContainer1" class="hidden">
			 				 <div id="modalContent1">
 <pre style="background-color: white; border: 1px solid black;">
<b>「개인정보 보호법」은 개인정보 보호에 관해 규정한 일반법으로, 개인정보의 유출, 오용, 남용으로부터 사생활의 비밀 등을 보호함으로써 국민의 권리와 이익을 증진하고 개인의 존엄과 가치를 구현하기 위하여 개인정보의 처리에 관한 사항을 규정하고 있습니다.
개인정보보호법의 주요 내용</b>

제1조(목적)이 약관은 '에이치엘비글로벌(주) 서울지점'(전자상거래 사업자)이 운영하는 '조마드' 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리.의무 및 책임사항을 규정함을 목적으로 합니다.※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」제2조(정의)① “몰”이란 '에이치엘비글로벌(주) 서울지점
'의 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.제3조 (약관 등의 명시와 설명 및 개정) ① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호.모사전송번호.전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보보호책임자등을 이용자가 쉽게 알 수 있도록 '에이치엘비글로벌(주) 서울지점
' 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회.배송책임.환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 “몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. ⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.제4조(서비스의 제공 및 변경) ① “몰”은 다음과 같은 업무를 수행합니다.  1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결  2. 구매계약이 체결된 재화 또는 용역의 배송  3. 기타 “몰”이 정하는 업무② “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.제5조(서비스의 중단) ① “몰”은 컴퓨터 등 정보통신설비의 보수점검.교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.제6조(회원가입) ① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.  1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.  2. 등록 내용에 허위, 기재누락, 오기가 있는 경우  3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우③ 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.제7조(회원 탈퇴 및 자격 상실 등) ① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.② 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.  1. 가입 신청 시에 허위 내용을 등록한 경우  2. “몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우  3. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우  4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우③ “몰”이 회원 자격을 제한.정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.제8조(회원에 대한 통지)① “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.② “몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.제9조(구매신청) ① “몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.  1. 재화 등의 검색 및 선택  2. 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력  3. 약관내용, 청약철회권이 제한되는 서비스, 배송료.설치비 등의 비용부담과 관련한 내용에 대한 확인  4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)  5. 재화등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의  6. 결제방법의 선택② “몰”이 제3자에게 구매자 개인정보를 제공·위탁할 필요가 있는 경우 실제 구매신청 시 구매자의 동의를 받아야 하며, 회원가입 시 미리 포괄적으로 동의를 받지 않습니다. 이 때 “몰”은 제공되는 개인정보 항목, 제공받는 자, 제공받는 자의 개인정보 이용 목적 및 보유·이용 기간 등을 구매자에게 명시하여야 합니다. 다만 「정보통신망이용촉진 및 정보보호 등에 관한 법률」 제25조 제1항에 의한 개인정보 처리위탁의 경우 등 관련 법령에 달리 정함이 있는 경우에는 그에 따릅니다.제10조 (계약의 성립)① “몰”은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.  1. 신청 내용에 허위, 기재누락, 오기가 있는 경우  2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우  3. 기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우② “몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.③ “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.제11조(지급방법)“몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법중 가용한 방법으로 할 수 있습니다. 단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체 2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제3. 온라인무통장입금4. 전자화폐에 의한 결제5. 수령 시 대금지급6. 마일리지 등 “몰”이 지급한 포인트에 의한 결제7. “몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제 8. 기타 전자적 지급 방법에 의한 대금 지급 등제12조(수신확인통지.구매신청 변경 및 취소)① “몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “몰”은 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.제13조(재화 등의 공급)① “몰”은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다. 이때 “몰”은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.② “몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의.과실이 없음을 입증한 경우에는 그러하지 아니합니다.제14조(환급)“몰”은 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.제15조(청약철회 등)① “몰”과 재화등의 구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다. ② 이용자는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.  1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)  2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우  3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우  4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우③ 제2항제2호 내지 제4호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.제16조(청약철회 등의 효과)① “몰”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 “몰”이 이용자에게 재화등의 환급을 지연한때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」제21조의2에서 정하는 지연이자율(괄호 부분 삭제)을 곱하여 산정한 지연이자를 지급합니다.② “몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 “몰”이 부담합니다.④ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “몰”은 청약철회 시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.제17조(개인정보보호)① “몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다. ② “몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.③ “몰”은 이용자의 개인정보를 수집·이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. ④ “몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용·제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.⑤ “몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보보호 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.⑥ 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.⑦ “몰”은 개인정보 보호를 위하여 이용자의 개인정보를 처리하는 자를 최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.⑧ “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.⑨ “몰”은 개인정보의 수집·이용·제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집·이용·제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.제18조(“몰“의 의무)① “몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화.용역을 제공하는데 최선을 다하여야 합니다.② “몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.③ “몰”이 상품이나 용역에 대하여 「표시.광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시.광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.④ “몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.제19조(회원의 ID 및 비밀번호에 대한 의무)① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의 안내가 있는 경우에는 그에 따라야 합니다.제20조(이용자의 의무)이용자는 다음 행위를 하여서는 안 됩니다.1. 신청 또는 변경시 허위 내용의 등록2. 타인의 정보 도용3. “몰”에 게시된 정보의 변경4. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시5. “몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해6. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위제21조(연결“몰”과 피연결“몰” 간의 관계)① 상위 “몰”과 하위 “몰”이 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트)이라고 합니다.② 연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.제22조(저작권의 귀속 및 이용제한)① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.② 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.③ “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.제23조(분쟁해결)① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치.운영합니다.② “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.③ “몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.제24조(재판권 및 준거법)① “몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.② “몰”과 이용자 간에 제기된 전자상거래 소송에는 한국법을 적용합니다.제25조(쿠폰/적립금/마일리지 제도의 운영)
① "몰"은 "이용자"의 "몰"의 이용, 재화 구입, 이벤트 참여 등 "몰"이 제시한 제공가능 조건에 해당한 경우, "몰"의 혜택정책에 따라 "이용자"에게 정기적으로 비광고성쿠폰/
 적립금/마일리지제도를 운영할 수 있습니다.
② "이용자"가 동의한 약관 및 "몰"의 정책 상 비광고성쿠폰/적립금/마일리지 부여의무가 있는 경우 "몰"은 이용자"에게 비광고성쿠폰/적립금/마일리지를 부여할 수 있습
 니다.
③ 적립금 및 마일리지는 “몰”이 "이용자"에게 “몰”의 정책에 따라 부여하는 결제수단을 말합니다.
④ 쿠폰은 “몰”이 "이용자"에게 “몰”의 정책에 따라 일정액 또는 일정비율을 할인 받을 수 있는 수단을 말합니다.
⑤ 비광고성쿠폰/적립금/마일리지는 다음 각 호의 사유에 해당하는 경우 소멸되어 사용할 수 없습니다.
 1 사전에 명시된 비광고성쿠폰/적립금/마일리지 유효기간이 경과하는 경우
 2 비광고성쿠폰/적립금/마일리지 사용가능 조건 및 소멸 조건에 대한 내용이 별도로 공지된 경우
⑥ "몰"은 비광고성쿠폰/적립금/마일리지의 발급 시 및 비광고성쿠폰/적립금/마일리지의 유효기간이 지나기 전에 유효기간의 도래, 유효기간 내 사용안내 등을 "이용자"에
 게 카카오톡으로 통지합니다.
</pre>
			  					  <button id="modalCloseButton1">닫기</button>
			 				 </div>
						</div>
					             
          </div>
            
             <div id="content_7" style="border-top: 1px solid gray; border-bottom: 1px solid gray; margin: 0;">
                <div id="c7_d1" style=" margin-top: 10px;  font-size: 20px; font-weight: 600;" >결제정보 선택 </div>
                <div id="c7_d2"> <input type="radio" style="margin: 0;" required> 신용카드</div>
             </div>
             
             <div id="content_8" style=" font-size: 20px; font-weight: 600;">
	              <p  name="buyPrice"> <b id="buyprice1">최종결제금액 : <fmt:formatNumber value="${requestScope.p.productPrice*(1-(20/100)) * requestScope.pCount +3000}" type="number"/></b>
	               원<br>
	                <input type="checkbox" required><b style="font-size: 13px; color: red;" >(필수)</b>
	                <b style="font-size: 13px;">구매하실 상품의 결제정보 및 배송지를 확인하였으며, 구매진행에 동의합니다.</b>
	             </p>
            
           <input type="text" id="result1" name="pno" value="2" style="display:none;">

              	
           
            <button id="buy" type="button" style="background-color: rgb(150, 214, 177); border:0px; color: white; width: 150px;"  onclick="payment()">결제하기</button>
             
           </div>
          

             <input type="text" id="combined_address" name="combined_address" placeholder="전체 주소" readonly style="display:none;">
   
  
     </div>        
</div>
             <jsp:include page="../common/footer.jsp" />
  

         

<script>	
 	
const modalOpenButton = document.getElementById('modalOpenButton');
const modalCloseButton = document.getElementById('modalCloseButton');
const modal = document.getElementById('modalContainer');

modalOpenButton.addEventListener('click', () => {
  modal.classList.remove('hidden');
})

modalCloseButton.addEventListener('click', () => {
  modal.classList.add('hidden');
})

const modalOpenButton1 = document.getElementById('modalOpenButton1');
const modalCloseButton1 = document.getElementById('modalCloseButton1');
const modal1 = document.getElementById('modalContainer1');

modalOpenButton1.addEventListener('click', () => {
  modal.classList.remove('hidden');
})

modalCloseButton1.addEventListener('click', () => {
  modal.classList.add('hidden');
})
 	
</script>
  
   
 <!--  모든 체크박스 한번에 클릭 -->      
<script>
function selectAll(selectAll)  {
	  const checkboxes 
	       = document.getElementsByName('agree');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked;
	  })
	} 
       
</script>
    <!-- 주소 API-->
    <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    
                    // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var addr = ''; // 주소 변수
                    var extraAddr = ''; // 참고항목 변수
    
                    //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
    
                    // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                    if(data.userSelectedType === 'R'){
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if(data.buildingName !== '' && data.apartment === 'Y'){
                            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if(extraAddr !== ''){
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("sample6_extraAddress").value = extraAddr;
                    
                    } else {
                        document.getElementById("sample6_extraAddress").value = '';
                    }
    
                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
       </script>    
          
       <script>
		function test1() {
		
		
		
			// 사용자가 위에서 입력한 이름, 나이를 서버로 전달 (ajax)
			$.ajax({
				url : "ajax1.do",
				type : "get",
				data : {
					mno : $("#mno").val()
				},
				success : function(result) {
					
					let resultStr = "";
					
					if(result == null){// 해당 회원의 쿠폰이 없는경우
						resultStr += "<option> 쿠폰이없습니다. </option>";		
					}else{	 // 해당해원의 쿠폰이 이쓴 경우
						for(let i =0 ; i<2 ;i++){
						
							if(result[i].coupon_no == 1){
							  resultStr += "<option value='1'> 회원가입쿠폰(1만원 할인) </option>";
							}else if(result[i].coupon_no == 2){
							 resultStr += "<option value='2'> 설문조사쿠폰(1만원 할인) </option>";
							}	
												}
					}
						
					$("#couponlist").html(resultStr);
					$("#coupon").css('display','inline');
				},
				error : function() {
					console.log("ajax 통신 실패!");
				}
			});
			
		}
	</script>
     <script>
     function test2(){
    let str1 = "최종 결제금액 : <fmt:formatNumber value='${requestScope.p.productPrice*(1-(20/100)) * requestScope.pCount +3000-10000}' type='number'/>";
    	 $("#buyprice1").html(str1);
    	 let str2 =  "<fmt:formatNumber value='${requestScope.p.productPrice*(1-(20/100)) * requestScope.pCount +3000-10000}' type='number'/>";
    	 $("#buyprice2").html(str2);
     	let str3 = "<fmt:formatNumber value='${ (requestScope.p.productPrice * requestScope.pCount)-(requestScope.p.productPrice*(1-(20/100))* requestScope.pCount)+10000}' type='number'/>";
     	$("#buyprice3").html(str3);
     	$("#coupon").attr("disabled", true);
       $('#viewcoupon').css('display', 'block');
		
     	
     }
   
     
     </script>     
     <script>
     function printName()  {
    	  var want1 = document.getElementById('want').value;
    console.log(want1);
    	
     }
     </script>
     <script>
     function(){
	 const hypenTel = (target) => {
 		 target.value = target.value
 		   .replace(/[^0-9]/g, '')
 		   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
 		}}
	 </script>
     
<script>

 var merchant_uid = "A" + new Date().getTime();

      var IMP = window.IMP;
      IMP.init('imp85361566');
 
        function payment(){
    		IMP.request_pay({
    			pg : "html5_inicis",
    			pay_method : "card",
    			merchant_uid : merchant_uid,
    			name : "${ requestScope.p.productName }, ${ requestScope.pCount }개",
    			amount : 100
    		
    		},function(rsp){
    			console.log(rsp);
    			if(rsp.success == true){
    				 jQuery.ajax({
                         url: "complete.po",
                         method: "GET",
                         data: {
                             merchant_uid: rsp.merchant_uid,
                             imp_uid: rsp.imp_uid,
                             amount : 100,
   				 		  mno: ${ requestScope.memNo },
   				 		  want5 : document.getElementById('want').value,
   				 		  pno: ${ requestScope.p.productNo },
   				 		  pcount: ${ requestScope.pCount},
   				 		  adno:  document.getElementById('sample6_postcode').value,
   				 		  address: document.getElementById("sample6_address").value,
   				 		  phone: document.getElementById("sitephone").value
                       		 },
                       success:  function(result) {
       				if(result > 0){
       					window.location.href = "list.po";
       				}
       												},
       				error : function() {
       				console.log("ajax 통신 실패!");
       												}	

       				})
    				
    				  const message = "결제에 성공하였습니다. 감사합니다."
    		            	window.alert(message);
    				 location.href = 'complete.po?'
    			
    			}else{
    				  const message2 = "결제에 실패하였습니다. 다시 시도해주세요."
    		            	window.alert(message2);
    				
    		
                    }// else문 종료
    			});
                     
                      }
    		           
    				
    		
    	
        
</script>
     
          
</body>
</html>