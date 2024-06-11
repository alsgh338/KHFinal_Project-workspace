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
        }
        .btn-normal {
            padding: 6px 8px;
            border: 1px solid #d1d1d1;
            font-size: 13px;
            background-color: #fff;
            color: #333;
        }
        .btn-normal:hover {
            border-color: #111;
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
        
        
        
    </style>
    <jsp:include page="../common/header.jsp" />
</head>
<body>

<div class="container">
    <div class="title">
        <h2>공지사항</h2>
    </div>
    <table class="table">
        <tbody>
            <tr>
                <th>제목</th>
                <td class="subject">퍼스퓸 입점</td>
            </tr>
            <tr>
                <td colspan="2">
                    <ul class="meta">
                        <li><strong>작성일:</strong> <span>2024-06-05</span></li>
                        <li><strong>조회수:</strong> <span>23</span></li>
                    </ul>
                    <div class="content">
                        <p class="center-text">안녕하세요, 퍼스퓸 입니다.</p>
                        <img src="img/NoticePersfume.png" alt="Perfume">
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
    <div class="buttons">
        <a href="/board/notice/8/?page=2" class="btn btn-normal">목록</a>
        <a href="#none" onclick="postFormSubmit(1)" class="btn btn-normal">삭제</a>
        <a href="/board/gallery/modify.html?board_act=edit&amp;no=87994&amp;board_no=8&amp;page=2" class="btn btn-normal">수정</a>
    </div>
    <br>
    <table class="table navigation">
        <tbody>
            <tr>
                <th>이전글</th>
                <td class="small-text"><a href="#none" onclick="BOARD_READ.file_download('/exec/front/Board/download/?no=87994&amp;realname=2023/06/01/ef50ebd55198f00a8a15bc3566b025ae.jpg&amp;filename=230601_공지사항_th.jpg');">230601_공지사항_퍼스퓸 4월 신상jpg</a></td>
            </tr>
            <tr>
                <th>다음글</th>
                <td class="small-text"><a href="#none" onclick="BOARD_READ.file_download('/exec/front/Board/download/?no=87994&amp;realname=2023/06/01/ef50ebd55198f00a8a15bc3566b025ae.jpg&amp;filename=230601_공지사항_th.jpg');">230601_공지사항_퍼스퓸 6월 신상.jpg</a></td>
            </tr>
        </tbody>
    </table>
</div>

    <jsp:include page="../common/footer.jsp" />
    
</body>
</html>