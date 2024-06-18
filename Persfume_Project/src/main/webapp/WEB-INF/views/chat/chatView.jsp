<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.mata.persfume.member.model.vo.Member" %>
<%
    Member loginMember = (Member) session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>One-Day Class Chat Room</title>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .chat-container {
            display: flex;
            flex-direction: column;
            width:400px;
            height: 800px;
            max-width: 800px;
            margin: auto;
            border: 1px solid #ccc;
            background-color: #fff;
        }
        .chat-header {
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            text-align: center;
            font-size: 20px;
        }
        .chat-messages {
            flex: 1;
            padding: 20px;
            overflow-y: auto;
            border-top: 1px solid #ccc;
            border-bottom: 1px solid #ccc;
        }
        .message {
            display: flex;
            flex-direction: column;
            max-width: 70%;
            margin-bottom: 15px;
            padding: 10px;
            border-radius: 10px;
            line-height: 1.5;
            word-wrap: break-word;
        }
        .message .sender {
            font-weight: bold;
        }
        .message .text {
            margin-left: 10px;
        }
        
        .my-message {
        	display : flex;
            justify-content: flex-end;
            background-color: #d1ffd1;
            color: #000;
        }
        .my-message .text {
            padding: 10px;
            border-radius: 10px;
        }
        .other-message {
            justify-content: flex-start;
            background-color: #f1f0f0;
            color: #000;
        }
        .other-message .text {
            padding: 10px;
            border-radius: 10px;
            border: 1px solid #ccc;
        }
        
        .chat-input {
            display: flex;
            padding: 10px;
            border-top: 1px solid #ccc;
        }
        .chat-input input {
            flex: 1;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .chat-input button {
            padding: 10px 15px;
            border: none;
            background-color: #007bff;
            color: #fff;
            border-radius: 4px;
            margin-left: 10px;
            cursor: pointer;
        }
        .chat-input button:hover {
            background-color: #0056b3;
        }
    </style>
    <script>
		
	</script>
</head>
<body>
    <div class="chat-container">
        <div class="chat-header">
            <!-- 원데이클래스 명 --> 채팅방
            <input type="hidden" value="${ requestScope.classNo }" id="classNo"/>
        </div>
        <div class="chat-messages" id="chat-messages">
            <!-- 채팅 메시지 여기에 표시 -->           
        </div>
        <div class="chat-input">
            <input type="text" id="message-input" placeholder="메시지를 입력하세요...">
            <button onclick="sendMessage()">전송</button>
        </div>
    </div>

    <script>
    
	    let socket;
		
		let classNo = document.getElementById("classNo").value;
		
		let memName = "${ sessionScope.loginMember.memName }";	// 현재 로그인 한 멤버
		
		console.log(memName);
		
		async function fetchPrevMessages(classNo) {
	        const response = await fetch("getPrevMessage?classNo="+ classNo);
	        const messages = await response.json();
	        return messages;
	    }
		
		async function connectChat() {
			
			let url = "ws://localhost:8008/persfume/chat.do?classNo=" + classNo;
			
			socket = new WebSocket(url);
			
			socket.onopen = async function(){
				console.log("연결됨");
				
				// 연결과 동시에 이전 채팅목록 조회 후 출력
				
				// ajax를 통해 checkUserCanExistChat 를 호출해서 true or false 리턴받기
				// 리턴값에 따라 true라면(속해있다면) 메세지 출력
				// false라면(속해있지 않다면) 메세지 출력 X
				
	            const messages = await fetchPrevMessages(classNo);
				
                messages.forEach(message => {
					
                	// 메세지를 출력하는 함수로 대체
                	
                    let data = "보낸이 : " + message.memName + "<br>" + message.cmContent + "<br>" + message.createDate;
					
                    if(message.memName == '${ sessionScope.loginMember.memName }'){
                    	
                    	document.getElementById("chat-messages").innerHTML += "<div class='my-message'>" + data + "</div>" + "<br>";
                    } else {
                    	document.getElementById("chat-messages").innerHTML += "<div class='other-message'>" + data + "</div>" + "<br>";
                    }
                    
                });

                document.getElementById("chat-messages").innerHTML += "<div>" + "--------------------- 여기까지 읽음 ---------------------" + "</div>" + "<br>";
		        
			}
			
			socket.onclose = function(){
				console.log("연결 종료");
			}
			
			socket.onmessage = function(e) {
				
				let obj = JSON.parse(e.data);
				
				let data = "보낸이 : " + obj.memName + "<br>" + obj.cmContent + "<br>" + obj.createDate + "<br>";
								
				if(obj.memName == memName){
					
					document.getElementById("chat-messages").innerHTML += '<div class="my-message">' + data + "</div>";
				} else {
					
					document.getElementById("chat-messages").innerHTML += '<div class="other-message">' + data + "</div>";
				}
				
				
				
				// > css 적용하면
				//   남의 메세지는 왼쪽에 내 메세지는 오른쪽에 배치 가능
			};
			
		}
		
		window.addEventListener('load', connectChat);
	
    	function sendMessage() {
			
			let text = document.getElementById("message-input").value;
			
			if(text != ""){
				
				socket.send(text);
				
				document.getElementById("message-input").value = "";
			}
		}
    	
    </script>
</body>
</html>