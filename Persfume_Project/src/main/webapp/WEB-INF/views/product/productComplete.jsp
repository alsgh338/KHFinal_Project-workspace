<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script src="/main.js"></script>

<style>

	#content {padding-top: 50px;
	margin: auto;
	height: 1000px;}
	
     #content_1{	
                margin: auto;
                width: 65%;
                height: 85%;
                background-color: rgb(240, 240, 240);
                box-shadow:  15px 25px 10px gray;
            }
            #content_2{
                background-color: white;
                width: 65%;
                height: 70%;
                margin: auto;
                box-shadow:   2px 7px 15px 9px darkgray;
                
            }
            #a *{
            float:left;
            display: inline-block;
       		text-align: center;
       		
            }
    		
            *{
            resize: vertical;
            }
</style>

</head>



<body>
     <jsp:include page="../common/header.jsp" />   

   <div id="content">
               
            <div id="content_1"> 
            <p style="font-size: 35px; font-weight: 700; text-align: center;">주문완료</p>
            <p style="font-size: 22px; font-weight: 550; text-align: center; color: gray" >주문 확인 후 결제를 완료해주세요.</p>

                <div id="content_2">
                    <p><b style="margin: 40px; font-size: 23px;">주문번호</b>
                        <b style="margin: 30px; font-size: 20px; font-weight: 400;">주문코드(페이코드)</b>
                    </p>
                    <hr style="width: 95%;">
                    <p><b style="margin: 40px; font-size: 23px;">주문내역</b>
                        <b style="margin: 30px; font-size: 20px; font-weight: 400;">쁘띠마망 &nbsp;&nbsp; 2개 </b>
                         <b style="margin: 30px; font-size: 20px; font-weight: 400;"> 총가격 : &nbsp;&nbsp;  160000 원 </b>
 
                    </p>
                    <hr style="width: 95%;">
                    <p><b style="margin: 40px; font-size: 23px;">배송지</b>
                        <b style="margin: 54px; font-size: 20px; font-weight: 400;">우편번호</b><br>
                        <b style="margin: 207px; font-size: 20px; font-weight: 400;">010-1111-2222</b><br>
                        <b style="margin: 206px; font-size: 20px; font-weight: 400;">서울 당산동 kh빌딩</b><br>   
   
                    </p>
                    <hr style="width: 95%;">
                    <p><b style="margin: 40px; font-size: 23px;">요청사항</b>
                        <b style="margin: 30px; font-size: 20px; font-weight: 400;">문 앞에 두고 가주세요</b><br> </p>
                        <hr style="width: 95%;"><br><br>
                        <div id="a">
                        <a id="" style=" margin-left: 38%; text-decoration: none; border: 1px solid white; background-color: rgb(150, 214, 177); color: white; display: flex; width: 150px; height: 40px; font-size: 17px; font-weight: 700; padding-left: 20px; padding-top: 5px;" href="">메인화면으로</a> 
                        <button id="asdf"  style="background-color: white; border: 1px solid rgb(150, 214, 177); width: 150px; height: 40px; font-size: 17px; font-weight: 700; color: rgb(150, 214, 177) ;" onclick="payment()">결제하기</button>
                     </div>
                    </div>
      	

            </div>
    
            
    

        </div>
	
	<hr>
	
		<div style="text-align: center; font-size: 18px; margin-top:30px; color:red;"> 결제 완료하셨습니다. 로켓 배송!!</div> <br><br>
		
	
  <jsp:include page="../common/footer.jsp" />
    



</body>
</html>