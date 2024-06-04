<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
			height: 1000px;
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

		/* 여기서부터 회원가입폼 스타일 */
		.form-group{
			width: 100%;
			height: 100%;
		}
		#enrollForm input{
			box-sizing: border-box;
		}
		
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<div class="content-area">
	<div class="content-title" id="home">wellcome</div>
	<div class="content-main">
		<div class="form-group">
			<form id="enrollForm">
				<table>
					<tr>
						<th>아이디 </th>
						<td colspan="3">
							<input type="text"
									name="memId"
									required
									placeholder="영문과 숫자 조합으로 8자 이상 20자 이하로 작성해주세요">
						</td>
						<th>비밀번호 </th>
						<td colspan="3">
							<input type=" password"
									name="memPwd"
									required
									placeholder="">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>	
</div>


<jsp:include page="../common/footer.jsp" />

</body>
</html>