<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


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

        body{
            background: #4568DC;  /* fallback for old browsers */
            background: -webkit-linear-gradient(to right, #B06AB3, #4568DC);  /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to right, #B06AB3, #4568DC); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
        }
/* 
        div{
            border: 1px solid red;
        } */

        .wrapper{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 20px;
        }

        .section{
            width: 60%;
            background-color: white;
            border-radius: 15px;
            box-shadow: #ddd 0 0 5px 2px;
            margin-bottom: 20px;        
        }

        #content-title{
            display: flex;
            flex-direction: row;
            justify-content: space-around;
            align-items: center;
            height: 100px;
        }

        #content-title>.title-btn{
            border: 1px red;
            height: 40px;
            width: 40px;
        }

        #content-title>.titme-btn>a>img{
            border: 1px solid black;
            object-fit: cover;
            width: 100%;
            height: 100%;
        }

        #result-data #main-recommand-img>img{
            object-fit: cover;
            width: 80%;
            height: 80%;
        }
        
        #content-title>.title-btn>a{
            display: flex;
            width: 40px;
            height: 40px;
        }

        #content-title>#recommand-title{
            font-size: 40px;
            font-weight: 900;
        }

        .wrapper>.section:not(#content-title,.active),
        .wrapper>.section.active>.qna:not(.active, .active#qna1),
        .wrapper>.section.active>.result-section:not(.active){
            display: none;
            animation: fade-out 0.5s ease-out;
        }

        .wrapper>.section.active,
        .wrapper>.section.active>.qna.active,
        .wrapper>.section.active>.result-section.active{
            display: flex;
            animation: fade-in 1.0s ease-out;
        }

        
        @keyframes fade-out{
            from{
                opacity: 1;
            }
            to{
                opacity: 0;
            }
        }

        @keyframes fade-in{
            from{
                opacity: 0;
            }
            to{
                opacity: 1;
            }
        }

        .wrapper>#welcome-content{
            height: 750px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 30px;
            
        }

        .wrapper>#welcome-content div{
            width: 90%;
            text-align: center;
        }

        .wrapper>#welcome-content>hr,
        .wrapper>#qna-result>#result-data>hr
        {
            width: 90%;
            border: 0px solid;
            height: 2px;
            background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 140, 186, 0.75), rgba(0, 0, 0, 0));
            margin: 32px 0px;
            display: block;
        }

        .wrapper>#welcome-content>hr::before,
        .wrapper>#qna-result>#result-data>hr::before{
            position: absolute;
            background-color: white;
            border: 2px solid;
            border-color: #008cba;
            border-left: 0px solid;
            border-top: 0px solid;
            padding: 10px;
            transform: rotate(45deg);
            left: 50%;
            margin: -10px 0px 0px -22px;
            content: "";
        
        }

        .wrapper>#welcome-content>#welcome-section1{
            font-size: 60px;
            font-weight: 900;
        }
        .wrapper>#welcome-content>#welcome-section2,
        .wrapper>#welcome-content>#welcome-section3{
            font-size: 25px;
            font-weight: 500;
        }

        .wrapper>#welcome-content>#welcome-section2>span{
            color: blue;
            font-size: 40px;
            font-weight: 700;
        }

        .wrapper>#welcome-content button{
            width: 40%;
            height: 40px;
            font-size: 20px;
            line-height: 30px;
            border-radius: 15px;
            border: none;
            border: 1px solid black;
            background-color: white;
            transition: all 0.3s ease;
        }

        .wrapper>#welcome-content button:hover{
            background-color: blue;
            color: white;
        }

        .wrapper>#qna-area{
            padding: 30px 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 30px;
        }

        .wrapper>#qna-area>#progress-bar{
            position: relative;
            width: 60%;
            height: 15px;
            background-color: white;
            border-radius: 15px;
            border: 0.5px solid black;
        }

        .wrapper>#qna-area>#progress-bar>#progress-bar-current{
            position: relative;
            height: 15px;
            background: #4568DC;  /* fallback for old browsers */
            background: -webkit-linear-gradient(to right, #B06AB3, #4568DC);  /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to right, #B06AB3, #4568DC); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            border-radius: 15px;
            /* border: 1px solid black; */
            transition: all .3s ease;
        }

        .wrapper>#qna-area>.qna{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 15px;
        }

        #recommand-question,
        #result-loading-progress
        {
            text-align: center;
            font-size: 40px;
        }

        #recommand-answer{
            width: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 30px;
        }

        #recommand-answer>button{
            width: 90%;
            height: 80px;
            background-color: white;
            color:black;
            border-radius : 15px;
            transition: all 0.3s ease;
            
        }

        #recommand-answer>button:hover{
            background-color: blue;
            color: white;
        }

        .wrapper>#qna-result{
            padding: 30px 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 30px;
        }

        .wrapper>#qna-result>div{
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 30px;
        }

        #result-loadingBar {
            border-radius: 10px;
            width: 100%;
            background-color: #f3f3f3;
            border: 1px solid #ccc;
        }

        #result-loadingBar div {

            transition: all .3s ease;
            border-radius: 10px;
            height: 20px;
            width: 0%;
            background: #4568DC;  /* fallback for old browsers */
            background: -webkit-linear-gradient(to right, #B06AB3, #4568DC);  /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to right, #B06AB3, #4568DC); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            text-align: center;
            line-height: 20px;
            color: white;
        }


        /* 결과 화면 관련 스타일 */
        #result-data>div:nth-child(1){
            font-size: 40px;
            font-weight: 900;
        }

        #result-data>div:nth-child(1)>span{
            color: blue;
        }

        #result-data>div:nth-child(2),
        #main-recommand-img,
        .wrapper>#qna-result>#result-data>#sub-recommand-area{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 20px;
        }

        #result-data #main-recommand-title{
            font-size: 35px;
            font-weight: 800;
        }

        #result-data #main-recommand-content,
        .wrapper>#qna-result>#result-data>#sub-recommand-area>div:nth-child(1),
        .wrapper>#qna-result>#result-data>#sub-recommand-area>#sub-recommand-wrap>.sub-recommand *{
            font-size: 25px;
            font-weight: 700;
            color: lightgray;
        }
        
        .wrapper>#qna-result>#result-data>#sub-recommand-area>#sub-recommand-wrap{
            display: flex;
            flex-direction: row;
            justify-content: cener;
            align-items: center;
            gap: 5%;
            width: 90%;
            padding: 20px 0;
        }

        .wrapper>#qna-result>#result-data>#sub-recommand-area>#sub-recommand-wrap>.sub-recommand{
            width: 30%;
        }

        .wrapper>#qna-result>#result-data>#sub-recommand-area>#sub-recommand-wrap>.sub-recommand *{
            width: 100%;
            text-align: center;
        }


    </style>


