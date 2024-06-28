<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<title>회원가입</title>
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
        	text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);

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

#enroll_btn {
	background-color: #0c263f;
	color: white;
	width: 200px;
	height: 32px;
	margin-top: 50px;
	border-radius: 5px;
	box-sizing: border-box;
	display: inline-block;
}

#reset_btn {
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
</style>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
	<div class="content-title" id="home">welcome</div>
	<div id="outer">
		<br> <br> <br> <br>
		<form action="insert.me" method="post" id="EnrollForm">
			<table id="mem_info" class="table_css">
				<tr>
					<td style="font-size: 20px; padding: 20px;">기본정보</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td colspan="4"><input type="text" id="memId" name="memId"
						required> (대소문자와 특수기호 조합 4~16자로 입력해주세요)
						<div id="checkResult" style="font-size: 0.8em; display: none;">
						</div></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td colspan="4"><input type="password" id="memPwd"
						name="memPwd" required> (대소문자와 특수기호(!@#$%) 조합으로 8~20자로
						입력해주세요)
						<div id="checkPwdResult1" style="font-size: 0.8em; display: none;">
						</div></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td colspan="4"><input type="password" id="memPwdConfirm"
						name="memPwdConfirm"> (비밀번호를 다시 입력해주세요)
						<div id="checkPwdResult" style="font-size: 0.8em; display: none;">
						</div></td>
				</tr>
				<tr>
					<th>이름</th>
					<td colspan="4"><input type="text" id="memName" name="memName" required>
						(이름을 입력해주세요)</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td colspan="4"><input type="date" id="birthDate"
						name="birthDate" required></td>
				</tr>
				
				<th>이메일</th>
				<td colspan="4"><input type="email" id="email" name="email" required>
					(예 : user01@gmail.com)
					<button type="button" onclick="cert();" id="EmailSend">인증번호전송</button> <br> <br> 
					<input type="text" id="checkNo" disabled>
					(인증번호를 입력해주세요)
					<button type="button" id="validate" onclick="emailCheck();" disabled>인증</button>
				</td>
				
				<tr>
					<td rowspan="4" class="td_addr">주소</td>
					<td colspan="4"><input type="text" id="postcode"
						name="postcode" placeholder="우편번호"> <input type="button"
						id="find_btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					</td>
				</tr>
				<tr>
					<td colspan="4"><input type="text" id="address" name="address"
						placeholder="주소" style="width: 40%;"> <input type="text"
						id="detailAddress" name="detailAddress" placeholder="상세주소"
						style="width: 40%;"></td>
				</tr>
				<tr>
					<td><input type="text" id="extraAddress" name="extraAddress"
						placeholder="참고항목" style="width: 40%;"></td>
				</tr>
				<script
					src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script>
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
				</script>
			</table>



			<br> <br> <br> <br>



			<table id="mem_info2" class="table_css">
				<tr>
					<td colspan="2" style="font-size: 20px;">추가정보</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td colspan="4"><select name="phone1">
							<option>010</option>
							<option>011</option>
							<option>016</option>
							<option>017</option>
							<option>018</option>
							<option>019</option>
					</select> &nbsp; 
						<input type="text" id="memPhone_1" name="phone2" maxlength="4" style="width: 100px;">
						&nbsp; <input type="text" id="memPhone_2"name="phone3" maxlength="4" style="width: 100px;">
				</tr>
				<tr>
					<th>성별</th>
					<td colspan="4"><input type="text" id="gender" name="gender">
						(F(여) / M(남) 으로 입력해주세요)</td>
				</tr>
			</table>



			<br> <br>



			<table class="table_css">
				<tr>
					<td style="font-size: 30px;" colspan="2">전체 동의</td>
				</tr>
				<tr>
					<td colspan="2"><input type="checkbox" id="allCheck"  onchange="allCheck1();">이용약관
						및 개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다.</td>
				</tr>
				<tr>
					<td colspan="2" style="background-color: aliceblue;">이용약관 동의 *</td>
				</tr>
				<tr>
					<td colspan="2">
						<fieldset style="border: 1px solid lightgray;">제1조 (목적)

							이 약관은 (주)퍼스퓸이 운영하는 Persfume 사이버몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리의무 및 책임사항을 규정함을 목적으로 합니다.
							
							제2조 (정의)제3조 (약관 등의 명시와 설명 및 개정)
							
							①“몰” 이란 (주)퍼스퓸이가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
							②“이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
							
							③ ‘회원’이라 함은 “몰”에 개인정보를 제공하여 회원등록을 한 자로서, “몰”의 정보를 지속적으로 제공받으며, “몰”이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
							
							④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.
							
							제3조 (약관 등의 명시와 설명 및 개정)
							
							① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호모사전송번호전자우편주소, 사업자등록번호, 통신판매업신고번호, 개인정보관리책임자 등을 이용자가 쉽게 알 수 있도록 LeSportsac 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
							
							② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회배송책임환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
							
							③ “몰”은 전자상거래등에서의소비자보호에관한법률, 약관의규제에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에관한법률, 방문판매등에관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
							
							④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다.
							다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.
							
							⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 ‘몰“에 송신하여 ”몰“의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
							
							⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래등에서의소비자보호에관한법률, 약관의규제등에관한법률, 공정거래위원회가 정하는 전자상거래등에서의소비자보호지침 및 관계법령 또는 상관례에 따릅니다.
							
							제4조 (서비스의 제공 및 변경)
							
							① “몰”은 다음과 같은 업무를 수행합니다.
							1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
							2. 구매계약이 체결된 재화 또는 용역의 배송
							3. 기타 “몰”이 정하는 업무
							
							②“몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.
							
							③“몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.
							
							④전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
							
							제5조 (서비스의 중단)
							
							① “몰”은 컴퓨터 등 정보통신설비의 보수점검교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
							
							②“몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.
							
							③사업종목의 전환, 사업의 포기, 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.
							
							제6조 (회원가입)
							
							① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
							
							② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다
							1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.
							2. 등록 내용에 허위, 기재누락, 오기가 있는 경우
							
							3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우
							
							③ 회원가입계약의 성립시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.
							
							④ 회원은 제15조제1항에 의한 등록사항에 변경이 있는 경우, 즉시 전자우편 기타 방법으로 “몰”에 대하여 그 변경사항을 알려야 합니다.
							
							제7조 (회원 탈퇴 및 자격 상실 등)
							
							① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.
							
							② 회원이 다음 각호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.
							1. 가입 신청 시에 허위 내용을 등록한 경우
							2. “몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우
							3. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우
							4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우
							
							③ “몰”이 회원 자격을 제한정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.
							
							④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.
							
							제8조 (회원에 대한 통지)
							
							① “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.
							
							② “몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로써 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.
							
							제9조 (구매신청)
							
							“몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. 단, 회원인 경우 제2호 내지 제4호의 적용을 제외할 수 있습니다.
							1. 재화 등의 검색 및 선택
							2. 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력
							3. 약관내용, 청약철회권이 제한되는 서비스, 배송료설치비 등의 비용부담과 관련한 내용에 대한 확인
							4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)
							5. 재화 등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의
							6. 결제방법의 선택
							
							
							제10조 (계약의 성립)
							
							① “몰”은 제9조와 같은 구매신청에 대하여 다음 각호에 해당하면 승낙하지 않을 수 있습니다.
							1. 신청 내용에 허위, 기재누락, 오기가 있는 경우
							2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우
							3. 기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우
							
							② “몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.
							
							③ “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.
							
							제11조 (지급방법)
							
							“몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각호의 방법 중 가용한 방법으로 할 수 있습니다. 단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.
							1. 신용카드 결제
							2. 무통장입금
							3. 마일리지 등 “몰”이 지급한 포인트(레몬)에 의한 결제 (단독으로 사용불가, 1,2 결제수단과 함께 사용)
							
							제12조 (수신확인통지런만탐택?변경 및 취소)
							
							① “몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.
							
							② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “몰”은 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.
							
							제13조 (재화 등의 공급)
							
							① “몰”은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 2영업일 이내에 조치를 취합니다. 이때 “몰”은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.
							
							②“몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의과실이 없음을 입증한 경우에는 그러하지 아니합니다.
							
							제14조 (환급)
							
							“몰”은 이용자가 구매 신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 2영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.
							
							제15조 (청약철회 등)
							
							①“몰”과 재화 등의 구매에 관한 계약을 체결한 이용자는 수신확인의 통지를 받은 날부터 7일 이내에는 청약의 철회를 할 수 있습니다.
							
							② 이용자는 재화 등을 배송 받은 경우 다음 각호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.
							1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)
							2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우
							3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화 등의 가치가 현저히 감소한 경우
							4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우
							
							③ 제2항 제2호 내지 제4호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.
							
							④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시런ㅀ?내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.
							
							제16조 (청약철회 등의 효과)
							
							① “몰”은 이용자로부터 재화 등을 반환 받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 “몰”이 이용자에게 재화 등의 환급을 지연한 때에는 그 지연기간에 대하여 공정거래위원회가 정하여 고시하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.
							
							② “몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.
							
							③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시런ㅀ?내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 “몰”이 부담합니다.
							
							④ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “몰”은 청약철회 시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.
							
							제17조 (개인정보보호)
							
							①“몰”은 이용자의 정보수집 시 구매계약 이행에 필요한 최소한의 정보를 수집합니다. 다음 사항을 필수사항으로 하며 그 외 사항은 선택사항으로 합니다.
							1. 성명
							2. 주소
							3. 전화번호
							4. 희망ID(회원의 경우)
							5. 비밀번호(회원의 경우)
							6. 전자우편주소(또는 이동전화번호)
							
							② “몰”이 이용자의 개인식별이 가능한 개인정보를 수집하는 때에는 반드시 당해 이용자의 동의를 받습니다.
							
							③제공된 개인정보는 당해 이용자의 동의 없이 목적 외의 이용이나 제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 몰이 집니다. 다만, 다음의 경우에는 예외로 합니다.
							
							1. 배송업무상 배송업체에게 배송에 필요한 최소한의 이용자의 정보(성명, 주소, 전화번호)를 알려주는 경우
							2. 통계작성, 학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우
							3. 재화 등의 거래에 따른 대금정산을 위하여 필요한 경우
							4. 도용방지를 위하여 본인확인에 필요한 경우
							5. 법률의 규정 또는 법률에 의하여 필요한 불가피한 사유가 있는 경우
							
							④“몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은 자, 제공목적 및 제공할 정보의 내용) 등 정보통신망이용촉진등에관한법률 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.
							
							⑤이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.
							
							⑥ “몰”은 개인정보 보호를 위하여 관리자를 한정하여 그 수를 최소화하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.
							
							⑦ “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.
							
							제18조 (“몰“의 의무)
							
							① “몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화·용역을 제공하는데 최선을 다하여야 합니다
							
							② “몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.
							
							③ “몰”이 상품이나 용역에 대하여 「표시·광고의공정화에관한법률」 제3조 소정의 부당한 표시·광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.
							
							④ “몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.
							
							제19조 (회원의 ID 및 비밀번호에 대한 의무)
							
							① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다. (단, 가입 후 ID 변경을 할 수 없습니다.)
							
							② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.
							
							③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의 안내가 있는 경우에는 그에 따라야 합니다.
							
							제20조 (이용자의 의무)
							
							이용자는 다음 행위를 하여서는 안됩니다.
							1. 신청 또는 변경 시 허위 내용의 등록
							2. 타인의 정보 도용
							3. “몰”에 게시된 정보의 변경
							4. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
							5. “몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해
							6. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
							7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공성양속에 반하는 정보를 몰에 공개 또는 게시하는 행위
							
							제21조 (연결“몰”과 피연결“몰” 간의 관계)
							
							① 상위 “몰”과 하위 “몰”이 하이퍼 링크(예: 하이퍼 링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트)이라고 합니다.
							
							②연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증책임을 지지 않습니다.
							
							제22조 (저작권의 귀속 및 이용제한)
							
							① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.
							
							② 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.
							
							③ “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.
							
							제23조 (분쟁해결)
							
							① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치운영합니다.
							
							② “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.
							
							③“몰”과 이용자간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.
							
							제24조 (재판권 및 준거법)
							
							①“몰”과 이용자간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.
							
							②“몰”과 이용자간에 제기된 전자상거래 소송에는 한국법을 적용합니다.</fieldset> <br>
						<input type="checkbox" id="check1" name="agree" value="agree">동의
					</td>
				</tr>
				<tr>
					<td colspan="2" style="background-color: aliceblue;">이용약관 동의 *</td>
				</tr>
				<tr>
					<td colspan="2">
						<fieldset style="border: 1px solid lightgray;">'퍼스퓸'은 회원님께서 ㈜퍼스퓸이 운영하는 웹사이트(이하'퍼스퓸몰'이라고 함)의 각종 서비스를 이용하거나'퍼스퓸몰'(www.Persfume.com)의 상품을 주문하는데 있어, 본인확인, 원활한 서비스 제공 및 주문 접수, 물품 배송, 대금 결제, 회원님에게 유용한 맞춤정보 제공 등을 위하여 필요한 최소한의 개인정보를 필수 사항으로 수집합니다.

							제1항 (수집하는 개인정보 항목 및 방법)
							당사에서는 몰 회원 여러분에게 다양하고 편리한 인터넷 서비스를 제공하기 위하여 아래와 같은 개인정보를 수집하고 있습니다.
							
							1. 개인정보 수집항목
							① 필수항목
							- 생년월일, 성별, 성명, 아이디, 비밀번호, 주소(자택 또는 직장-직장명포함), 전화번호(자택/휴대전화 중 1개 이상 입력), 전자우편주소 등
							
							② 선택항목
							- 기념일정보(본인생일, 결혼여부, 배우자생일), 자녀유무, 직업, 직장명, 직장연락처, 직장주소 등
							
							③ 본인확인 필요 시
							- 통합회원/인증회원/법정대리인의 동의가 필요한 경우, 본인확인 인증결과 값(본인확인기관이 제공한 정보: CI, DI)
							
							④서비스 이용과정 및 사업 처리과정에서 수집될 수 있는 개인정보의 범위
							- 서비스 이용기록, 접속 로그, 쿠키, 접속IP정보, 결제기록, 이용정지 기록
							- 은행 계좌정보, 신용카드정보, 포인트카드 번호, 거래정보 등
							- 모바일단말기 식별번호, 모바일단말기 OS 정보, 이동통신회사, PUSH 수신여부, 위치기반서비스 제공을 위한 정보(사용시각, 장소 등)
							
							⑤ 법인회원 가입시
							- (필수정보) 사업자등록번호, 법인단체명, 비밀번호, 대표자명, 대표전화번호, 사업자주소, 전자우편주소, 담당자명/전화번호 등
							※ 위 정보는 가입 당시 정보뿐만 아니라 정보 수정으로 변경된 정보를 포함합니다.
							
							2. 개인정보의 수집방법
							① 신청서 등 서면양식에 서명, 당사 및 관계사의 홈페이지, 상담게시판, 전화, 팩스, 스마트폰용 어플리케이션을 통한 본인, 대리인 확인, 경품행사 응모, 관계사의 제공, 로그 분석 프로그램을 통한 생성정보 수집, '쿠키(cookie)'에 의한 정보 수집, 제휴사부터의 제공을 통한 수집 방법 등
							
							② 회원은 개인정보 수집 동의를 거부할 권리가 있으나, 동의 거부 시 당사가 제공하는 서비스를 받을 수 없습니다.
							
							③ 허위 정보 입력 시 당사의 조치
							회원은 자신의 정보에 대해 정확성 및 적법성을 보장해야 합니다. 만약 이를 위반하여 타인의 정보를 도용하는 등 각종 방법으로 허위 정보를 입력할 경우 당사는 해당 회원을 관계법령에 따라 신고 할 수 있으며 강제 탈퇴를 시킬 수도 있습니다.
							회원의 기본적 인권 침해의 우려가 있는 민감한 개인정보는 수집하지 않습니다.
							
							④ 회원이 자발적으로 공개한 개인정보로 인해 회원개인에게 발생하는 손실이나 문제는 전적으로 개인의 책임이며, 공개적인 공간에 게재되는 개인정보는 다른 사람이 수집하여 무단으로 사용할 수 있음을 인지하시어, 이로 인해 원하지 않는 피해를 입을 수 있음을 유념하시기 바랍니다.
							
							제2항 (개인정보 수집/이용 목적)
							당사는 서비스 제공을 위하여 필요한 최소한의 범위 내에서 다음 각 항목과 같은 목적으로 개인정보를 수집하고 있습니다.
							① 당사가 제공하는 회원제 서비스에 따른 본인 확인 절차에 활용
							② “레스포색몰 포인트” 서비스 제공을 위한 포인트 적립 및 사용, 정산, 고객센터 운영 등
							③ 물품 및 서비스 상품에 대한 주문 및 접수, 대금 결제, 주문상품 배송, 회원에 대한 각종 편의 서비스 제공
							④ 경품 및 물품 배송에 대한 정확한 배송지 확보
							⑤ 당사, 관계사가 제공하는 서비스 및 이벤트 정보 제공(SMS/전자우편(E-mail)/DM /TM 등)
							⑥ 당사의 제휴 행사 및 서비스 홍보를 위한 마케팅 자료 활용
							⑦ 공지/불만 처리 등을 위한 원활한 의사소통의 경로 확보
							⑧ 업무와 관련된 통계자료 작성 및 서비스 개발
							
							제3항 (수집하는 개인정보의 보유 및 이용기간)
							1. 당사는 법령에 따르거나 이용자로부터 개인정보 수집 시에 동의 받은 개인정보 보유 및 기간 내에서 개인정보를 보유 및 이용합니다.
							
							2. 전자상거래등에서의소비자보호에관한법률 등 관계법률에 의해 개인정보 보존기간은 아래와 같습니다.
							① 계약 또는 청약철회 등에 관한 기록: 5년
							② 대금결제 및 재화 등의 공급에 관한 기록: 5년
							③ 소비자의 불만 또는 분쟁처리에 관한 기록: 3년
							④ 휴면계정에 대한 개인정보 유효기간: 1년
							⑤ 표시/광고에 관한 기록: 6개월
							⑥ 서비스 이용기록, 접속로그, 접속IP 정보(통신비밀보호법 시행령): 3개월
							⑦ 거래내역 관련 정보(국세기본법): 5년
							
							3. 관련 법령에 그 근거가 업더라도, 회사의 중대한 손실을 예방하거나, 범죄 및 소송 등을 위해 보관해야 하는 경우 회사방침에 따라 보관할 수 있습니다. 단, 그 목적을 달성하기 위한 최소한의 기간 및 항목만 보관합니다.
							① 회원 탈퇴 후 이용자 정보에 관한 기록(부정이용 회원의 재발 방지): 2개월
							② 이용약관에 따라 자격이 상실 된 회원정보(부정이용 회원의 재발 방지): 5년지할 것입니다.
							</fieldset> <br>
						<input type="checkbox" id="check2" name="agree" value="agree">동의
					</td>
				</tr>
			</table>

			<div style="text-align: center;">
				<button type="reset" id="reset_btn">초기화</button>
				<button type="submit" id="enroll_btn" disabled>회원가입</button>
			</div>

		</form>




		<script>
		
			// 전체동의 기능
			function allCheck1(){
				
				console.log("전체동의 함수 실행 성공!");
				
				const $allCheck = $("#allCheck");
				const $check1 = $("#check1");
				const $check2 = $("#check2");
				
				if($allCheck.prop("checked")){
					$check1.prop("checked", true);
				    $check2.prop("checked", true);
				}else{
					$check1.prop("checked", false);
				    $check2.prop("checked", false);
				    
				    $("#EnrollForm button[type=submit]").attr("disabled", true);
					
				}
			}
			
			// 두 개의 동의를 따로따로 직접 체크한 경우 전체동의 체크박스도 체크로 바꾸기 
			$(function(){
				
				const $allCheck = $("#allCheck");
				const $check1 = $("#check1");
				const $check2 = $("#check2");
					
				function updateAllCheck() {
			        if($check1.prop("checked") && $check2.prop("checked")) {
			            $allCheck.prop("checked", true);
			            
			        } else {
			            $allCheck.prop("checked", false);
			            
			            $("#EnrollForm button[type=submit]").attr("disabled", true);
			        }
			    }
				
				// 각 체크박스가 눌릴때마다 함수 호출하기
			    $check1.change(updateAllCheck);
			    $check2.change(updateAllCheck);
				
			})
			
			// 비밀번호 유효성 검사 + 잘 입력했는지 한번 더 확인
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

								$memPwdConfirm
										.keyup(function() {
											if ($pwdInput.val() == $memPwdConfirm
													.val()) {
												$("#checkPwdResult")
														.show()
														.css("color", "green")
														.text("입력한 비밀번호와 일치합니다");
												
												pwd = true;

												// 회원가입버튼 활성화
												$("#EnrollForm button[type=submit]").attr("disabled", false);
											} else {
												$("#checkPwdResult")
														.show()
														.css("color", "red")
														.text(
																"입력한 비밀번호와 일치하지 않습니다. 다시 입력해주세요.");

												// 회원가입버튼 비활성화
												$("#EnrollForm button[type=submit]").attr("disabled", true);
												
												pwd = false;
											}
										});
							} else {
								// 유효하지 않을 때
								$("#checkPwdResult1").show()
										.css("color", "red").text(
												"양식에 맞는 비밀번호를 입력해주세요");
							}
						});
			});

			// 아이디 중복 검사 
			$(function() {
				// 아이디를 입력하는 input 요소 객체를 변수에 담아두기
				const $idInput = $("#EnrollForm input[name=memId]");
				// 변수 명명 규칙 : 제이쿼리 방식으로 요소선택해서 변수 설정 시 앞에 $ 를 붙인다

				$idInput
						.keyup(function() {
							console.log($idInput.val());

							const regEx = /^(?=.*[a-zA-Z])(?=.*\d).{4,16}$/;

							if (regEx.test($idInput.val())) {
								// 유효한 아이디일 때
								$("#checkResult").show().css("color", "green")
										.text("멋진 아이디네요!");

								$
										.ajax({
											url : "idCheck.me",
											type : "get",
											data : {
												checkId : $idInput.val()
											},
											success : function(result) {
												console.log(result);

												if (result == "NNNNN") {
													// 사용 불가능한 아이디일 경우
													// 빨간색 메시지로 출력
													$("#checkResult")
															.show()
															.css("color", "red")
															.text(
																	"이미 사용 중이거나 탈퇴한 회원의 아이디입니다. 다시 입력해주세요.");

													// 회원가입버튼 비활성화
													$(
															"#EnrollForm button[type=submit]")
															.attr("disabled",
																	true);
												} else {
													// 사용 가능한 아이디일 경우
													// 초록색 메세지로 출력
													$("#checkResult").show()
															.css("color",
																	"green")
															.text("멋진 아이디네요!");
													
													id = true; 

													// 회원가입버튼 활성화
													$(
															"#EnrollForm button[type=submit]")
															.attr("disabled",
																	false);
												}
											},
											error : function() {
												console
														.log("아이디 중복 체크용 ajax 통신 실패!");
											}
										});
							} else {
								// 유효하지 않을 때
								$("#checkResult").show().css("color", "red")
										.text("조건에 맞는 아이디를 입력해주세요");

								// 회원가입버튼 비활성화
								$("#EnrollForm button[type=submit]").attr(
										"disabled", true);
							}
						});
			});

			function cert() {
				// 인증번호 발송 함수
				var emailValue = $("#email").val();
				console.log(emailValue);

				// ajax 요청 보내기
				$.ajax({
					url : "sendMail.me",
					type : "post",
					data : {
						email : $("#email").val()
					},
					success : function(result) {
						alert(result);
						if(result == '이미 존재하는 이메일입니다.'){

							// 인증번호 발급 후 인증 관련 요소들 활성화
							$("#checkNo").attr("disabled", true);
							$("#validate").attr("disabled", true);

						}else{
							// 이메일 인증번호 보내기 후 관련 요소들 비활성화
							$("#email").attr("readonly", true);
							$("#cert").attr("disabled", true);
							$("#checkNo").attr("disabled", false);
							$("#validate").attr("disabled", false);
						
					
						}
					
					},
					error : function() {
						console.log("인증번호 발급용 ajax 통신 실패!");
					}
				});
			}

			function emailCheck() {

				console.log("인증번호 확인 함수 호출 성공!");
				// 인증번호 확인 로직 추가
				
				$.ajax({
					url : "emailCheck.do",
					type : "post",
					data : {
						email : $("#email").val(),
						checkNo : $("#checkNo").val()
					},
					success : function(result) {
						
						alert(result);
						
						// 인증번호 대조 성공 후 인증 관련 요소 비활성화
						$("#checkNo").attr("readonly", true);
						$("#validate").attr("disabled", true);
						
						email = true;
						
						// 인증 실패 시
						// 다시 이메일 인증번호를 받을 수 있게끔 이메일 관련 요소들 활성화
						if(result == "인증 실패") {
							
							$("#checkNo").val("");
							
							$("#email").attr("readonly", false);
							$("#email").val("");
							$("#cert").attr("disabled", false);
						}
						
					}, 
					error : function() {
						console.log("인증번호 대조용 ajax 통신 실패!");	
					}
				});
			}
			
			//  체크해서 회원가입 버튼 활성화 여부 정하기
			$(function() {
        		setInterval(checkEnroll, 1000);
        	});
        	
        	function checkEnroll() {
				const $allCheck = $("#allCheck");
        		
        		if($allCheck.prop("checked")) {
        			// 회원가입버튼 활성화
					$("#EnrollForm button[type=submit]").attr("disabled", false)
        		} else {
        			// 회원가입버튼 비활성화
        			$("#EnrollForm button[type=submit]").attr("disabled", true);
        		}
        	}
		</script>
	</div>
</body>
</html>