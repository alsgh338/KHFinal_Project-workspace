package com.mata.persfume.chat.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class ChatMessage {

	private int cmNo;	// 채팅 메세지 번호
	private String cmContent; 	// 내용
	private String createDate; 	// 채팅 날짜
	private int chatNo;			// 채팅방 번호
	private int memNo;		// 발신자의 회원번호
	private String memName; // 발신자의 이름
	
}
