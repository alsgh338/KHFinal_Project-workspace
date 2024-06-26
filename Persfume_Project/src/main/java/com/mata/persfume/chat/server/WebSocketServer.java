package com.mata.persfume.chat.server;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.mata.persfume.chat.model.service.ChatService;
import com.mata.persfume.chat.model.vo.ChatMessage;
import com.mata.persfume.member.model.vo.Member;

public class WebSocketServer extends TextWebSocketHandler {

	private Set<WebSocketSession> userList = new CopyOnWriteArraySet<>();
	
	@Autowired
	private ChatService chatService;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		
		userList.add(session);
		
		System.out.println("접속됨");
		System.out.println("session : " + session);
		
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		// 로그인 된 상태인지 체크하는 구문 (혹은 인터셉터) 추가해야함
		
		Member mem = (Member)session.getAttributes().get("loginMember");    // 발신자 (로그인 회원의 회원번호로 뽑아야함)
		
		System.out.println(mem);
		
		String memName = mem.getMemName();
		int memNo = mem.getMemNo();
		
		//String memName = chatService.getMemName(memNo);
		
		String clNo = session.getUri().getQuery(); // 전체 쿼리를 가져옴 (?classNo=12345)
	    String[] queryParams = clNo.split("="); // "="를 기준으로 쿼리 파라미터 분리
	    if (queryParams.length == 2 && queryParams[0].equals("classNo")) {
	        clNo = queryParams[1]; // 실제 classNo 값 추출
	    }
	    
		int classNo = Integer.parseInt(clNo); // > 채팅방 번호
		
		String sendTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()); // 언제? (현재시간이 곧 사용자가 메세지를 보낸 시간)
		
		// JSON 활용
		// Message 정보를 담을 수 있는 VO 객체 --> GSON 을 이용해서 JSON 으로 가공
		ChatMessage m = new ChatMessage();
		
		
		m.setMemNo(memNo);
		m.setMemName(memName);		// memName 에 memName 담기
		m.setClassNo(classNo);	// classNo 에 classNo 담기
		m.setCreateDate(sendTime);	// createDate 에 sendTime 담기
		
		// 로그인된 사용자여야 함, 존재하는 클래스여야 함, 사용자가 클래스에 속해야 함 
		if(memName != null && classNo != 0 && chatService.checkUserCanExistChat(m)) {
			
			String msg = message.getPayload(); // > 메세지 내용 추출
			
			System.out.println("메세지 : " + msg);
			// TextMessage newMessage = new TextMessage(msg);
			
			m.setCmContent(msg);	// cmContent 에 msg 담기
			
			System.out.println(m);
			// ChatMessage(cmNo=0, cmContent=테스트용 메세지 3, createDate=2024-06-14 13:26:00, chatNo=1, memNo=1, memName=NAME)
			
			int resultInsertMsg = chatService.insertMsg(m);
			
			System.out.println(resultInsertMsg);
			
			if(resultInsertMsg > 0) {	// DB에 메세지 저장에 성공하면 메세지 출력
				String result = new Gson().toJson(m);
				// "{cmContent : 'ㅎㅇ', createDate : '2024-05-27 18:00:00', chatNo : '1', memName : 'NAME'}"
			
				System.out.println(result);
				// list : {"cmNo":0,"cmContent":"테스트용 메세지 2","createDate":"2024-06-14 13:22:07","chatNo":1,"memNo":1,"memName":"NAME"}
				
				TextMessage newMessage = new TextMessage(result);
				
				for(WebSocketSession ws : userList) {
					
					ws.sendMessage(newMessage);
				}
			}
		}
	}
	
	@Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        userList.remove(session);
    }
}
