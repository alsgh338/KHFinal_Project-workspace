<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 40px;
        }
        .content-area,
        .content-area>div:not(.content-main) {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }
        .content-title {
            height: 320px;
            background: url(resources/images/공지사항.jpg);
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
        .container {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
        }
        .title h2 {
            font-size: 32px;
            font-weight: 500;
            line-height: 42px;
            height: 50px;
            font-weight: 400;
            background: none !important;
            padding: 0 !important;
        }
        .subject {
            padding: 18px 15px;
            border-top: 1px solid #e8e8e8;
            color: #333;
            vertical-align: middle;
            word-break: keep-all;
            word-wrap: break-word;
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
            color: #666;
        }
        th {
            padding: 18px 0;
            border: 2px solid #e8e8e8;
            border-bottom-width: 0;
            border-right-width: 0;
            color: #999;
            font-weight: normal;
            background-color: #fafafa;
            vertical-align: middle;
            width: 230px;
            height: 56.92px;
            border-left: 0;
        }
        td {
            padding: 18px 15px;
            border-top: 1px solid #e8e8e8;
            color: #333;
            vertical-align: middle;
            word-break: keep-all;
            word-wrap: break-word;
        }
        .content {
            margin-top: 20px;
            padding-top: 20px;
            border-top: 1px solid #ccc;
            margin-bottom: 1px; /* 내용 아래 여백 추가 */
        }
        .content p {
            font-size: 16px;
            color: #666;
            line-height: 1.6;
            margin-bottom: 10px;
        }
        .content img {
            max-width: 100%;
            height: auto;
            display: block;
            margin: 0 auto;
        }
        .center-text {
            text-align: center;
        }
        .divider {
            border-top: 1px solid #ccc; /* 구분선의 두께와 색상을 조정 */
            margin-top: 100px; /* 구분선 위 여백 추가 */
            margin-bottom: 20px; /* 구분선 아래 여백 추가 */
            width: 1000px; /* 가로 길이를 100%로 설정하여 전체 너비에 맞춤 */
        }
        .btn-normal {
            width: 102px;
            display: inline-block;
            padding: 10px 20px; /* 버튼 크기와 간격을 조정 */  
            font-size: 13px;
            line-height: 17px;
            font-weight: normal;
            text-decoration: none;
            vertical-align: middle;
            word-spacing: -0.5px;
            letter-spacing: 0;
            text-align: center;
            white-space: nowrap;
            color: #333;
            background-color: #fff;
            border: 1px solid #d1d1d1;
            border-radius: 3px;
            margin-right: 10px; /* 버튼 사이에 여백을 추가합니다 */
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
                        <th scope="row" style="text-align: center;">제목</th>
                        <td class="subject">${ n.noticeTitle }</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <ul class="meta">
                                <li><strong>작성일:</strong> <span>${ n.createDate }</span></li>
                                <li><strong>조회수:</strong> <span>${ n.count }</span></li>
                                <li><strong>첨부파일:</strong>
                                        <c:choose>
                                        <c:when test="${ empty requestScope.n.noticeImgOrigin }">
                                            첨부파일이 없습니다.
                                        </c:when>
                                        <c:otherwise>
                                            <a href="${ requestScope.n.noticeImgChange }" download="${ requestScope.n.noticeImgOrigin }">${ requestScope.n.noticeImgOrigin }</a>
                                        </c:otherwise>
                                    </c:choose>
                                </li>
                            </ul>
                            <div class="content">
                                <c:choose>
                                    <c:when test="${ not empty requestScope.n.noticeImgChange }">
                                      <img src="${ requestScope.n.noticeImgChange }" alt="공지사항 이미지">
                                         <p class="center-text">${ n.noticeContent }</p>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="center-text">${ n.noticeContent }</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="divider"></div>
            <div class="buttons">
                <a href="list.no" class="btn-normal">목록</a>
                <%-- 
                <a onclick="postFormSubmit(1)" class="btn-normal">수정</a>
                <a onclick="postFormSubmit(2)" class="btn-normal">삭제</a>
                --%>
            </div>
            <form id="postForm" action="" method="post">
                <input type="hidden" name="nno" value="${ requestScope.n.noticeNo }">
                <input type="hidden" name="filePath" value="${ requestScope.n.noticeImgChange }">
            </form>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp" />
    <script>
        function postFormSubmit(num) {
            if (num == 1) {
                $("#postForm").attr("action", "updateForm.no").submit();
            } else {
                if (confirm("게시글을 정말 삭제하시겠습니까?")) {
                    $("#postForm").attr("action", "delete.no").submit();
                    confirm("게시글을 삭제했습니다.");
                } else {
                    // 사용자가 취소를 선택한 경우 아무런 동작도 하지 않음
                }
            }
        }
    </script>
</body>
</html>
