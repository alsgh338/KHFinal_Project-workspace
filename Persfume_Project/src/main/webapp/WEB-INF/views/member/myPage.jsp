<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

/* 여기서부터 회원가입 css */
* {
	font-family: "Nanum Gothic", sans-serif;
}

#outer {
	width: 1000px;
	/* border: 1px solid red; */
	margin: auto;
	box-sizing: border-box;
	text-align: center; /* 버튼을 가운데로 정렬하기 위한 설정 */
}

#EnrollForm {
	width: 100%;
	/* border: 5px solid yellow; */
	box-sizing: border-box;
	text-align: left; /* 테이블 내용을 왼쪽으로 정렬 */
}

#mem_info input {
	box-sizing: border-box;
}

#mem_info2 input {
	box-sizing: border-box;
}

.table_css {
	width: 100%;
	box-sizing: border-box;
	border-spacing: 0;
}

.table_css fieldset {
	box-sizing: border-box;
}

.table_css input {
	box-sizing: border-box;
	border: 1px solid lightgray;
	border-radius: 4px;
	padding: 5px; /* 입력 필드 안의 패딩 */
}

.table_css td {
	padding: 20px;
}

#mem_info th {
	text-align: center;
	padding: 20px;
	background-color: aliceblue;
	color: grey;
	font-size: 15px;
}

#mem_info button {
	background-color: lightgray;
	border-style: none;
	width: 110px;
	height: 32px;
	box-sizing: border-box;
	border-radius: 5px;
}

#mem_info2 th {
	text-align: center;
	padding: 20px;
	background-color: aliceblue;
	color: grey;
	font-size: 15px;
}

#mem_info2 button {
	background-color: lightgray;
	border-style: none;
	width: 110px;
	height: 32px;
	box-sizing: border-box;
	border-radius: 5px;
}

#find_btn {
	background-color: lightgray;
	border-style: none;
	box-sizing: border-box;
}

.td_addr {
	font-weight: bold;
	text-align: center;
	background-color: aliceblue;
	color: grey;
	font-size: 15px;
}

#updatebtnDiv{
	padding-left: 50%;
}

#btn_area{
	padding-left: 40%;

}

#update_btn {
	background-color: lightgray;
	border-style: none;
	width: 110px;
	height: 32px;
	border-radius: 5px;
	box-sizing: border-box;
	display: inline-block;
	
}

fieldset {
	width: 100%;
	height: 200px;
	overflow-y: auto;
}

#myPagelist{
	display: flex;
    list-style-type: none; /* 기본 목록 스타일 제거 */
   	padding: 0;
   	margin: 0;
	justify-content: space-around;
	width: 100%;
}

	#myPagelist a{
		text-align: center;
		text-decoration: none;
	}

#myPagelist li {
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	margin-right: 10px; /* 각 항목 간 간격 추가 */
	height: 50px; /* 필요에 따라 높이 조정 */
	font-size: 20px;
	position:relative;
	
}


#nav-btn{
    width: 70%;
    display: flex;
    align-items: center;
}

#myPagelist a::after {
	content: "";
	position: absolute;
	bottom: 0;
	left: 50%;
	transform: translateX(-50%);
	width: 0;
	height: 4px;
	background: rgba(217, 93, 48, 1)/*#D95D30*/;
	transition: all .5s ease-out;
 }

#myPagelist a:hover::after {
    width: 100%;
}

#header{
	width: 100%;
	height: 90px;
	display: flex;
	align-items: center;
	position: fixed;
	top: 0;
	right: 0;
	left: 0;
	justify-content: space-around;
	align-items: center;
	transition: all .5s ease-out;
	z-index: 999;
}

#header a{
	font-weight: 900;
	text-decoration: none;
	position: relative;
	padding: 6px 12px;
}




