<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style>
        .content-area, .content-area>div:not(.content-main) {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .content-title {
            height: 320px;
            background: url(resources/images/class_title.jpg);
            background-size: cover;
            background-position: center;
            text-align: center;
            line-height: 320px;
            font-size: 50px;
            text-shadow: 1px 1px black, -1px 1px black, 1px -1px black, -1px -1px black;
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

        .bbs-tit h3 {
            float: left;
            font-size: 16px;
            color: #000;
            font-weight: bold;
            line-height: 30px;
            padding: 20px;
        }
        .bbs-sch {
            padding: 20px;
            float: right;
            margin-top: 10px;
        }

        html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, input, textarea, p, blockquote, th, td, img {
            margin: 0;
            padding: 0;
        }

        body, h1, h2, h3, h4, h5, h6, table, pre, xmp, plaintext, listing, input, textarea, select, button, a {
            font-size: 13px;
            color: #1c1c1c;
            line-height: 1.25;
            font-family: 'Pretendard', 'Poppins', 'Noto Sans KR', sans-serif, Dotum, "돋움", DotumChe, "돋움체", Verdana, monospace, Corbel, AppleGothic, Helvetica;
        }

        .bbs-table-list {
            padding: 20px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin: 0 auto;
            table-layout: fixed;
        }

        .tb-center {
            text-align: center;
        }

        .bbs-table-list thead th {
            font-size: 13px;
            color: #000;
            font-weight: normal;
            font-family: Verdana;
            border-top: 1px solid #000;
            border-bottom: 1px solid #e9e9e9;
            text-align: center;
            padding: 8px;
        }

        .bbs-table-list tbody td {
            border: 1px solid #ddd;
            padding: 5px;
            text-align: center;
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
        }

        .bbs-table-list tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .bbs-btm .bbs-link a {
            margin-left: 3px;
            width: 108px;
            height: 38px;
            font-size: 13px;
            line-height: 38px;
        }

        .CSSbuttonWhite {
            display: inline-block;
            color: #1d1b1b;
            text-align: center;
            border: 1px solid #dbdbdb;
            background: #fff;
            transition: all 0.3s ease;
            text-decoration: none;
        }

        .search-button {
            display: inline-block;
            padding: 8px 16px;
            background-color: #231f20;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .search-button:hover {
            background-color: #dee2e6;
            text-decoration: none;
        }

        .bbs-btm {
            padding: 15px 0;
            position: relative;
        }

        .bbs-btm .bbs-link {
            float: right;
        }

        .bbs-btm .bbs-paging .paging {
            margin: 0 130px;
            padding: 10px 0;
        }

        .paging {
            padding: 20px 0;
            text-align: center;
        }

        .pagination {
            display: inline-block;
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .pagination li {
            display: inline;
            margin: 0 5px;
        }

        .pagination a {
            text-decoration: none;
            color: #000;
            padding: 5px 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            transition: background-color 0.3s;
        }

        .pagination a:hover {
            background-color: #f2f2f2;
        }

        .pagination .disabled a {
            color: #ccc;
            cursor: not-allowed;
            border: 1px solid #eee;
        }
    </style>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <div class="content-area">
        <div class="content-title" id="home">NOTICE</div>
        <br> <br> 
        <div id="content">
            <div id="bbsData">
                <div class="page-body">
                    <div class="bbs-hd">
                        <div class="bbs-tit">
                            <h3>공지사항</h3>
                            <br>
                            <div class="bbs-sch">
                                <form action="board.html" name="form1">
                                    <input type="hidden" name="review_type" value="">
                                    <label><input type="radio" name="searchType" value="name" onclick="change(1);" class="MS_input_checkbox">이름</label>
                                    <label><input type="radio" name="searchType" value="subject" onclick="change(2);" checked="checked" class="MS_input_checkbox">제목</label>
                                    <label><input type="radio" name="searchType" value="content" onclick="change(3);" class="MS_input_checkbox">내용</label>
                                    <span class="key-wrap">
                                        <input type="text" name="stext" value="" class="MS_input_txt">
                                        <a href="javascript:document.form1.submit();" class="search-button">검색</a>
                                    </span>
                                </form>
                                </div>
                        </div>
                        <div class="bbs-table-list">
                                       <table id="noticeList" summary="No, content,Name,Data,Hits">
                                <colgroup>
                                    <col width="70">
                                    <col width="35">
                                    <col width="300">
                                    <col width="*">
                                    <col width="110">
                                    <col width="75">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th scope="col"><div class="tb-center">NO.</div></th>
                                        <th scope="col"><div class="tb-center">&nbsp;</div></th>
                                        <th scope="col"><div class="tb-center">TITLE</div></th>
                                        <th scope="col"><div class="tb-center">CONTENT</div></th>
                                        <th scope="col"><div class="tb-center">DATE</div></th>
                                        <th scope="col"><div class="tb-center">HITS</div></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- 공지사항 리스트 끝 -->
                                    <!-- 게시글 리스트 시작 (한 페이지당 게시글 수)-->
                                    <c:forEach var="n" items="${requestScope.list}">
                                        <tr>
                                            <td><div class="tb-center">${n.noticeNo}</div></td>
                                            <td><div class="tb-left">${n.noticeImgPath}</div></td>
                                            <td>
                                                <div class="tb-left">
                                                    ${n.noticeTitle}
                                                </div>
                                            </td>
                                            <td>
                                                <div class="tb-center">
                                                    <a href="detail.no">${n.noticeContent}</a>
                                                </div>
                                            </td>
                                            <td><div class="tb-center"><fmt:formatDate value="${n.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></div></td>
                                            
                                            <td><div class="tb-center">${n.count}</div></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <br>
                            <script>
                                $(function() {
                                    $("#noticeList>tbody>tr").click(function() {
                                        let nno = $(this).children().eq(0).text();
                                        location.href = "detail.no?nno=" + nno;
                                    });
                                });
                            </script>
                            <div class="bbs-btm">
                                <div class="bbs-link">
                                    <a href="enrollForm.no" class="CSSbuttonWhite">WRITE</a>
                                </div>
                                <br>
                                <div id="pagingArea">
                                    <ul class="pagination">
                                        <li class="page-item disabled">
                                        <a class="page-link" href="#">이전</a></li>
                                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                                        <li class="page-item"><a class="page-link" href="#">다음</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../common/footer.jsp" />
</body>
</html>
           