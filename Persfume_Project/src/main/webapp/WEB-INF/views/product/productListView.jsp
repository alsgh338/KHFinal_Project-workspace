<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic+Coding&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
 
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

    <style>
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

        #search_form {
            width : 100%;
            height : 30%;
            margin : auto;
        
        }
        #search_form *{
            display: inline;
        }
         #search_form input {
            width: 85%;
            border: 1px solid lightgrey;
            font-size: 14px;      
            border-radius: 10px;          
        }    
         #search_form img {
            border: 1px solid pink;
            width: 10%;
        }
        #search_button {
            width: 10%;
            cursor: pointer;
        }


        /* 여기서부턴 공통 스타일? (아마도) */
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

        .content-main{
            width: 1400px;
            display: inline-block;
            text-align: center;
        }
        .content-main>div{   
        display: block;
           float: left;
        }
        .content-left{
            height: 700px;
            width: 17%;

        }
        .content-right{
            width: 83%;

        }
        .content-right div{
            float: left;
           
        }
   

       .content-sort{
        width: 100%;
        height: 20px;
        text-align: right;     
        float: right;
       }
       .content-sort *{
        margin-right: 10px;
        text-decoration: none;
        color: black;
       }
    
        

        /* 여기서부턴 개별 스타일? (아마도) */

        .oneday-class{
            display: inline-block;
            width: 260px;
            height: 390px;
            margin: 12px 14px;
            transition: all .5s ease;
        }

        .onHover{
            cursor: pointer;
            border-radius: 10px;
            border-color: rgba(0, 0, 0, 0.2);
            opacity: 85%;
            transform: scale(1.04);
            box-shadow: 0 19px 38px rgba(0,0,0,0.30), 0 15px 12px rgba(0,0,0,0.22);
        	/* box-shadow: 0 4px 8px rgba(0,0,0,0.2); */
        }

        .oneday-class>.class-img{
            width: 100%;
            height: 60%;
        }

        .oneday-class>.class-img>img{
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 10px;
        }

        .oneday-class>.class-title{
            width: 250px;
            height: 70px;
            line-height: 20px;
            font-size: 13px;
            font-weight: 200;
            width: 250px; 
            word-wrap: break-word;

        }

        .oneday-class .class-price{
            font-size: 25px;
            text-align: right;
            font-weight: bold;
            color: black;
        }

        .oneday-class .class-teacher{
            width: 250px;
            font-size: 14px;
            line-height: 35px;
            font-weight: 650;
            display: flex;
            flex-direction: row;
            justify-content: start;
            align-items: center;
            margin-left: 5px;
            gap: 10px;
        }

        .oneday-class .class-teacher>div{
            width: 30px;
            height: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .oneday-class .class-teacher>div>img{
            width: 100%;
            height: 100%;
            border-radius: 50%;
            object-fit: cover;
        }

        .oneday-class .class-location{
            color: lightgray;
            border-radius: 5px;
            font-size: 15px;
            font-weight: 700;
            
        }
        .oneday-class .class-discount{
            color: red;
            font-size: 15px;
            font-weight: bold;

        }
        .oneday-class .class-data{
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
            height: 10%;
            width: 250px;
        }
      

    .gender-li {
    list-style-type: none;
    }    
    .note-check {
        
      width: 230px;
   
      padding: 5px; 
    }

    .note-element{
    
      list-style-type: none;
      padding: 0;
      margin: 0;
      overflow-y: auto;
      text-align: left;
    }

    .note-element-li {

      margin-bottom: 5px; 
      list-style-type: none;
      height: 200px;
    }
 
    .swiper {
        width: 1000px;
        height: 250px;
    }

    /* 이미지 사이즈 조절 */
    .swiper-slide>img {
        width : 100%;
        height : 100%;
    }

    /* 화살표 버튼색 변경 (기본색은 파란색) */
    div[class^=swiper-button] {
        color : white;
         display : none; 
    }
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />

  
    <div class="content-area">
        <div class="content-title" id="home">Perfume</div>
<div class="content-subtitle">
    <div id="content_1">
     
        <div class="swiper">
        
            <div class="swiper-wrapper">
         
                <div class="swiper-slide"><img src="/04_Frontend-workspace/2_css-workspace/resources/image/bono.jpg"></div>
                <div class="swiper-slide"><img src="/04_Frontend-workspace/2_css-workspace/resources/image/bono.jpg"></div>
                <div class="swiper-slide"><img src="/04_Frontend-workspace/2_css-workspace/resources/image/bono.jpg"></div>
                <div class="swiper-slide"><img src="/04_Frontend-workspace/2_css-workspace/resources/image/bono.jpg"></div>
                <div class="swiper-slide"><img src="/04_Frontend-workspace/2_css-workspace/resources/image/bono.jpg"></div>
            </div>
        
  
            <div class="swiper-pagination"></div>
        
        
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        
   
            <div class="swiper-scrollbar"></div>
        </div>
    </div>

    
</div>
        <div class="content-main" style="border: 2px solid blue;">

            <div class="content-left"> 
                <div  style="font-size: 18px; font-weight: 600; text-align: center;" > 성별 검색 </div>
                <ul class="gender">
                    <li class="gender-li">
                        <input name="search_form[option_data][]" id="man" value="" type="checkbox"> 
                            <label for="man">남성</label>
                    </li>
                    <li class="gender-li">
                        <input name="search_form[option_data][]" id="woman" value="" type="checkbox"> 
                            <label for="woman">여성</label>
                    </li>
                </ul>

                <div  style="font-size: 18px; font-weight: 600; text-align: center;" > 성분 검색 </div>

                <div class="note-element">
                  
                         <div class="note-check">
                                 <ul class="note-element-li">                                   
                                        <li class="topnote" style="font-size: 16px; font-weight: 600; text-align: center;">탑노트</li>
                                            <li>
                                                <input name="search_form[option_data][]" id="" value="" type="checkbox"> 
                                                <label for="">레몬</label>
                                            </li>
                                            <li>
                                                <input name="search_form[option_data][]" id="" value="" type="checkbox"> 
                                                <label for="">오렌지</label>
                                            </li>
                                            <li>
                                                <input name="search_form[option_data][]" id="" value="" type="checkbox"> 
                                                <label for="">베르가못</label>
                                            </li>
                                            <li>
                                                <input name="search_form[option_data][]" id="" value="" type="checkbox"> 
                                                <label for="">장미</label>
                                            </li>
                                        <li class="middlenote"  style="font-size: 16px; font-weight: 600; text-align: center;">미들노트</li>
                                            <li>
                                                <input name="search_form[option_data][]" id="" value="" type="checkbox"> 
                                                <label for="">자스민</label>
                                            </li>
                                            <li>
                                                <input name="search_form[option_data][]" id="" value="" type="checkbox"> 
                                                <label for="">일랑일랑</label>
                                            </li>
                                            <li>
                                                <input name="search_form[option_data][]" id="" value="" type="checkbox"> 
                                                <label for="">시나몬</label>
                                            </li>
                                            <li>
                                                <input name="search_form[option_data][]" id="" value="" type="checkbox"> 
                                                <label for="">페퍼</label>
                                            </li>
                                        <li class="basenote"  style="font-size: 16px; font-weight: 600; text-align: center;">베이스노트</li>
                                            <li>
                                                <input name="search_form[option_data][]" id="" value="" type="checkbox"> 
                                                <label for="">바닐라</label>
                                            </li>
                                            <li>
                                                <input name="search_form[option_data][]" id="" value="" type="checkbox"> 
                                                <label for="">머스크</label>
                                            </li>
                                            <li>
                                                <input name="search_form[option_data][]" id="" value="" type="checkbox"> 
                                                <label for="">우드</label>
                                            </li>
                                            <li>
                                                <input name="search_form[option_data][]" id="" value="" type="checkbox"> 
                                                <label for="">시더</label>
                                            </li>

                                   

                                 </ul>
                         </div>
                </div>               
               
               <div  style="font-size: 18px; font-weight: 600; text-align: center;"> 결과 내 검색  </div>
               <div id="header_2">
                <form id="search_form" action="search.do" method="get">
                    <div class="search">
                        <input type="text" placeholder=" 검색어 입력">
                        <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png"
                             id="search_button" style="color: black">
                    </div>
                </form>
            </div>
                <!-- 검색창 클릭 기능 구현 JS 스크립트-->
                <script> 
                document.getElementById("search_button").addEventListener("click", function() {
                document.getElementById("search_form").submit();  });
                </script>
           
             </div>

             <div class="content-right">
               <div class="content-sort" style="display: block;" >
           
                    <p>
                        <a href="">신상순</a>
                        <a href="">판매순</a>
                        <a href="">고가순</a>
                        <a href="">저가순</a>
                    </p>
              </div>

           
            
               
		<c:forEach var="p" items="${ requestScope.list }" varStatus="status">
		
            <div class="oneday-class" name="${p.productNo}">
                <div class="class-img">
                    <img src="${ilist[status.index].imgName}" alt="상품이미지">
                </div>

                <div class="class-data">
                    <div class="class-teacher"> 
                      ${p.productName}
                    </div>
                </div>
                
                <div class="class-title">  ${p.productExplain}
                </div>
                <div class="class-data">
                    <div class="class-location"><s>${p.productPrice}</s></div>
                    <div class="class-discount">30%</div>
                    <div class="class-price">190,000원</div>
                </div>
            </div>
                   </c:forEach> 
              
        </div>
    </div>
 </div>

      <jsp:include page="../common/footer.jsp" />
  
    <script>
        $(function(){
            $(".oneday-class").hover(function(){
                $(this).toggleClass("onHover");
            });

        });

    </script>
   
   <script>
    // 슬라이더 동작 정의
    const swiper = new Swiper('.swiper', {
        autoplay : {
            delay : 3000 // 3초마다 이미지 변경
        },
        loop : true, //반복 재생 여부
        slidesPerView : 1, // 이전, 이후 사진 미리보기 갯수
        pagination: { // 페이징 버튼 클릭 시 이미지 이동 가능
            el: '.swiper-pagination',
            clickable: true
        },
        navigation: { // 화살표 버튼 클릭 시 이미지 이동 가능
            prevEl: '.swiper-button-prev',
            nextEl: '.swiper-button-next'
        }
    }); 
</script>
<!--  클릭 하면 상품 상세 조회로 넘어가는 스크립트 -->
<script>
	$(function() {
		
		$(".oneday-class").click(function() {
		
			let pno = $(this).attr('name');
			
			console.log(pno);
			
			location.href = "http://localhost:8006/persfume/detail.po?pno=" + pno;
		});
	});
</script>


</body>
</html>