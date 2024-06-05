<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

        #enrollForm {
        	display: inline-block;
        }
        
</style>


</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	
    <div class="content-area">
        <div class="content-title" id="home">EVENT</div>
        <div class="content-subtitle">(이벤트 상세내용)</div>
        <div class="content-main">
        	
        	<form id="enrollForm" method="post" action="insert.ev" enctype="multipart/form-data">
                    <table align="center">
                        <tr>
                            <th><label for="title">제목</label></th>
                            <td colspan="3"><input type="text" id="title" class="form-control" name="eventTitle" required></td>
                        </tr>
                        <tr>
                        	<th><label for="date">기간</label></th>
                        	<td><input type="date" id="startDate" class="form-control" name="startDate"></td>
                        	<th><label>~</label></th>
                        	<td><input type="date" id="dewDate" class="form-control" name="dewDate"></td>
                        </tr>
                        <tr>
                            <th><label for="upfileThumbnail">썸네일</label></th>
                            <td colspan="3"><input type="file" id="upfileThumbnail" class="form-control-file border" name="upfiles" required></td>
                        </tr>
                        <tr>
                            <th><label for="upfileMain">본문 사진</label></th>
                            <td colspan="3"><input type="file" id="upfileMain" class="form-control-file border" name="upfiles" required></td>
                        </tr>
                        <tr>
                            <th><label for="content">내용</label></th>
                            <td colspan="3"><textarea id="content" class="form-control" rows="10" style="resize:none;" name="eventContent" placeholder="미입력시 이미지만 업로드 됩니다."></textarea></td>
                        </tr>
                    </table>
                    
                    <br>
    
                    <div align="center">
                        <button type="submit" class="btn btn-primary">등록하기</button>
                        <button type="reset" class="btn btn-danger">취소하기</button>
                    </div>
                </form>
        	
        	
        	
        	
        	
        	
        	
        	
	        
			
        </div>
    </div>

	<jsp:include page="../common/footer.jsp"/>

	<script>
	
	
	</script>
</body>
</html>