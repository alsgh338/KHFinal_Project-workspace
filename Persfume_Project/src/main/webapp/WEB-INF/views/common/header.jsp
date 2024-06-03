<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


    <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery library -->
    <!-- 온라인 방식 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


    <!-- swiper.js 라이브러리추가 (cdn) -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>


    <!-- animate 라이브러리 연동 (CDN) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    
    
    <style>

       *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: sans-serif;
        }

        html,body{
            margin: 0;
            padding: 0;
        }

        /* 헤더 영역 코드 */

        #header{
            width: 100%;
            height: 90px;
            display: flex;
            align-items: center;
            position: fixed;
            top: 0;
            right: 0;
            left: 0;
            justify-content: space-around;
            align-items: center;
            transition: all .5s ease-out;
            z-index: 999;
        }

        #header a{
            font-weight: 900;
            text-decoration: none;
            position: relative;
            padding: 6px 12px;
        }

        #nav-logo{
            width: 10%;
            text-align: center;
        }

        #nav-logo img{
            width: 80%;
        }


        #nav-btn{
            width: 70%;
            display: flex;
            justify-content: space-around;
            align-items: center;
        }

        #nav-btn a{
            font-size: 20px;
        }

        #nav-btn a::after {
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
        #nav-btn a:hover::after {
            width: 100%;
        }

        .jbFixed-before a{
            color: #ffffff;
            transition: all .5s ease-in;
        }

        .jbFixed-after a{
            color: #072f57;
        }

        .jbFixed-after{
            background-color :  white;
            color: #072f57;
            transition: all .5s ease-in;
        }

        #sub-btns{
            display: flex;
            flex-direction: column;
            gap: 10px;
            position: fixed;
            bottom: 100px;
            right: 100px;
            z-index: 999;
        }

        .side-btn{
            width: 50px;
            height: 50px;
            border-radius: 12px;
            text-align: center;
            line-height: 50px;
            font-size: 15px;
            font-weight: 700;
            color:white;
            background-color: rgba(16, 5, 123, 0.7)/*#10057B / #072f57;*/;
        }

        .hidden>div:not(#toggle-btn){
            display: none;
        }

        .side-btn>img{
            height: 100%;
            width: 100%;
        }

        .side-btn .stick{
            /* background-color: white;
            width: 20px;
            height: 5px;
            border-radius: 4px; */
            position: absolute;
            width: 4px;
            height: 30px;
            border-radius: 2px;
            background-color: rgba(217, 93, 48, 1);
            transition: all .5s ease-out;
        }

        #toggle-btn{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .stick:nth-child(1) {
            transform: rotate(90deg);
        }

        .stick:nth-child(2) {
            transform: rotate(0deg);
        }

        .side-btn.close .stick:nth-child(2){
            transform: scaleY(0.01);
        }

        .animate__animated.animate__zoomInUp,
        .animate__animated.animate__zoomInDown{
            --animate-duration: 1s;
            --animate-delay: 0.5s;
        }

        
        #sub-btns>#sub-btn1{
            --animate-delay: 1.0s; 
            --animate-duration: 1.5s;
        }
        #sub-btns>#sub-btn2{
            --animate-delay: 0.5s; 
            --animate-duration: 1s;
        }
        #sub-btns>#sub-btn3{
            --animate-delay: 0.0s; 
            --animate-duration: .5s;
        }
        
        
     </style>

</head>
<body>
	<!--  
        * 여기부터 헤더 영역
    -->

    <div id="header" class="jbFixed-before">
        <div id="nav-logo">
            <a href="">
                <img src="resources/images/Persfume_Logo.png">
            </a>
        </div>

        <div id="nav-btn" style="">
            <div><a href="">NOTICE</a></div>
            <div><a href="">EVENT</a></div>
            <div><a href="">PERFUME</a></div>
            <div><a href="list.oc">ONEDAY CLASS</a></div>
            <div><a href="">SCENT RECOMMAND</a></div>
        </div>
        <div id="nav-auth">
            <div>
                <a href="">SIGN IN</a> |
                <a href="">SIGN UP</a> 
            </div>
        </div>
    </div>

    <div id="sub-btns" class="hidden">
        <div class="side-btn animate__animated animate__fast" id="sub-btn1" >
            <img src="resources/images/chatbot_white.png" alt="dpgpdl dksskdhsp">
        </div>
        <div class="side-btn animate__animated animate__fast" id="sub-btn2">
            <img src="resources/images/chatbot_white.png" alt="dpgpdl dksskdhsp">
        </div>
        <div class="side-btn animate__animated animate__fast" id="sub-btn3">
            <img src="" alt="페이지 상단 이동 키">
        </div>
        <div class="side-btn" id="toggle-btn">
            <div class="stick"></div>
            <div class="stick"></div>
        </div>
    </div>

    <script>
        $(function(){
            $("#toggle-btn").click(function(){
                document.querySelectorAll("#sub-btns>div:not(#toggle-btn)").forEach(function(element) {
                    
                    if($("#sub-btns").hasClass("hidden")){
                        console.log(1);
                        $("#sub-btns").removeClass("hidden");
                        element.classList.add("animate__zoomInUp");
                    } else{
                        if(element.classList.contains("animate__zoomInUp")){
                            console.log(1);
                            element.classList.remove("animate__zoomInUp");
                            element.classList.add("animate__zoomOutDown");
                        } else{
                            console.log(2);
                            element.classList.remove("animate__zoomOutDown");
                            element.classList.add("animate__zoomInUp");
                        }
                    }
                    

                });
                document.querySelector("#toggle-btn").classList.toggle("close");
            });
        });
    </script>
    
     <!-- 네비게이션 바 스타일 스크립트 -->
    <script>
        $(document).ready(function() {
            var jbOffset = $('.content-area>#home').offset().top + $('.content-area>#home').height();
            $(window).scroll(function() {
                if ($(document).scrollTop() > jbOffset/2) {
                    $('#header').addClass('jbFixed-after');
                    $('#header').removeClass('jbFixed-before');
                } else {
                    $('#header').addClass('jbFixed-before');
                    $('#header').removeClass('jbFixed-after');
                }
            });

            $("#header").hover(function(){
                $('#header').addClass('jbFixed-after');
                $('#header').removeClass('jbFixed-before');   
            }, function(){
                $('#header').addClass('jbFixed-before');
                $('#header').removeClass('jbFixed-after');
            });
        });
    </script>
    
    
</body>
</html>