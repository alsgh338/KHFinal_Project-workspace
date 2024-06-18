<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    .font {
        font-family: "Nanum Gothic", sans-serif;
    }
    
    .content-title {
        height: 320px;
        background-color: #0c263f;
        background-size: cover;
        background-position: center;
        object-fit: cover;
        text-align: center;
        line-height: 320px;
        font-size: 50px;
        text-shadow: 1px 1px black, -1px 1px black, 1px -1px black, -1px -1px
            black;
        color: white;
        width: 100%;
    }
    
    .content-subtitle, .content-main {
        width: 1400px;
    }
    
    .content-subtitle {
        line-height: 150px;
        font-size: 30px;
        font-weight: 600;
    }
    
    .content-main {
        display: inline-block;
        text-align: center;
    }
    
    #outer {
        width: 100%;
        height: 800px;
        border: 1px solid red;

        margin: auto;
        box-sizing: border-box;
        text-align: center; /* 버튼을 가운데로 정렬하기 위한 설정 */
    }

    #classList, #classAboutList {
        float: left;
        width: 50%; /* 좌우로 반씩 나누기 */
        padding: 10px; /* 내부 여백 설정 */
        box-sizing: border-box; /* 내부 여백을 포함한 전체 너비 설정 */
    }
    
    </style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<div class="content-title" id="home"></div>

<div id="outer">
    <div id="classList">
        
        <c:forEach var="OneClassRegist" items="${classList}">
            <div id="class">
                클래스예약번호 : <span id="registNo">${OneClassRegist.registNo}</span>
                <a href="" class="cancel-link">예약 취소</a>
                <form method="post" action="cansle.me" class="cansleClass">
                    <input type="hidden" name="registNo" value="">
                </form>
             </div>
         </c:forEach>

    </div>
    <div id="classAboutList">
        <c:forEach var="OneClass" items="${classAboutList}">
            <span>${OneClass.className}</span> | 
            <span>${OneClass.startTime}</span>    
         <br>
         </c:forEach>
    </div>
</div>

</div>

<script>
    $(document).ready(function() {
        $('.cancel-link').on('click', function(event) {
            event.preventDefault();
            // 클릭된 링크의 기본 동작(페이지 이동)을 막음

            let registNo = $(this).parent().find("#registNo").text().trim();
            // 클릭된 요소의 부모 요소 내의 #registNo 요소의 텍스트 값을 가져와서 공백 제거 후 registNo 변수에 저장

            let form = $(this).parent().find(".cansleClass");
            // 클릭된 요소의 부모 요소 내의 .cansleClass 폼을 찾음

            form.find('input[name="registNo"]').val(registNo);
            // 폼의 hidden input 요소에 registNo 값을 설정

            console.log(registNo);

           // form.submit();
           
        });
    });


//     $(document).ready(function() {
//     $('.cancel-link').on('click', function(event) {
//         event.preventDefault();
//         // 클릭된 링크의 기본 동작(페이지 이동)을 막음

//         // 클릭된 링크에 해당하는 클래스 예약 번호 가져오기
//         let registNo = $(this).siblings("#registNo").text().trim();

//         let form = $(this).siblings(".cansleClass");
//         // 클릭된 링크의 형제 요소 중에서 .cansleClass 폼을 찾음

//         form.find('input[name="registNo"]').val(registNo);
//         // 폼의 hidden input 요소에 registNo 값을 설정

//         console.log(registNo);

//         // form.submit();
//     });
// });


</script>


</body>
</html>