<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
    <title>회원가입</title>
    <style>
     .font {
        font-family: "Nanum Gothic", sans-serif;
     }
     .content-title{
            height: 320px;
            background-color : #0c263f;
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
        
        /* 여기서부터 회원가입 css */

        * {
            font-family: "Nanum Gothic", sans-serif;
        }
    
        #outer{
            width: 1000px;
            /* border: 1px solid red; */
            margin: auto;
            box-sizing: border-box;
            text-align: center; /* 버튼을 가운데로 정렬하기 위한 설정 */
        }

        #EnrollForm{
            width: 100%;
            /* border: 5px solid yellow; */
            box-sizing: border-box;
            text-align: left; /* 테이블 내용을 왼쪽으로 정렬 */
        }

        #mem_info input{   
            box-sizing: border-box;
        }

        .table_css{
            width: 100%;
            box-sizing: border-box;
            border-spacing : 0;
        }
        .table_css fieldset{
            box-sizing: border-box;
        }

        .table_css input{
            box-sizing: border-box;
            border: 1px solid lightgray;
            border-radius: 4px;
            padding: 5px; /* 입력 필드 안의 패딩 */
        }

        .table_css td{
            padding: 20px;
        }

        #mem_info th {
            text-align: center;
            padding : 20px;
            background-color: aliceblue;
            color: grey;
            font-size: 15px;
        }

        #mem_info button{
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

        .td_addr{
            font-weight : bold;
            text-align: center;
            background-color: aliceblue;
            color: grey;
            font-size: 15px;
        }

        #enroll_btn{
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

        fieldset{
            width: 100%;
            height: 200px;
            overflow-y: auto;
        }

    </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
    <div class="content-title" id="home">welcome</div>
    <div id="outer">
        <br><br><br><br>
        <form action="insert.me" method="post" id="EnrollForm">
            <table id="mem_info" class="table_css">
                <tr>
                    <td style="font-size: 20px; padding: 20px;">기본정보</td>
                </tr>
                <tr>
                    <th>아이디</th>
                    <td colspan="4">
                        <input type="text" id="memId" name="memId" required>
                        (영문소문자/숫자, 4~16자)
                        <div id="checkResult"
                        style="font-size : 0.8em; display : none;">
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td colspan="4">
                        <input type="password" id="memPwd" name="memPwd" required>
                        (대소문자와 특수기호(!@#$%) 조합으로 8~20자로 입력해주세요)
                          <div id="checkPwdResult1"
                        style="font-size : 0.8em; display : none;">
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호 확인</th>
                    <td colspan="4">
                        <input type="password" id="memPwdConfirm" name="memPwdConfirm">
                        (비밀번호를 다시 입력해주세요)
                        <div id="checkPwdResult"
                        style="font-size : 0.8em; display : none;">
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td colspan="4">
                        <input type="text" id="memName" name="memName">
                        (이름을 입력해주세요)
                    </td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td colspan="4">
                        <input type="date" id="birthDate" name="birthDate">
                    </td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td colspan="4">
                        <select name="phone1">
                            <option>010</option>
                            <option>011</option>
                            <option>016</option>
                            <option>017</option>
                            <option>018</option>
                            <option>019</option>
                        </select>
                        <input type="text" id="memPhone_1" name="phone2" maxlength="4" style="width: 100px;">
                        <input type="text" id="memPhone_2" name="phone3" maxlength="4" style="width: 100px;">
                        <button type="button">중복 확인</button>
                    </td>
                </tr>
                <tr>
                    <td rowspan="4" class="td_addr">주소</td>
                    <td colspan="4">
                        <input type="text" id="postcode" name="postcode" placeholder="우편번호">
                        <input type="button" id="find_btn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <input type="text" id="address" name="address" placeholder="주소" style="width: 40%;">
                        <input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소" style="width: 40%;">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목" style="width: 40%;">
                    </td>
                </tr>
                <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                <script>
                    function sample6_execDaumPostcode() {
                        new daum.Postcode({
                            oncomplete: function(data) {
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
                                if(data.userSelectedType === 'R'){
                                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                        extraAddr += data.bname;
                                    }
                                    // 건물명이 있고, 공동주택일 경우 추가한다.
                                    if(data.buildingName !== '' && data.apartment === 'Y'){
                                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                    }
                                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                    if(extraAddr !== ''){
                                        extraAddr = ' (' + extraAddr + ')';
                                    }
                                    // 조합된 참고항목을 해당 필드에 넣는다.
                                    document.getElementById("extraAddress").value = extraAddr;
                                
                                } else {
                                    document.getElementById("extraAddress").value = '';
                                }

                                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                document.getElementById('postcode').value = data.zonecode;
                                document.getElementById("address").value = addr;
                                // 커서를 상세주소 필드로 이동한다.
                                document.getElementById("detailAddress").focus();
                            }
                        }).open();
                    }

                    
                </script>
            </table>
            <br>
            <br>
            <br>
            <br>
            <table id="mem_info" class="table_css">
                <tr>
                    <td colspan="2" style="font-size: 20px;" >추가정보</td>
                </tr>
                <tr>
                    <th>이메일 </th>
                    <td colspan="4">
                        <input type="email" id="email" name="email">
                        (예 : user01@naver.com)
                        <button type="button" id="cert">인증번호 전송</button> <br><br>
                        <input type="text" id="checkNo" disabled> (인증번호를 입력해주세요)
                        <button id="validate" onclick="validate();" disabled>인증</button>
                    </td>
                </tr>
                <tr>
                    <th>성별 </th>
                    <td colspan="4">
                        <input type="text" id="gender" name="gender">
                        (F(여) / M(남) 으로 입력해주세요)
                    </td>
                </tr>
            </table>
            <br>
            <br>
                <table class="table_css">
                    <tr>
                        <td style="font-size: 30px;" colspan="2">전체 동의</td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="checkbox" id="enrollcheckAllbtn">이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다.</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="background-color: aliceblue;"> 이용약관 동의 *</td>
                    </tr>
                    <tr>
                        <td colspan="2"> 
                            <fieldset style="border: 1px solid lightgray;">
                            </fieldset>
                            <br>
                            <input type="checkbox" name="agree" value="agree">동의
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="background-color: aliceblue;;"> 이용약관 동의 *</td>
                    </tr>
                    <tr>
                        <td colspan="2"> 
                            <fieldset style="border: 1px solid lightgray;">
                            </fieldset>
                            <br>
                            <input type="checkbox" name="agree" value="agree">동의
                        </td>
                    </tr>
                </table>
                <div style="text-align: center;"> 
                <button type="reset" id="reset_btn">초기화</button>
                <button type="submit" id="enroll_btn">회원가입</button>
                </div>
        </form>




        <script>

        // 비밀번호 유효성 검사 + 잘 입력했는지 한번 더 확인
        $(function(){
        	// 비밀번호 유효성 검사
        	const $pwdInput = $("#EnrollForm input[name=memPwd]");
            const $memPwdConfirm = $("#EnrollForm input[name=memPwdConfirm]");
            
        	$pwdInput.keyup(function(){
        		
        		console.log($pwdInput.val());
        		console.log($memPwdConfirm.val());
        		
        		const regEx = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%]).{8,20}$/;
        			
        		if(regEx.test($pwdInput.val())){
        			// 유효한 비밀번호 일 때
        			  $("#checkPwdResult1").show()
						.css("color","green")
						.text("멋진 비밀번호네요!");
        			
        			  $memPwdConfirm.keyup(function(){
        				  
        				  if($pwdInput.val() == $memPwdConfirm.val()){

                              $("#checkPwdResult").show()
              									.css("color","green")
              									.text("입력한 비밀번호와 일치합니다!");
              							
              				// 회원가입버튼 활성화
              				$("#EnrollForm button[type=submit]").attr("disabled", false);

                          }else{

                              $("#checkPwdResult").show()
                                              .css("color","red")
                                              .text("입력한 비밀번호와 일치하지않습니다. 다시 입력해주세요");
                              
                              // 회원가입버튼 비활성화
                              $("#EnrollForm button[type=submit]").attr("disabled", true);
                          }
        				  
        			  });
        			
        		}else{
        			//유효하지 않을 때
                    $("#checkPwdResult1").show()
						.css("color","red")
						.text("조건에 맞는 비밀번호를 입력해주세요");
        			
        		}
        		
        	})
        	
        })
        
        
        

        // 아이디중복 검사 
        $(function(){
        	// 아이디를 입력하는 input 요소 객체를 변수에 담아두기
    		const $idInput = $("#EnrollForm input[name=memId]");
    		// 변수 명명 규칙 : 제이쿼리 방식으로 요소선택해서 변수 설정시 앞에 $ 를 붙인다
    		
    		$idInput.keyup(function() {
    			
    			console.log($idInput.val());
    			
    			const regEx = /^(?=.*[a-zA-Z])(?=.*\d).{4,16}$/;
   
    			
    			if(regEx.test($idInput.val())){
    				// 유효한 아이디 일 때
    				$("#checkResult").show()
					.css("color","green")
					.text("멋진 아이디네요!");
    				
    				$.ajax({
    					url : "idCheck.me",
    					type : "get",
    					data : {
    						checkId : $idInput.val()
    					},
    					success : function(result) {
    						
    						 console.log(result);
    						
    						if(result == "NNNNN"){
    							// 사용 불가능한 아이디일 경우
    							
    							// 빨간색 메시지로 출력
    							$("#checkResult").show()
    											.css("color","red")
    											.text("이미 사용중이거나 탈퇴한 회원의 아이디입니다. 다시 입력해주세요.");
    							
    							// 회원가입버튼 비활성화
    							$("#EnrollForm button[type=submit]").attr("disabled", true);
    						}else{
    							// 사용 가능한 아이디일 경우
    							
    							// 초록색 메세지로 출력
    							$("#checkResult").show()
    											.css("color","green")
    											.text("멋진 아이디네요!");
    							
    							// 회원가입버튼 활성화
    							$("#EnrollForm button[type=submit]").attr("disabled", false);
    							 
    						}
    						
    					},
    					error : function() {
    						console.log("아이디 중복 체크용 ajax 통신 실패!");
    					}
    				});
    			}else{
    				// 유효하지 않을 때
    				$("#checkResult").show()
					.css("color","red")
					.text("조건에 맞는 아이디를 입력해주세요");
    				
    				// 회원가입버튼 비활성화
    				$("#EnrollForm button[type=submit]").attr("disabled", true);
    			}
    		});
    		
    	})
        </script>
    </div>
</body>
</html>