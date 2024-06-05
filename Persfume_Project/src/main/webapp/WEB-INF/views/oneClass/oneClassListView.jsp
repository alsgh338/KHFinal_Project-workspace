<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
       /* div:not(#header, #header *, .oneday-class, .content-main, .oneday-class *){
          display: flex;
          flex-direction: column;
          justify-content: center;
          align-items: center;
        } */
        
        .content-area,
        .content-area>div:not(.content-main){
          display: flex;
          flex-direction: column;
          justify-content: center;
          align-items: center;
        }

        /* 여기서부턴 공통 스타일? (아마도) */

        .content-title{
            height: 320px;
            background: url(resources/images/class_title.jpg);
            background-size: cover;
            background-position: center;
            object-fit: cover;
            text-align: center;
            line-height: 320px;
            font-size: 50px;
            text-shadow: 1px 1px black, -1px 1px black, 1px -1px black, -1px -1px black;
            color: white;
            width: 100%;
        }

        .content-subtitle,
        .content-main
        {
            width: 1400px;
        }
        

        .content-subtitle{
            line-height: 150px;
            font-size: 30px;
            font-weight: 600;
        }

        .content-main{
            display: inline-block;
            text-align: center;
        }

        /* 여기서부턴 개별 스타일? (아마도) */

        .oneday-class{
            display: inline-block;
            width: 400px;
            height: 600px;
            /* border: 1px solid blue; */
            margin: 15px 15px;
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

        .oneday-class *:not(.class-teacher *) {
            /* border: 1px solid green; */
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
            height: 20%;
            line-height: 90px;
            font-size: 35px;
        }

        .oneday-class .class-price{
            font-size: 25px;
            text-align: right;
        }

        .oneday-class .class-teacher{
            font-size: 15px;
            line-height: 35px;
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
            background-color: rgb(120, 206, 235);
            color: white;
            border-radius: 5px;
            font-size: 15px;
            font-weight: 700;
        }

        .oneday-class .class-data{
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
            height: 10%;
        }

</style>


</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
    <div class="content-area">
        <div class="content-title" id="home">ONEDAY CLASS</div>
        <div class="content-subtitle">LIST</div>
        <div class="content-main">

            <div class="">정렬이나 검색바 들어갈 자리</div>

			<div class="oneday-class">
                <div class="class-img">
                    <img src="resources/images/class_title.jpg" alt="">
                </div>

                <div class="class-data">
                    <div class="class-teacher">
                        <div class="teacher-img">
                            <img src="resources/images/bg.png" alt="">
                        </div>
                        공건희 강사
                    </div>
                    <div class="student_cnt">인원 : 1 / 10</div>
                </div>
                
                <div class="class-title">원데이 클래스</div>

                <div class="class-data">
                    <div class="class-location">사랑시 고백구 행복동</div>
                    <div class="class-price">19,000원</div>
                </div>
            </div>

            <div class="oneday-class">
                <div class="class-img">
                    <img src="resources/images/class_title.jpg" alt="">
                </div>

                <div class="class-data">
                    <div class="class-teacher">
                        <div class="teacher-img">
                            <img src="resources/images/bg.png" alt="">
                        </div>
                        공건희 강사
                    </div>
                    <div class="student_cnt">인원 : 1 / 10</div>
                </div>
                
                <div class="class-title">원데이 클래스</div>

                <div class="class-data">
                    <div class="class-location">사랑시 고백구 행복동</div>
                    <div class="class-price">19,000원</div>
                </div>
            </div>
            
            			<div class="oneday-class">
                <div class="class-img">
                    <img src="resources/images/class_title.jpg" alt="">
                </div>

                <div class="class-data">
                    <div class="class-teacher">
                        <div class="teacher-img">
                            <img src="resources/images/bg.png" alt="">
                        </div>
                        공건희 강사
                    </div>
                    <div class="student_cnt">인원 : 1 / 10</div>
                </div>
                
                <div class="class-title">원데이 클래스</div>

                <div class="class-data">
                    <div class="class-location">사랑시 고백구 행복동</div>
                    <div class="class-price">19,000원</div>
                </div>
            </div>

            <div class="oneday-class">
                <div class="class-img">
                    <img src="resources/images/class_title.jpg" alt="">
                </div>

                <div class="class-data">
                    <div class="class-teacher">
                        <div class="teacher-img">
                            <img src="resources/images/bg.png" alt="">
                        </div>
                        공건희 강사
                    </div>
                    <div class="student_cnt">인원 : 1 / 10</div>
                </div>
                
                <div class="class-title">원데이 클래스</div>

                <div class="class-data">
                    <div class="class-location">사랑시 고백구 행복동</div>
                    <div class="class-price">19,000원</div>
                </div>
            </div>
            
            			<div class="oneday-class">
                <div class="class-img">
                    <img src="resources/images/class_title.jpg" alt="">
                </div>

                <div class="class-data">
                    <div class="class-teacher">
                        <div class="teacher-img">
                            <img src="resources/images/bg.png" alt="">
                        </div>
                        공건희 강사
                    </div>
                    <div class="student_cnt">인원 : 1 / 10</div>
                </div>
                
                <div class="class-title">원데이 클래스</div>

                <div class="class-data">
                    <div class="class-location">사랑시 고백구 행복동</div>
                    <div class="class-price">19,000원</div>
                </div>
            </div>

            <div class="oneday-class">
                <div class="class-img">
                    <img src="resources/images/class_title.jpg" alt="">
                </div>

                <div class="class-data">
                    <div class="class-teacher">
                        <div class="teacher-img">
                            <img src="resources/images/bg.png" alt="">
                        </div>
                        공건희 강사
                    </div>
                    <div class="student_cnt">인원 : 1 / 10</div>
                </div>
                
                <div class="class-title">원데이 클래스</div>

                <div class="class-data">
                    <div class="class-location">사랑시 고백구 행복동</div>
                    <div class="class-price">19,000원</div>
                </div>
            </div>

           



        </div>
    </div>

    <script>
        $(function(){
            $(".oneday-class").hover(function(){
                $(this).toggleClass("onHover");
                console.log("히히");
            });

        });


    </script>
	
	<jsp:include page="../common/footer.jsp"/>

</body>
</html>