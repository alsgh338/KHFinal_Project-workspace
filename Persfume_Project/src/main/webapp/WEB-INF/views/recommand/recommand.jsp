<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="resources/js/recommand.js" charset="UTF-8"></script>
    
    <style>

        /* 공통 스타일 영역 */
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;;
        }

        html,body{
            margin: 0;
            padding: 0;
            background: #4568DC;  /* fallback for old browsers */
            background: -webkit-linear-gradient(to right, #B06AB3, #4568DC);  /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to right, #B06AB3, #4568DC); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
        }

        body>div{
            display:flex;
            margin: auto;
            border: 1px solid red;
            width: 60%;
            background-color: white;
            border-radius: 15px;
            box-shadow: #ddd 0 0 5px 2px;
            margin-bottom: 20px;   
            padding: 30px 0;
            animation : fade-in 1.0s ease-out;
        }
        
        /* 헤더 영역 스타일 */
        
        #recommand-top{
            display: flex;
            justify-content: space-around;
            align-items: center;
            height: 100px;
        }

        #recommand-top>.top-btn{
            height: 40px;
            width: 40px;
        }

        #recommand-top>.top-btn img{
            object-fit: cover;
            width: 100%;
            height: 100%;
        }

        #recommand-top>#recommand-title{
            font-size: 40px;
            font-weight: 900;
        }
        
        hr{
            width: 90%;
            border: 0px solid;
            height: 2px;
            background-image: linear-gradient(to right, rgba(0, 0, 0, 0), rgba(0, 140, 186, 0.75), rgba(0, 0, 0, 0));
            margin: 32px 0px;
            display: block;
        }

        hr::before{
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

        span{
            color: blue;
            font-weight: 700;
        }

        /* Main 영역 스타일 */
        #main{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 30px;
        }

        #main>#welcome-section1{
            font-size: 60px;
            font-weight: 900;
        }

        #main>div:not(#welcome-section1){
            font-size: 25px;
            font-weight: 500;
        }

        #main button{
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

        #main button:hover{
            background-color: blue;
            color: white;
        }


        /* QNA 영역 스타일 */
        #qna,
        #result{
            display: none;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 15px;
            padding: 15px 0;
        }

        #progress,
        #result-progress{
            position: relative;
            width: 60%;
            height: 15px;
            background-color: white;
            border-radius: 15px;
            border: 0.5px solid black;
        }

        #progress-bar,
        #result-progress-bar{
            position: relative;
            height: 15px;
            background: #4568DC;  /* fallback for old browsers */
            background: -webkit-linear-gradient(to right, #B06AB3, #4568DC);  /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to right, #B06AB3, #4568DC); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
            border-radius: 15px;
        }
        
        #progress-bar{transition: all .3s ease;}
        
        #result-progress-bar{transition: all .5s ease;}

        #qna-question{
            text-align: center;
            font-size: 30px;
            margin: 10px 0;
        }
        #qna-answer{
            width: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 30px;
        }

        .answerList{
            width: 90%;
            height: 80px;
            background-color: white;
            border-radius: 15px;
        }

        .answerList:hover{
            background-color: blue;
            color: white;
            cursor: pointer;
        }

        /* 결과 영역 스타일 */

        #result div{
            text-align: center;
            width: 90%;
        }

        #result-loading,
        #result #result-main-img,
        #result #result-main{
            display: flex;
        }

        #result-data{
            display:none;
        }
        

        #result>div,
        #result>#result-data>div,
        #result #result-main-img,
        #result #result-main{
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        #result #result-main-title,
        #result #result-text{
            font-size: 35px;
            font-weight: 800;
        }
        #result #result-main-img,
        #result #result-main-img>img{
            width: 90%;
            object-fit: cover;
        }

        #result #result-main-content{
            font-size: 25px;
            font-weight: 600;
        }


        /* 애니메이션 선언부 */
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

        .fade-In{
            animation: fade-in;
            animation-duration: 1.0s;
        }
        .fade-Out{
            animation: fade-out;
            animation-duration: .3s;
        }


    </style>
