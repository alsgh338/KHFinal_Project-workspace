<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>persfume</title>
<style>
	.outer {
		width : 1000px;
		border : 1px dotted lightgray;
		margin : auto;
		margin-top : 50px;
	}

	#enroll-form table {
		border : 1px solid lightgray;
	}

	#enroll-form input,
	#enroll-form textarea {
		width : 100%;
		box-sizing : border-box;
	}
	body {
		font-family: Arial, sans-serif;
		background-color: #f4f4f9;
		margin: 0;
		padding: 0;
	}
	.outer {
		width: 80%;
		max-width: 1000px;
		border: 1px solid #ddd;
		background-color: #fff;
		margin: 50px auto;
		padding: 20px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		border-radius: 10px;
	}
	h2 {
		color: #b425ad;
		font-size: 24px;
		margin-bottom: 20px;
	}
	table {
		width: 100%;
		border-collapse: collapse;
		margin-bottom: 20px;
	}
	th, td {
		padding: 10px;
		border: 1px solid #ddd;
	}
	th {
		background-color: #f8f8f8;
		text-align: left;
	}
	input, textarea {
		width: 100%;
		padding: 10px;
		margin: 5px 0;
		border: 1px solid #ddd;
		border-radius: 5px;
		font-size: 14px;
	}
	textarea {
		resize: none;
	}
	button {
		background-color: #7508ce;
		color: white;
		padding: 10px 20px;
		border: none;
		border-radius: 5px;
		font-size: 16px;
		cursor: pointer;
		transition: background-color 0.3s;
	}
	button:hover {
		background-color: #218838;
	}
	#file-area {
		display: flex;
		justify-content: space-between;
		margin-top: 10px;
	}
	#file-area input[type="file"] {
		flex: 1;
		margin-right: 10px;
	}
	img {
		border: 1px solid #ddd;
		border-radius: 5px;
		margin-top: 10px;
	}

</style>
</head>
<body>


	<div class="outer">
		
			<br>
			<h2 align="center"> 관리자 상품정보 변경 </h2>
			<br>
			
	
			<form id="enroll-form"
				  action="updatepro.po" 
				  method="post"
				  enctype="multipart/form-data">
				  
				<table align="center">
					<tr>
						<th width="100">상품명 : </th>
						<td colspan="3">
							<input type="text" 
								   name="productName" placeholder="${requestScope.p.productName}"
								   required>
								   <input type="number" name="pno" value="${requestScope.p.productNo}" style="display:none;" >
						</td>
					</tr>
					<tr>
						<th>상품내용</th>
						<td colspan="3">
							<textarea name="productExplain"
									  rows="5"
									  style="resize : none;"  placeholder="${requestScope.p.productExplain}"
									  required></textarea>
						</td>
					</tr>
					<tr>
						<th>상품가격</th>
						<td colspan="1"><input type="number" name="productPrice" placeholder="${requestScope.p.productPrice}" >
						</td>
						</tr>
						<tr>
						<th>상품재고</th>
						
						<td colspan="1"><input type="number" name="productStock" placeholder="${requestScope.p.productStock}">
						</td>
						</tr>
						<tr>
						<th style="font-size: 11px;">성별(남자/여자)</th>
						<td colspan="1"><input type="text" name="gender" placeholder="${requestScope.p.gender}">
                            
						</td>
						</tr>
						<tr>
						<th>할인율</th>
						<td colspan="1"><input type="number" name="discount" placeholder="${requestScope.p.discount}">
						</td>
						</tr>
                        <tr>
                            <th>카테고리</th>
                            <td colspan="1"><input type="text" name="category" placeholder="${requestScope.p.category}">
                           </td>   
                        </tr>
                        <tr>
                            <th>탑노트</th>
                            <td colspan="1"><input type="text" name="topNote" placeholder="${requestScope.p.topNote}">
                           </td>   
                        </tr>
                        <tr>
                            <th>미들노트</th>
                            <td colspan="1"><input type="text" name="middleNote" placeholder="${requestScope.p.middleNote}">
                           </td>   
                        </tr>
                        <tr>
                            <th>베이스노트</th>
                            <td colspan="1"><input type="text" name="baseNote" placeholder="${requestScope.p.baseNote}">
                           </td>   
                        </tr>
                          <tr>
                            <th>상품을 미등록(삭제)를 원하시면 N을 적어주세요</th>
                            <td colspan="1"><input type="text" name="productStatus" />
                           </td>   
                        </tr>
					<tr>
						<th>대표이미지</th>
						<td colspan="3" align="center">
							<!-- 이미지를 업로드 (미리보기 기능) -->
							<img id="ImgName1" 
								 width="100%" height="400px">
						</td>
					</tr>
					<tr>
						<th>보조이미지</th>
						<td>
							<!-- 이미지를 업로드 (미리보기 기능) -->
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	<img id="ImgName2" 
								 width="40%" height="300"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <img id="ImgName3" 
								 width="40%" height="300">
						</td>
	
					</tr>
					<tr>
						<th>기존이미지</th>
						<td>
						<c:forEach var="pl" items="${ requestScope.pllist }" varStatus="status">			
                       &nbsp;<img id="oriImgName${status.index}" src="${pl.productImgPath}"
								 width="32%" height="300"> &nbsp;
                           </c:forEach>
						</td>
					</tr>

				</table>
 
    	<div id="file-area">
					<!-- input[type=file id=file$ name=file$]*4 -->
					<!-- 대표이미지 : 썸네일은 필수입력사항 -->
					<input type="file" id="upfile" name="upfile" onchange="loadImg(this, 1);" required> 
					<input type="file" id="upfile2" name="upfile2" onchange="loadImg(this, 2);" required>
					<input type="file" id="upfile3" name="upfile3" onchange="loadImg(this, 3);" required>
  		</div>
    

    <script>
        function loadImg(input, index) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    document.getElementById('ImgName' + index).src = e.target.result;
                };

                reader.readAsDataURL(input.files[0]);
            }
        }
  
    </script>

			
				<br><br>

				<div align="center">
					<button type="submit"
							class="btn btn-secondary btn-sm">
						등록하기
					</button>
				</div>

			</form>

			<br><br>
		
	</div>
</body>
</html>