</head>
<body>

	<div class="wrapper">
        <div class="section" id="content-title">

            <div class="title-btn" id="home-btn">
                <a href="">
                    <img src="house.svg" alt="">
                </a>
            </div>

            <div id="recommand-title">
                SCENT RECOMMAND
            </div>

            <div class="title-btn" id="btn2">
                <a href="">
                    <img src="person-circle.svg" alt="">
                </a>
            </div>
        </div>
        
        <div class="section active" id="welcome-content">
            <div id="welcome-section1">
                Match Your Scent <br>
                to Your Personality
            </div>

            <hr>
            <div id="welcome-section2">
                반갑습니다 <span>XXX</span>님 <br>
            </div>

            <div id="welcome-section3">
                몇 가지 질문을 통해 당신에 어울리는 향수를 추천해드립니다.
            </div>

            <br><br><br>

            <button id="recommand-start">Start</button>
        </div>

        <div class="section" id="qna-area">
            <div id="progress-bar">
                <div id="progress-bar-current"></div>
            </div>
            <div class="qna active" id="qna1">
                <div id="recommand-question">
                    어떤 성별을 위한 향수를 원하시나요?
                </div>
                <div id="recommand-answer">
                    <button class="answer-btn">남성</button>
                    <button class="answer-btn">여성</button>
                    <button class="answer-btn">중성</button>
                </div>
            </div>

            <div class="qna" id="qna2">
                <div id="recommand-question">
                    어떤 계절을 좋아하나요?
                </div>
                <div id="recommand-answer">
                    <button class="answer-btn">봄</button>
                    <button class="answer-btn">여름</button>
                    <button class="answer-btn">가을</button>
                    <button class="answer-btn">겨울</button>
                </div>
            </div>

            <div class="qna" id="qna3">
                <div id="recommand-question">
                    어떤 상황에 사용할 향수인가요
                </div>
                <div id="recommand-answer">
                    <button class="answer-btn">데이트</button>
                    <button class="answer-btn">데일리</button>
                    <button class="answer-btn">직장</button>
                    <button class="answer-btn">운동</button>
                    <button class="answer-btn">행사</button>
                </div>
            </div>

            <div class="qna" id="qna4">
                <div id="recommand-question">
                    어떤 향을 좋아하시나요?
                </div>
                <div id="recommand-answer">
                    <button class="answer-btn">우드</button>
                    <button class="answer-btn">바다</button>
                    <button class="answer-btn">플로럴</button>
                    <button class="answer-btn">햇빛</button>
                    <button class="answer-btn">과일</button>
                </div>
            </div>

            <div class="qna" id="qna5">
                <div id="recommand-question">
                    평소 어떤 패션 스타일을 선호하시나요?
                </div>
                <div id="recommand-answer">
                    <button class="answer-btn">캐주얼</button>
                    <button class="answer-btn">아메카지</button>
                    <button class="answer-btn">미니멀</button>
                    <button class="answer-btn">스트릿</button>
                    <button class="answer-btn">블록코어</button>
                </div>
            </div>

            <div class="qna" id="qna6">
                <div id="recommand-question">
                    당신의 나이대는?
                </div>
                <div id="recommand-answer">
                    <button class="answer-btn">10대</button>
                    <button class="answer-btn">20대</button>
                    <button class="answer-btn">30대</button>
                    <button class="answer-btn">40대</button>
                    <button class="answer-btn">50대</button>
                </div>
            </div>

            <div class="qna" id="qna7">
                <div id="recommand-question">
                    보통 외부 활동 시간이 어느 정도 인가요?
                </div>
                <div id="recommand-answer">
                    <button class="answer-btn">1시간 ~ 3시간</button>
                    <button class="answer-btn">3시간 ~ 5시간</button>
                    <button class="answer-btn">5시간 ~ 7시간</button>
                    <button class="answer-btn">7시간 ~ 10시간</button>
                    <button class="answer-btn">10시간 이상</button>
                </div>
            </div>

            <div class="qna" id="qna8">
                <div id="recommand-question">
                    길을 걷던 중 나와 같은 향을 쓰는 사람을 마주친다면?
                </div>
                <div id="recommand-answer">
                    <button class="answer-btn">남이랑 겹치는 거 싫은데ㅠㅠ</button>
                    <button class="answer-btn">어라? 왠지 찝찝한데...?</button>
                    <button class="answer-btn">...(별 생각 없음)</button>
                    <button class="answer-btn">나랑 같은 향수잖아? 흥미로운데?</button>
                    <button class="answer-btn">오..내 향수 인기 많잖아(뿌듯)</button>
                </div>
            </div>

            <div class="qna" id="qna9">
                <div id="recommand-question">
                    원하는 가격대를 선택해주세요
                </div>
                <div id="recommand-answer">
                    <button class="answer-btn">4만원 이하</button>
                    <button class="answer-btn">4만원 ~ 6만원</button>
                    <button class="answer-btn">6만원 ~ 8만원</button>
                    <button class="answer-btn">8만원 ~ 10만원</button>
                    <button class="answer-btn">10만원 이상</button>
                </div>
            </div>
        </div>

        <div class="section" id="qna-result">
            <div class="result-section active" id="result-loding">
                <div id="result-loading-progress">
                 	 결과 찾는 중
                </div>
                <div id="result-loadingBar">
                    <div id="progress"></div>
                </div>                
            </div>
            <div class="result-section" id="result-data">
                <div>
                    <span>XXX</span>님의 향수는...
                </div>
                <div class="recommand-perfume" id="main-recommand">
                    <div id="main-recommand-title">
                        	향수 이름
                    </div>

                    <div id="main-recommand-img">
                        <img src="resources/images/bg.png" alt="">
                    </div>

                    <div id="main-recommand-content">
                        	향수 간단 소개말
                    </div>
                </div>

                <hr>
                
                <div id="sub-recommand-area">
                    <div>
                        다른 추천 향수
                    </div>
                    <div id="sub-recommand-wrap">
                        <div class="sub-recommand">
                            <div id="sub-recommand-img">
                                <img src="resources/images/bg.png" alt="">
                            </div>

                            <div id="sub-recommand-title">
                                향수 이름1
                            </div>
                        </div>
                        <div class="sub-recommand">

                            <div id="sub-recommand-img">
                                <img src="resources/images/bg.png" alt="">
                            </div>

                            <div id="sub-recommand-title">
                                향수 이름1
                            </div>
                        </div>
                        <div class="sub-recommand">

                            <div id="sub-recommand-img">
                                <img src="resources/images/bg.png" alt="">
                            </div>

                            <div id="sub-recommand-title">
                                향수 이름1
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(function(){
            $("#recommand-start").click(function(){
                $(".active").toggleClass("active");
                $("#qna-area").toggleClass("active");
                $("#progress-bar-current").css("width", 100/9+"%");
                $("#qna1").addClass("active");
            });

            $(".answer-btn").click(function(){
                $(this).parents(".qna").removeClass("active");
                $(this).parents(".qna").next().addClass("active");
                

                let questionNo = $(this).parents(".qna").attr("id");
                let progress = 0;

                switch(questionNo) {
                case "qna1":
                    progress = 2/9;
                break;

                case "qna2":
                    progress = 3/9;
                break;

                case "qna3":
                    progress = 4/9;
                break;

                case "qna4":
                    progress = 5/9;
                break;

                case "qna5":
                    progress = 6/9;
                break;

                case "qna6":
                    progress = 7/9;
                break;

                case "qna7":
                    progress = 8/9;
                break;

                case "qna8":
                    progress = 1;
                break;

                case "qna9":

                    $("#progress-bar-current").css("width", "0%");
                    $("#progress").text("0%");

                    const startTime = performance.now();

                    $.ajax({
                        url : "test.rc",
                        type : "post",
                        beforeSend: function() {
                            updateProgressBar($("#progress"), 25);
                        },
                        success : function (list) {
                            const endTime = performance.now();
                            const networkTime = endTime - startTime;

                            updateProgressBar($("#progress"), 50);

                            // 렌더링 시작 시간
                            const renderStartTime = performance.now();

                            // 화면에 데이터 렌더링

                            // 렌더링 완료 시간
                            const renderEndTime = performance.now();
                            const renderTime = renderEndTime - renderStartTime;

                            updateProgressBar($("#progress"), 75);
                            
                            // 로딩 완료
                            setTimeout(() => {
                                updateProgressBar($("#progress"), 100);
                            }, 300); // 약간의 지연 시간 후 완료 표시

                            setTimeout(() => {
                                $("#result-loding").toggleClass("active");
                                $("#result-data").addClass("active");
                            }, 3000); // 약간의 지연 시간 후 완료 표시

                        } ,
                        error : function () {
                            
                        } 
                    });

                    $(".active").toggleClass("active");
                    $("#qna-result").toggleClass("active");
                    $("#result-loding").toggleClass("active");
                    break;
                default:
                }

                $("#progress-bar-current").css("width", progress*100+"%");

            });
        });

        function updateProgressBar(element, width) {
            element.css("width", width + '%');
            element.text(width+"%");
        }
    </script>


</body>
</html>