</head>
<body>
    <div id="recommand-top">
        <div class="top-btn" id="home-btn">
            <a href="${pageContext.request.contextPath}">
                <img src="resources/images/house.svg" alt="홈버튼">
            </a>
        </div>

        <div id="recommand-title">
            SCENT RECOMMAND
        </div>

        <div class="top-btn" id="btn2">
            <a href="myPage.me">
                <img src="resources/images/person-circle.svg" alt="마이페이지 버튼">
            </a>
        </div>
    </div>

    <div class="recommand-section" id="main">
        <div id="welcome-section1">
            Match Your Scent <br>
            to Your Personality
        </div>

        <hr>
        <div id="welcome-section2">
            반갑습니다 <span>${sessionScope.loginMember.memName }</span>님 <br>
        </div>

        <div id="welcome-section3">
            몇 가지 질문을 통해 당신에 어울리는 향수를 추천해드립니다.
        </div>

        <br><br><br>

        <button id="recommand-start" onclick="startTest();">Start</button>

    </div>

    <div class="recommand-section" id="qna">
        <div id="progress">
            <div id="progress-bar"></div>
        </div>
        <div id="qna-question"></div>
        <div id="qna-answer"></div>
    </div>

    <div class="recommand-section" id="result">
        <div id="result-loading">
            <div id="result-loading-progress">
                결과 찾는 중
            </div>
            <div id="result-progress">
                <div id="result-progress-bar"></div>
            </div>                
        </div>
        <div id="result-data">
            <div id="result-text">
                <span>xxx</span>님의 향수는...
            </div>
            <div id="result-main">
                <div id="result-main-title">
                    향수 이름
                </div>
                <div id="result-main-img">
                </div>
                <div id="result-main-content">
                    향수 간단 소개말
                </div>
            </div>
            <div id="result-sub"></div>
        </div>


    </div>


    <script>
        const main = document.querySelector("#main");
        const qna = document.querySelector("#qna");
        const result = document.querySelector("#result");
        const selected = [];
        let scentAnswer = "";
        let genderAnswer ="";
        let categoryAnswer ="";
        let reviewStart = "";
        let reviewEnd = "";
        let priceStart = "";
        let priceEnd = "";

        function startTest(){
            // main.style.WebkitAnimation = "fade-out .3s ease";
            main.style.animation = "fade-out 0.5s ease-out";

            setTimeout(()=>{
                // qna.style.WebkitAnimation = "fade-in .3s ease";
                qna.style.animation = "fade-in 0.5s ease-out";
                setTimeout(()=>{
                    main.style.display = "none";
                    qna.style.display="flex";
                },450)
                let qIndex = 0;
                goNext(0);
            },0);
        }

        function goNext(qIndex){
            console.log(qIndex);
            if(qIndex === 9){
                goResult();
            } else{
                var q = document.querySelector("#qna-question");
                q.innerHTML = qnaList[qIndex].q;

                for(let i in qnaList[qIndex].a){
                    addAnswer(qnaList[qIndex].a[i].answer, qIndex, i);
                }

                var progress = document.querySelector('#progress-bar');
                progress.style.width=(100/9) * (qIndex+1) + '%';
            }

            
        }

        function addAnswer(answerText, qIndex, idx){
            var a = document.querySelector('#qna-answer');
            var answer = document.createElement('button');
            answer.classList.add('answerList');
            answer.classList.add('fade-In');

            a.appendChild(answer);
            answer.innerHTML = answerText;

            answer.addEventListener("click",function(){
                var children = document.querySelectorAll('.answerList');
                
                for(let i = 0; i<children.length;i++){
                    children[i].style.animation = "fade-out .5s ease-out";
                    children[i].disabled=true;            
                }
                setTimeout(()=>{
                    selected[qIndex] = idx;
                    for(let i = 0; i < children.length; i++){
                        children[i].style.display = 'none';
                    }
                    goNext(++qIndex);
                },300)
            },false);
        }

        function goResult(){
            qna.style.animation = "fade-out 0.5s ease-out";
            console.log(selected);
            calcResult();

            setTimeout(()=>{
                result.style.animation = "fade-in 0.5s ease-out";
                setTimeout(()=>{
                    qna.style.display = "none";
                    result.style.display="flex";
                },450)

                
            },0);
            
            updateProgressBar($("#result-progress-bar"), 0);
            const startTime = performance.now();

            $.ajax({
                url : "result.rc",
                type : "post",
                beforeSend: function() {
                    // updateProgressBar($("#result-progress-bar"), 25);
                    setTimeout(()=>{
                        updateProgressBar($("#result-progress-bar"), 25);
                    },500);
                },
                data : {
                    scentAnswer : scentAnswer,
                    genderAnswer : genderAnswer, 
                    categoryAnswer : categoryAnswer ,
                    reviewStart : reviewStart,
                    reviewEnd : reviewEnd,
                    priceStart : priceStart,
                    priceEnd : priceEnd,
                    memNo : 3/*${ sessionScope.loginUser.memNo}*/,
                },
                success : function(result){
                	console.log(result);
                    const endTime = performance.now();
                    const networkTime = endTime - startTime;

                    setTimeout(()=>{
                        updateProgressBar($("#result-progress-bar"), 50);
                    },1000);
                    const renderStartTime = performance.now();

                    //여기서 화면에 그리기 시작
                    $("#result-main-title").text(result.productName);
                    $("#result-main-img").html("<img src = 'resources/uploadFiles/"+result.productImgPath+"' alt='추천 향수'>");
                    $("#result-main-content").text(result.productExplain);

                    //여기서 화면에 그리기 종료
                    const renderEndTime = performance.now();
                    const renderTime = renderEndTime - renderStartTime;
                    setTimeout(()=>{
                        updateProgressBar($("#result-progress-bar"), 75);
                    },1500);

                    // 로딩 완료
                    setTimeout(() => {
                        updateProgressBar($("#result-progress-bar"), 100);
                    }, 2000); // 약간의 지연 시간 후 완료 표시

                    setTimeout(() => {
                        document.querySelector("#result-loading").style.animation= "fade-out 0.5s ease-out";
                        setTimeout(()=>{
                            document.querySelector("#result-data").style.animation = "fade-in 0.5s ease-out";
                            setTimeout(()=>{
                                document.querySelector("#result-loading").style.display = "none";
                                document.querySelector("#result-data").style.display="flex";
                            },450)
                        })
                    }, 3000); // 약간의 지연 시간 후 완료 표시
                    
                },
                error : function(){}
            });

        }


        function updateProgressBar(element, width) {
            // element.style.width = width+"%"
            element.css("width", width + '%');
            console.log(width + "로 이동함");
        }

        function calcResult(){

            var pointArray = [
                { name : '플로럴', value : 0, key : 0},
                { name : '시트러스', value : 0, key : 1},
                { name : '우디', value : 0, key : 2},
                { name : '머스크', value : 0, key : 3},
                { name : '파우더리', value : 0, key : 4},
                { name : '코튼', value : 0, key : 5},
                { name : '프루티', value : 0, key : 6},
                { name : '오리엔탈', value : 0, key : 7},
                { name : '아쿠아', value : 0, key : 8},
            ]

            for(let i =0 ; i < 9 ; i++){
                if(i == 0){
                    genderAnswer = qnaList[i].a[selected[i]].type[0];
                } else if (i == 6){
                    categoryAnswer = qnaList[i].a[selected[i]].type[0];
                } else if (i == 7) {
                    reviewStart = qnaList[i].a[selected[i]].type[0];
                    reviewEnd = qnaList[i].a[selected[i]].type[1];

                } else if (i == 8){
                    priceStart = qnaList[i].a[selected[i]].type[0];
                    priceEnd = qnaList[i].a[selected[i]].type[1];
                } else {
                    var target = qnaList[i].a[selected[i]];
                    for(let j = 0; j < target.type.length; j++){
                        for(let k = 0; k <pointArray.length; k++){
                            if(target.type[j] === pointArray[k].name){
                                pointArray[k].value += 1;
                            }
                        }
                    }

                }
            }

            var resultArray = pointArray.sort(function (a,b){
                if(a.value > b.value){
                    return -1;
                }
                if(a.value < b.value){
                    return 1;
                }
                return 0;
            });

            let resultword = resultArray[0].name;
            scentAnswer = resultword;


        }


    </script>
    
</body>
</html>