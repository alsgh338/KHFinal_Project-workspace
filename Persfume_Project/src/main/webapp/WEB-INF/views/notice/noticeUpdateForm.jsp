<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style>
        #updateForm>table {width:100%;}
        #updateForm>table * {margin:5px;}
    </style>
</head>
<body>
        
    <jsp:include page="../common/header.jsp" />
      <div class="content-area">
        <div class="content-title" id="home">NOTICE</div>

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>게시글 수정하기</h2>
            <br>

            <form id="updateForm" method="post" action="update.no" enctype="multipart/form-data">
                
                <!-- 해당 게시글의 글번호 (PK) 도 같이 넘기기 -->
                <input type="hidden" name="noticeNo" value="${ requestScope.n.noticeNo }">
                
                <table align="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" value="${ requestScope.n.noticeTitle }" name="noticeTitle" required></td>
                    </tr>
                    <tr>
                        <th><label for="writer">작성자</label></th>
                        <td><input type="text" id="writer" class="form-control" value="${ requestScope.n.noticeWriter }" readonly></td>
                    </tr>
                    <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        <td>
                            <input type="file" id="upfile" class="form-control-file border" name="reupfile">
	                        
	                        <!-- 
	                        	기존 첨부파일이 있었을 경우 : 기존 파일을 삭제해줘야함 
	                        	(해당 파일의 원본파일명, 수정파일명 넘기기) 
	                        -->
	                        <c:if test="${ not empty requestScope.n.originName }">                    
	                                                    현재 업로드된 파일 : 
	                            <a href="${ requestScope.n.changeName }" 
	                               download="${ requestScope.n.originName }">
	                            	${ requestScope.n.originName }
	                            </a>
	                            
	                            <input type="hidden" 
	                            	   name="originName" 
	                            	   value="${ requestScope.n.originName }" >
	                           	<input type="hidden"
	                           		   name="changeName"
	                           		   value="${ requestScope.n.changeName }" >
	                        </c:if>
	                        
                        </td>
                    </tr>
                    <tr>
                        <th><label for="content">내용</label></th>
                        <td><textarea id="content" class="form-control" rows="10" style="resize:none;" name="boardContent" required>${ requestScope.b.boardContent }</textarea></td>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">수정하기</button>
                    <button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">이전으로</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>
    
    <jsp:include page="../common/footer.jsp" />
    
</body>
</html>