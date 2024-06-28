<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>persfume</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
#wrap {
    font-family: 'Helvetica Neue', Arial, sans-serif;

    margin: 60px 0;
    padding: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
 
}

.review-container {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    width: 800px;
    text-align: center;
    display: block;
}

h1 {
    color: #333;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 15px;
    text-align: left;
}

label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
    color: #555;
}

input[type="text"], select, textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    box-sizing: border-box;
}

input[type="file"] {
    border: none;
}

button {
    width: 100%;
    padding: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

button:hover {
    background-color: #0056b3;
}

img {
    margin-top: 10px;
    border-radius: 5px;
    object-fit: cover;
}
.content-area {
		text-align: center;
		}
        .content-title{
            background: url(resources/images/perfume-subtitle.jpg);
            height: 320px;
            background-size: cover;
            background-position: center;
            object-fit: cover;
            text-align: center;
            line-height: 320px;
            font-size: 50px;
        	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
            color: white;
            width: 100%;
        }
</style>

</head>
<body>
   <jsp:include page="../common/header.jsp" />   
     <div class="content-title" id="home">Perfume</div>
     
<div id=wrap class="content-area">
 
 	<div id="home"></div>
 
    <div class="review-container">
            <h1>리뷰 작성하기</h1>
            <form id="review-form"   action="insertProductReview.po"  method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="productname" >상품명:  ${requestScope.p.productName} </label> 
                     <label for="productPrice" style="margin-left:20px;">주문번호:  ${requestScope.odId} </label> 
                      <label for="productname" style="margin-left:20px;">주문일자:  ${requestScope.od.orderDate} </label>
               <input type="number" name="pno" style="display:none;" value="${requestScope.p.productNo}" />
                 <input type="number" name="mno"style="display:none;" value="${requestScope.mno}" />
                  <input type="number" name="odId" style="display:none;" value="${requestScope.odId}" />
                </div>
                <div class="form-group">
                    <label for="rating">평점:</label>
                    <select id="rating" name="rating" required>
                        <option value="10">★★★★★</option>
                        <option value="9">★★★★☆</option>
                        <option value="8">★★★★</option>
                        <option value="7">★★★☆</option>
                        <option value="6">★★★</option>
                        <option value="5">★★☆</option>
                        <option value="4">★★</option>
                        <option value="3">★☆</option>
                        <option value="2">★</option>
                        <option value="1">☆</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="review">내용:</label>
                    <textarea id="review" name="review" rows="4" maxlength="200" minlength="10" placeholder="후기를 작성해주세요."
 required></textarea>
                </div>
                <div class="form-group">
                    <label for="file1">사진첨부:</label>
                    <input type="file" id="upfile" name="upfile" onchange="loadImg(this, 1);" required> 
                </div>
                <div class="form-group">
                    <label for="ImgName1">미리보기:</label>
                    <img id="ImgName1" width="100%" height="100%">
                </div>
                <button type="submit">리뷰 제출</button>
            </form>
        </div>
    
       
       
    
            <script>

function loadImg(inputFile, num) {
    if (inputFile.files && inputFile.files[0]) {
        let reader = new FileReader();
        reader.onload = function(e) {
            switch(num) {
                case 1:
                    document.getElementById('ImgName1').src = e.target.result;
                    break;
            }
        };
        reader.readAsDataURL(inputFile.files[0]);
    } else {
        switch(num) {
            case 1:
                document.getElementById('ImgName1').src = '';
                break;
        }
    }
}


             
            </script>
 </div>
  <jsp:include page="../common/footer.jsp" />
  
</body>
</html>