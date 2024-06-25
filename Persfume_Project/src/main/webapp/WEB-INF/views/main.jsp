<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

/* Swiper 관련 영역 */
        /* 이미지 영역 사이즈 조절 */
        .swiper {
            width: 100%;
            height: 80vh;
        }

        .swiper-slide{
            display: flex;
            flex-direction: row;
            justify-content: space-around;
            align-items: center;
        }

        /* 이미지 사이즈 조절 */
        .swiper-slide>.swiper-img{
            width : 30%;
            height: 400px;
        }

        .swiper-img>img{
            width: 100%;
            height : 100%;
            object-fit:cover;
        }

        /* 화살표 버튼색 변경 (기본색은 파란색) */
        div[class^=swiper-button] {
            display: none;
            color : white;
            /* display : none; */ /* 아니면 안보이게 숨기기도 가능 */
        }


        /* 섹션 관련 영역 */


        .main-section{
            position: relative;
            width: 100%;
            height: 100vh;
            /* border: 1px solid red; */
            /* position: relative; */
        }

        .main-section:not(#home, #four) {
            padding-top: 120px;
        }
        

        /* 섹션 이동 버튼 관련 영역 */
        .nav-bar {
            position: fixed;
            z-index: 999;
            top: 50%;
            right: 50px;
            transform: translateY(-50%);
        }

        .nav-bar .nav-menu {
            margin: 0;
            padding: 0;
            list-style-type: none;
        }

        .nav-bar .nav-menu li {
            position: relative;
            min-width: 200px;
            text-align: right;
            margin: 20px 0;
        }

        .nav-bar .nav-menu li .dot {
            display: block;
            color: #fff;
            padding: 5px 0;
        }

        .nav-bar .nav-menu li .dot::before{
            display: block;
            position: absolute;
            content: '';
            border-radius: 50%;
            top: 50%;
            transition: all .5s ease;
        }

        .nav-bar .nav-menu li .dot::before {
            width: 5px;
            height: 5px;
            right: 0;
            border: 2px solid #072f57;
            background-color: rgba(217, 93, 48, 1);
            transform: translateY(-50%);
        }

        .nav-bar .nav-menu li .dot.active::before,
        .nav-bar .nav-menu li:hover .dot::before {
            background: rgba(217, 93, 48, 1);
            border: #072f57;
        }

        .nav-bar .nav-menu li .dot.active::after,
        .nav-bar .nav-menu li:hover .dot::after {
            transform: translateY(-50%) scale(1);
        }


        /* End Nav Styles */

        /* 각 영역 관련 스타일 */

        .main-section-text,
        .main-section-text a{
            color: white;
            text-align: center;
            text-decoration: none;
        }

        #one1{
            background-color: white;
            height: 50vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 15px;
        }
        
        #one1>.main-section-text{
            color: black;
        }
        #one1>.main-section-content{
            width: 70%;
            text-align: center;
        }


        #one2{
            height: 50vh;
            display: flex;
            flex-direction: row;
            justify-content: space-around;

        }
        #one2>img{
            height: 100%;
            width: 50%;  
            object-fit: fill;
        }

        
        /* #one2>.main-section-text{
            color: white;
        } */

        #two{
            /* background: rgb(151,151,151);
            background: radial-gradient(circle, rgba(151,151,151,1) 0%, rgba(99,99,99,1) 15%, rgba(41,41,41,1) 31%, rgba(0,0,0,1) 100%); */
            background-color: white;
            color: black;

        }

        #two, #two *{
            color: black;
        }


        #three{
            background: url(resources/images/bg.png) fixed;
            background-size: cover;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        #three>.main-section-text{
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 100px;
            width: 80%;
            font-size: 20px;
        }
        #three h1{
            font-size: 70px;
        }

        #three *{
            width: 80%;
        }
        

        #four{
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;

            /* background-image: url(main-class.png);
            background-size: cover;
            back */
        }

        #four>#four-bg{
            background: rgb(125,177,230);
            background: radial-gradient(circle, rgba(125,177,230,1) 0%, rgba(49,91,134,1) 23%, rgba(7,47,87,1) 44%, rgba(4,32,60,1) 100%);
            width: 30%;
            height: 100%;
            position: absolute;
            top: 0;
            left: 0;
            z-index: -100;
        }

        #four>.main-section-text{
            /* background: rgb(125,177,230);
            background: radial-gradient(circle, rgba(125,177,230,1) 0%, rgba(49,91,134,1) 23%, rgba(7,47,87,1) 44%, rgba(4,32,60,1) 100%); */
            width: 30%;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 150px;
        }
        #four>.main-section-text *:not(button){
            transform: rotate(-90deg);
            text-align: start;
        }

        #four>.main-section-text button{
            color: white;
            width: 130px;
            padding: 10px 25px;
            border: 2px solid white;
            font-weight: 500;
            background: transparent;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            display: inline-block;
        }
        #four>.main-section-text button {
            transition: all 0.3s ease;
            overflow: hidden;
        }
        #four>.main-section-text button:after {
            position: absolute;
            content: " ";
            top: 0;
            left: 0;
            z-index: -1;
            width: 100%;
            height: 100%;
            transition: all 0.3s ease;
            -webkit-transform: scale(.1);
            transform: scale(.1);
        }
        #four>.main-section-text button:hover {
            color: black;
        }
        #four>.main-section-text button:hover:after {
            background: white;
            -webkit-transform: scale(1);
            transform: scale(1);
        }

        /* ---------------------------- */


        #four>.main-section-content{
            height: 100%;
            width: 70%;

        }
        
        #four>.main-section-content>.main-section-content-img,
        #four>.main-section-content>.main-section-content-img>img{
            width: 100%;
        }
        #four>.main-section-content>.main-section-content-img{
            height: 75%;
            object-fit: cover;
        }
        #four>.main-section-content>.main-section-content-img>img{
            height: 100%;
        }

        #four>.main-section-content>.main-section-content-text{
            height: 25%;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        #four>.main-section-content>.main-section-content-text *:not(h1){
            color: black;
            font-weight: 400;
            font-size: 15px;
            text-align: center;
        }

        #four>.main-section-content>.main-section-content-text h1{
            font-weight: 900;
            font-size: 40px;    
        }


        #four>.main-section-text>p{
            text-align: left;
        }

        #four h1{
            font-size: 70px;
        }


         배경 영상 관련 스타일
         #home {
            display: flex;
            justify-content: center;
            align-items: center;
            position: fixed;
            top: 0;
            left: 0;
            overflow: hidden;
            z-index: -1;
            opacity: 80%;
        }

        #bgVideo {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 100%;
            height: 100%;   
            transform: translate(-50%, -50%);
            background-size: cover;
            object-fit: fill;
        }

        #home-text{
            position:absolute; 
            top:50%; 
            left:25%; 
            transform:translate(-50%,-50%);
            z-index: 999;
            color: white;
        }

        #home-text>h1{
            font-size: 70px;
            text-shadow: 1px 1px 2px #072f57;
        }
        
        .event {
	        display: flex;
	        flex-direction: column;
	        width: 45%;
	        border: 1px solid #e9ecef;
	        border-radius: 10px;
	        transition: transform 0.3s, box-shadow 0.3s;
	        overflow: hidden;
	        background-color: #ffffff;
	    	height: 100%;
	    }
	    
	    .event>.event-img{
		    height : 80%;
	    	width : 100%;
	    }
	    
	    .event>.event-img>img{
	    	height : 100%;
	    	width : 100%;
	    	object-fit: cover;
	    }
	    
		.event:hover {
	        cursor: pointer;
	        transform: translateY(-10px);
	        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    }
	    
	    #eventList{
	    	width:100%;
	    	height:80%;
	    	display: flex;
	    	justify-content: center;
	    	align-items: center;
	    	gap : 10px;
	    	
	    }