</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
<div class="content-area">
	<div class="content-title" id="home">WELCOME</div>
	<div id="outer">
		<ul id="myPagelist">
			<li>
				<a href="/persfume/myPage.me">내 정보 조회</a>
			</li>
			<li>
				<a id="Review" href="" onclick="reviewGo(); return false;">내 리뷰 조회</a>
				<form method="post" action="myReview.me" id="myReviewForm">
					<input type="hidden" name="memNo" value="${ sessionScope.loginMember.memNo }">
				</form>
			</li>
			<li>
				<a id="Like" href="" onclick="likeGo(); return false;">내 찜목록 조회</a>
				<form method="post" action="myLike.me" id="myLikeForm">
					<input type="hidden" name="memNo" value="${ sessionScope.loginMember.memNo }">
				</form>
			</li>
			<li>
				<a id="order" href="" onclick="orderGo(); return false;">내 주문목록(배송상태)</a>
				<form method="post" action="myOrder.me" id="myOrderForm">
					<input type="hidden" name="memNo" value="${ sessionScope.loginMember.memNo }">
				</form>
			</li>
			<li>
				<a id="class" href="" onclick="classGo(); return false;">클래스 예약조회</a>
				<form method="post" action="myClass.me" id="myClassForm">
					<input type="hidden" name="memNo" value="${ sessionScope.loginMember.memNo }">
				</form>
			</li>
		</ul>
		<br>
		<form action="update.me" method="post" id="EnrollForm">
			<table id="mem_info" class="table_css">
				<tr>
					<td style="font-size: 20px; padding: 20px;">기본정보</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td colspan="4">
						<input type="text" id="memId" name="memId" value="${ sessionScope.loginMember.memId }" required readonly>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td colspan="4"><input type="text" id="memName" name="memName" value="${ sessionScope.loginMember.memName }"  required>
						</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td colspan="4"><input type="date" id="birthDate" name="birthDate" value="${ sessionScope.loginMember.birthDate }" required readonly></td>
				</tr>
				
				<th>이메일</th>
				<td colspan="4"><input type="email" id="email" name="email" value="${ sessionScope.loginMember.email }" required>
				</td>
				
				<tr>
					<td rowspan="4" class="td_addr">주소</td>
					<td colspan="4"><input type="text" id="postcode"
						name="postcode" placeholder="우편번호" value="${ sessionScope.loginMember.postcode }">
                        <input type="button"
						id="find_btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<input type="text" id="address" name="address" placeholder="주소" value="${ sessionScope.loginMember.address }" style="width: 40%;"> 
						<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" value="${ sessionScope.loginMember.detailAddress }" style="width: 40%;"></td>
				</tr>
				<tr>
					<td><input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목"  value="${ sessionScope.loginMember.extraAddress }" style="width: 40%;"></td>
				</tr>
			</table>



			<br> <br> <br> <br>



			<table id="mem_info2" class="table_css">
				<tr>
					<td colspan="2" style="font-size: 20px;">추가정보</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td colspan="4">
						<input type="text" id="phone" name="phone" value="${ sessionScope.loginMember.phone }" maxlength="11" placeholder="- 빼고 입력" style="width: 200px;">
				</tr>
				<tr>
					<th>성별</th>
					<td colspan="4"><input type="text" id="gender" name="gender" value="${ sessionScope.loginMember.gender }"  style="width: 200px;"></td>
				</tr>
			</table>
			<br><br>
				<div id="btn_area">
					<button type="submit" id="update_btn">회원정보 수정</button>
					<a id="updatePwd" href="updatePwd.fo">비밀번호 변경</a>
					<a id="deleteMem" href="" onclick="deleteMem();">회원탈퇴</a>
				</div>
			</form>
		</div>	
		</div>
			
		

		<jsp:include page="../common/footer.jsp" />


		<script>
		function likeGo() {
			
			console.log("likeGO야 실행 돼?");
			
			$("#myLikeForm").submit();

		}
		
		function orderGo() {
			
			console.log("orderGO야 실행 돼?");
			
			$("#myOrderForm").submit();

		}

		function classGo() {
			
			console.log("classGO야 실행 돼?");
			
			$("#myClassForm").submit();

		}
		
		
		function reviewGo() {
			$("#myReviewForm").submit();
		}
		
            function deleteMem() {

                let url = "delete.fo"
    
                $("#deleteMem").attr("href", url);
            }

            function sample6_execDaumPostcode() {
						new daum.Postcode(
								{
									oncomplete : function(data) {
										// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

										// 각 주소의 노출 규칙에 따라 주소를 조합한다.
										// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
										var addr = ''; // 주소 변수
										var extraAddr = ''; // 참고항목 변수

										//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
										if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
											addr = data.roadAddress;
										} else { // 사용자가 지번 주소를 선택했을 경우(J)
											addr = data.jibunAddress;
										}

										// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
										if (data.userSelectedType === 'R') {
											// 법정동명이 있을 경우 추가한다. (법정리는 제외)
											// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
											if (data.bname !== ''
													&& /[동|로|가]$/g
															.test(data.bname)) {
												extraAddr += data.bname;
											}
											// 건물명이 있고, 공동주택일 경우 추가한다.
											if (data.buildingName !== ''
													&& data.apartment === 'Y') {
												extraAddr += (extraAddr !== '' ? ', '
														+ data.buildingName
														: data.buildingName);
											}
											// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
											if (extraAddr !== '') {
												extraAddr = ' (' + extraAddr
														+ ')';
											}
											// 조합된 참고항목을 해당 필드에 넣는다.
											document
													.getElementById("extraAddress").value = extraAddr;

										} else {
											document
													.getElementById("extraAddress").value = '';
										}

										// 우편번호와 주소 정보를 해당 필드에 넣는다.
										document.getElementById('postcode').value = data.zonecode;
										document.getElementById("address").value = addr;
										// 커서를 상세주소 필드로 이동한다.
										document
												.getElementById("detailAddress")
												.focus();
									}
								}).open();
					}




                    $(function() {
				// 비밀번호 유효성 검사
				const $pwdInput = $("#EnrollForm input[name=memPwd]");
				const $memPwdConfirm = $("#EnrollForm input[name=memPwdConfirm]");

				$pwdInput
						.keyup(function() {
							console.log($pwdInput.val());
							console.log($memPwdConfirm.val());

							const regEx = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%]).{8,20}$/;

							if (regEx.test($pwdInput.val())) {
								// 유효한 비밀번호 일 때
								$("#checkPwdResult1").show().css("color",
										"green").text("안전한 비밀번호");
							} else {
								// 유효하지 않을 때
								$("#checkPwdResult1").show()
										.css("color", "red").text(
												"양식에 맞는 비밀번호를 입력해주세요");
							}
						});
			});
		</script>
	
	
	
</body>
</html>