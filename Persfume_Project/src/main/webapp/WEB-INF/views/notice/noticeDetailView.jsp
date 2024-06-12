<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
 <style>
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
        body {
            font-family: Arial, sans-serif;
            padding: 40px;
        }
        .container {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
           /* box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);*/
            margin-bottom: 20px;
        }
        
        .title h2 {
            font-size: 32px;
            font-weight: bold;
            color: #333; /* 제목 색상 추가 */
    
            text-align: center;
            margin-bottom: 20px;
            
        }
        .table th {

            background-color: #FAFAFA;
        }
       
        .navigation th {
            font-weight: bold;
            color: #333;
            text-align: left;
            background-color: #FAFAFA; /* 배경색을 변경하세요 */
        }
       
        
        .subject {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
   
        }
            

        .small-text {
            font-size: 16px;
            color: #666; /* 이전글 및 다음글 색상 변경 */
        }
        .meta {
            list-style: none;
            padding: 0;
            margin: 0;
            font-size: 14px;
        }
        .meta li {
            display: inline-block;
            margin: 0;
            padding: 0 6px;
            vertical-align: top;
            line-height: 28px;
            height: 28px;
            color: #666; /* 작성일과 조회수 부분의 스타일 변경 */
        }
        .content {
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #ccc;
        }
        .content p {
            font-size: 16px;
            color: #666;
            line-height: 1.6;
            margin-bottom: 10px;
        }
        .center-text {
            text-align: center;
        }
        .content img {
            display: block;
            margin: 0 auto;
            width: 80%;
        }
        .buttons {
            margin-top: 20px;
            text-align: center;
           
   
        }
       .btn {
    display: inline-block;
    padding: 8px 20px;
    font-size: 16px;
    border-radius: 5px;
    text-decoration: none;
    color: #fff;
    margin-right: 10px;
    border: 1px solid #007bff; /* 버튼 테두리 실선 추가 */
    background-color: #007bff; /* 버튼 배경색 추가 */
}

.btn-normal {
    padding: 6px 8px;
    font-size: 13px;
    background-color: #fff;
    color: #333;
}

