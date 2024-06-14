package com.mata.persfume.chat.model.service;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestParam;

import com.mata.persfume.chat.model.vo.ChatMessage;

public interface ChatService {

	// 원데이클래스 번호로 채팅방 번호 추출
	String selectChatRoomId(String classNo);
	
	// 채팅에 참여한 유저가 채팅참여 가능한 유저인지 체크
	boolean checkUserCanExistChat(String userId, String chatNo);
	
	// 채팅 내역 DB에 저장
	int insertMsg(ChatMessage m);

	// 사용자 번호로 사용자 이름 추출
	String getMemName(int memNo);

	// 이전 채팅목록 조회
	ArrayList<ChatMessage> getPrevChatMessage(int chatNo);
	
	
}