</style>

</head>
<body>

	<jsp:include page="common/header.jsp"/>

	<!-- 
        * 여기부터 메인 페이지 영역
    -->

    <!-- Start Nav Section -->
    <nav id="nav-bar" class="nav-bar">
        <ul class="nav-menu">
        <li>
            <a data-scroll="home" href="#home" class="dot active">
            
            </a>
        </li>
        <li>
            <a data-scroll="one1" href="#one1" class="dot">
            
            </a>
        </li>
        <li>
            <a data-scroll="two" href="#two" class="dot">
            
            </a>
        </li>
        <li>
            <a data-scroll="three" href="#three" class="dot">
            
            </a>
        </li>
        <li>
            <a data-scroll="four" href="#four" class="dot">
            
            </a>
        </li>
        </ul>
    </nav>




    <div class="content-area">

        <div class="main-section" id="home">
            <video autoplay muted loop id="bgVideo">
                <source src="resources/images/perfume1.mp4" type="video/mp4">
            </video>
            <div id="home-text">
                <h1>Experience Luxury <h1>
                <h1>in Every Drop</h1>
            </div>
            <div id="home-bg"></div>
        </div>
    

        <div class="main-section left" id="one1">
            
            <div class="main-section-text animate__animated animate__slow">
                <h1 class="animate__animated animate__slower">NOTICE</h1>
            </div>

            <div class="main-section-content">
                <table class="table table-striped" id="noticeList">
                    <tr>
                        <th width=100>번호</th>
                        <th width=500>제목</th>
                        <th width=100>날짜</th>
                    </tr>
					<!-- 여기에 공지사항 띄우기 -->


                </table>
            </div>
        </div>

        <div class="main-section" id="one2">
            
            <div id="eventList">
        		<!-- 여기에 이벤트 목록이 표시 -->
    		</div>
            
        </div>


        <div class="main-section down" id="two">
            <div class="main-section-text animate__animated animate__slow">
                <h1 class="animate__animated animate__slower">
                    BEST ITEM
                </h1>
            </div>
            <div class="main-section-content">
                <div id="content_1">
                    <div class="swiper">
                        <div class="swiper-wrapper" id="productList">
                            
                        </div>
                    
                        <div class="swiper-scrollbar"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="main-section down" id="three">
            <div class="main-section-text animate__animated animate__slower">
                <h1>What's your scent.</h1>
                <p>
                    당신만의 개성과 취향을 반영한 퍼스널 향수를 추천해주는 자가진단 서비스입니다. 간단한 질문을 통해 당신의 라이프스타일, 좋아하는 향기, 감정 등을 분석하여 최적의 향수를 찾아드립니다. 지금 바로 시작하여 나만의 특별한 향기를 발견해보세요!
                </p>
                <h4> > <a href=""> 바로가기 </a></h4>
            </div> 
        </div>

        <div class="main-section left" id="four">
            
            <div class="main-section-text animate__animated animate__slow">
                <h1 class="animate__animated animate__slower">Oneday <br> Class</h1>
                <button onclick="location.href='list.oc'"> > List</button>
            </div>
            <div id="four-bg"></div>

            <div class="main-section-content">
                <div class="main-section-content-img">
                    <img src="resources/images/oneday.jpg" alt="">
                </div>
                <div class="main-section-content-text">
                    <div>
                        <h1>
                            자신만의 독창적인 향기를 창조해보세요. <br>
                        </h1>
                        <br>
                        이 클래스에서는 나만의 향수를 직접 만들 수 있는 특별한 기회를 제공합니다.<br>
                        초보자도 쉽게 따라할 수 있으며, 완성된 향수는 소중한 추억이 될 것입니다.
                    </div>
                </div>
                
            </div>
        </div>

    </div>
    
    <!-- Main Page 관련 스크립트 -->
    <script>
        
        // 이벤트 상위 2개 노출 ajax 사용 - 민호 2024/06/10
         $(document).ready(function() {
            // 페이지가 로드될 때 이벤트 목록을 가져오는 함수 호출
            getEventList();
            getNoticeList();
        });
        
         function getEventList() {
             $.ajax({
                 type: "GET",
                 url: "eventList", // 데이터를 가져올 엔드포인트 URL
                 success: function(result) {
                     // 서버로부터 받은 데이터를 처리하여 이벤트 목록을 표시하는 함수 호출
                     displayEventList(result);
                 },
                 error: function(xhr, status, error) {
                     console.log("이벤트 최근 2개 조회 실패", error);
                 }
             });
         }
         
         function getNoticeList(){
        	 $.ajax({
        		 type: "GET",
                 url: "noticeList", // 데이터를 가져올 엔드포인트 URL
                 success: function(result) {
                     // 서버로부터 받은 데이터를 처리하여 이벤트 목록을 표시하는 함수 호출
                     displayNoticeList(result);
                 },
                 error: function(xhr, status, error) {
                     console.log("공지사항 리스트 조회 실패", error);
                 }
        	 });
         }
         
         function getProductThumbnail(){
        	 $.ajax({
        		type:"get",
        		url: "getProductThumbnail",
        		success: function(result){
        			displayProductThumbnail(result);
        		},
        		error: function(xhr, status, error) {
                    console.log("상품 썸네일 조회 실패", error);
                }
        	 });
         }
         
         function displayEventList(eventList) {
             var eventListDiv = $("#eventList");
             eventListDiv.empty(); // 기존 목록을 비웁니다.

             // 받아온 이벤트 목록을 반복하여 표시합니다.
             for (var i = 0; i < eventList.length; i++) {
            	 console.log(i);
                 var event = eventList[i];
                 var eventHtml = '<div class="event">' +
                 					 '<div class="event-img">' +
                 					 	'<input type="hidden" value="' + event.eventNo +'">' +
                 					 	'<img src="../persfumeAdmin/' + event.eventImgPath + '" alt="' + event.eventTitle + '">' +
                 					 '</div>' +
                 					 '<div align="center" style="margin: auto 0; font-size:20px; font-weight:700;">'+ event.eventTitle +'</div>'
                                 '</div>';

                 eventListDiv.append(eventHtml);
             }
         }
        
         function displayNoticeList(noticeList) {
             var noticeListDiv = $("#noticeList");

             // 받아온 이벤트 목록을 반복하여 표시합니다.
             for (var i = 0; i < noticeList.length; i++) {
                 var notice = noticeList[i];
                 var noticeHtml = '<tr>' +
                 					'<td>' + notice.noticeNo + '</td>' +
                 					'<td>' + notice.noticeTitle + '</td>' +
                 					'<td>' + notice.createDate + '</td>' +
                 				  '</tr>';
             }
             noticeListDiv.append(noticeHtml);
         }
         
         
         
                  
         $(function(){
             $(document).on("click", ".event" , function(){
                 let eventNo = $(this).find('input[type="hidden"]').val();
                 location.href = "detail.ev?eno=" + eventNo;
             });
         });
         
         $(function(){
        	$(document).on("click", "#noticeList>tr:not(:nth-child(1))", function(){
        		let noticeNo = $(this).children().eq(0).text();
        		
        		console.log(noticeNo);
        		
        		location.href = "detail.no?nno=" + noticeNo;
        	});
         });
         
         $(function(){

             var link = $('#nav-bar a.dot');
             link.on('click',function(e){
                 
                 //href 속성을 통해, section id 타겟을 잡음
                 var target = $($(this).attr('href')); 
                 
                 //target section의 좌표를 통해 꼭대기로 이동
                 $('html, body').animate({
                     scrollTop: target.offset().top
                 },600);
                 
                 //active 클래스 부여
                 $(this).addClass('active');

                 //앵커를 통해 이동할때, URL에 #id가 붙지 않도록 함.
                 e.preventDefault();
             });

             $(window).on('scroll',function(){
                 findPosition();
             });

             findPosition();
             
         });
         
         function findPosition(){
             $('.main-section').each(function(){
                 if( ($(this).offset().top - $(window).scrollTop() ) < 20){
                     $('.active').removeClass('active');
                     $('#nav-bar').find('[data-scroll="'+ $(this).attr('id') +'"]').addClass('active');
                 }
             });
         }
		
         
         
         $(function(){
        	 
        	 $.ajax({
       	        url: 'getProductThumbnail', // 데이터를 가져올 URL
       	        method: 'GET', // 요청 방식 (GET, POST 등)
       	        success: function(productList) {
       	        	
       	        	 var productListDiv = $("#productList");
	               	 var productHtml = ""; 
	               	 // 받아온 상품 목록 반복하여 표시
	               	 for(var i=0; i<productList.length; i+=3){
	               		  productHtml += "<div class='swiper-slide'>";
	               		 for(var j=i; j<i+3 && j < productList.length; j++){
	               			 var pImg = productList[j].productImgPath;
	               			 productHtml += "<div class='swiper-img'><img src='../persfumeAdmin/" + pImg + "' alt='test'></div>";
	               		 }
	               		 productHtml += "</div>";
	               	 }
	               	 productListDiv.append(productHtml);       	            
		               	 
		            // 슬라이더 동작 정의
       	            const swiper = new Swiper('.swiper', {
       	                autoplay: {
       	                    delay: 800 // 8초마다 이미지 변경
       	                },
       	                loop: true, // 반복 재생 여부
       	                slidesPerView: 1, // 이전, 이후 사진 미리보기 갯수
       	                pagination: { // 페이징 버튼 클릭 시 이미지 이동 가능
       	                    el: '.swiper-pagination',
       	                    clickable: true
       	                },
       	                navigation: { // 화살표 버튼 클릭 시 이미지 이동 가능
       	                    prevEl: '.swiper-button-prev',
       	                    nextEl: '.swiper-button-next'
       	                }
       	            });
       	        },
       	        error: function(xhr, status, error) {
       	            // 요청이 실패했을 때 처리하는 코드
       	            console.error('Ajax 요청 실패:', status, error);
       	        }
       	    });
         })
         
         
		
         

         let observer = new IntersectionObserver(
             (e)=>{
                 e.forEach((entry)=>{
                     if(entry.isIntersecting){
                         if(entry.target.classList.contains('down')){
                             entry.target.querySelector('.main-section-text').classList.remove('animate__fadeOutDown');
                             entry.target.querySelector('.main-section-text').classList.add('animate__fadeInDown');

                         } else{
                             entry.target.querySelector('.main-section-text').classList.remove('animate__fadeOutLeft');
                             entry.target.querySelector('.main-section-text').classList.add('animate__fadeInLeft');
                         }

                     } else{

                         if(entry.target.classList.contains('down')){
                             entry.target.querySelector('.main-section-text').classList.remove('animate__fadeInDown');
                             entry.target.querySelector('.main-section-text').classList.add('animate__fadeOutDown');

                         } else{
                             entry.target.querySelector('.main-section-text').classList.remove('animate__fadeInLeft');
                             entry.target.querySelector('.main-section-text').classList.add('animate__fadeOutLeft');
                         }
                     }
                 })
             }

         );

         let mainSection = document.querySelectorAll('.main-section:not(#home)');

         observer.observe(mainSection[0]);
         observer.observe(mainSection[1]);
         observer.observe(mainSection[2]);
         observer.observe(mainSection[3]);
         observer.observe(mainSection[4]);
         
         
    </script>

	<jsp:include page="common/footer.jsp"></jsp:include>

</body>
</html>