.btn:hover {
    background-color: #fff; /* 마우스 오버 시 배경색 변경 */
 
}

      
        .navigation th, .navigation td {
            font-weight: bold;
            color: #333;
            text-align: left;
        }
        .navigation th {
            width: 20%;
        }
        .navigation td {
            width: 80%;
        }
        .navigation a {
            color: #007bffbb;
            text-decoration: none;
        }
        .navigation a:hover {
            text-decoration: underline;
        }
         /* 여기에 공통 스타일 작성 */

        /* 이전글과 다음글 테이블 스타일 */
        .navigation {
            width: 100%;
            border-collapse: collapse;
        }
        .navigation th,
        .navigation td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        
        
         /* 기존 스타일 유지 */
        .content-area,
        .content-area>div:not(.content-main){
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        /* 공통 스타일 */
        /* 기존 스타일 유지 */

       /* 추가한 스타일 */
        .attachment {
            display: flex;
            justify-content: flex-end;
            margin-top: 20px;
        }

        .attachment a {
            margin-left: 20px;
            font-size: 18px;
            color: #007bff;
            text-decoration: none;
        }

        /* 추가한 스타일: 구분선 */
        .divider {
            border-top: 1px solid #ccc;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        /* 추가한 스타일: 구분선 */
        .divider {
            border-top: 1px solid #ccc;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        
      
    </style>
</head>
<body>
  <jsp:include page="../common/header.jsp" />
    <div class="content-area">
        <div class="content-title" id="home">NOTICE</div>
<div class="container">
    <div class="title">
        <h2>공지사항</h2>
    </div>
    <table class="table">
        <tbody>
            <tr>
                <th>제목</th>
                <td class="subject">${ n.noticeTitle }</td>
               
            </tr>
            <tr>
                <td colspan="2">
                    <ul class="meta">
                        <li><strong>작성일:</strong> <span>${n.createDate}</span></li>
                        <li><strong>조회수:</strong> <span>${n.count }</span></li>
                         <li><strong>첨부파일: </strong>
                         <c:choose>
	                    	<c:when test="${ empty requestScope.n.noticeImgOrigin }">
	                    		첨부파일이 없습니다.
	                    	</c:when>
	                    	<c:otherwise>
                         <a href="${ requestScope.b.changeName }" 
                         download="${ requestScope.n.noticeImgOrigin }">${ requestScope.n.noticeImgOrigin }
                         </a>
                         </li>
                         </c:otherwise>
                        </c:choose>
                    </ul>
                    <div class="content">
                        <p class="center-text">${n.noticeContent }</p>
                   
                    </div>
                </td>
                  
            </tr>
        </tbody>
    </table>
      
    
  <br>
    <div class="buttons">
        <a href="list.no" class="btn btn-normal">목록</a>
        <a onclick="postFormSubmit(1)" class="btn btn-normal">수정</a>
        <a onclick="postFormSubmit(2)" class="btn btn-normal">삭제</a>
        
        <c:if test="${ (not empty sessionScope.loginUser) and (sessionScope.loginUser.userId eq requestScope.b.boardWriter) }">
            <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->
	                <!-- 
	                	* 기존의 수정하기, 삭제하기 요청을 GET 방식으로 보냈었음!!
	                	> 쿼리스트링을 조작하여 내가 쓴 게시글이 아니더라도 수정, 삭제가 가능해짐
	                	> 수정하기, 삭제하기 요청을 POST 방식으로 보내면 해결 가능함
	                -->
	  
	   	<a onclick="postFormSubmit(2)" class="btn btn-normal">삭제</a>
        <a href="updateForm.no"  onclick="postFormSubmit(2)" class="btn btn-normal">수정</a>
    </div>
    <br>			</c:if>
    
           <form id="postForm" action="" method="post">
	            	<!-- 수정하기든, 삭제하기든 간에 글번호를 넘겨줘야함 -->
	            	<input type="hidden" name="nno" value="${ requestScope.n.noticeNo }">
	            	<!-- 삭제 요청 시 첨부파일의 수정파일명을 같이 보내기 -->
	            	<input type="hidden" name="filePath" value="${ requestScope.n.noticeImgChange }" >
	            </form>
	            
    	          <script>
			    function postFormSubmit(num) {
			        //console.log("호출됨", num);
			        if (num == 1) { // 수정하기 클릭 시
			            $("#postForm").attr("action", "updateForm.no")
			            			.submit();
			        } else { // 삭제하기 클릭 시
			            if (confirm("게시글을 정말 삭제하시겠습니까?")) { // 사용자에게 확인 메시지 표시
			                $("#postForm").attr("action", "delete.no").submit();
			                (confirm("게시글을 삭제했습니다."))
			            } else {
			                // 사용자가 취소를 선택한 경우 아무런 동작도 하지 않음
			            }
			        }
    }
</script>

	            

			</div>
			
			<br><br><br>
   <table class="table navigation">
    <tbody>
        <tr>
            <th>이전글</th>
            <td class="small-text">
                <c:if test="${not empty prevArticle}">
                    <a href="detail.no?nno=${prevArticle.noticeNo}">
                        ${prevArticle.noticeTitle}
                    </a>
                </c:if>
            </td>
        </tr>
        <tr>
            <th>다음글</th>
            <td class="small-text">
                <c:if test="${not empty nextArticle}">
                    <a href="detail.no?nno=${nextArticle.noticeNo}">
                        ${nextArticle.noticeTitle}
                    </a>
                </c:if>
            </td>
        </tr>
    </tbody>
</table>

</div>

    <jsp:include page="../common/footer.jsp" />
    
</body>
</html>