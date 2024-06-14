package com.mata.persfume.chat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mata.persfume.chat.model.dao.ChatDao;
import com.mata.persfume.chat.model.vo.ChatMessage;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ChatDao chatDao;
	
	// 원데이클래스 번호로 채팅방 번호 추출
	@Override
	public String selectChatRoomId(String classNo) {
		return chatDao.selectChatRoomId(sqlSession, classNo);
	}
	
	// 사용자 번호로 사용자 이름 추출
	@Override
	public String getMemName(int memNo) {
		return chatDao.getMemName(sqlSession, memNo);
	}
	
	// 채팅에 참여한 유저가 채팅참여 가능한 유저인지 체크
	@Override
	public boolean checkUserCanExistChat(String userId, String chatNo) {
		return chatDao.checkUserCanExistChat(sqlSession, userId, chatNo);
	}

	// 채팅내역 저장
	@Override
	public int insertMsg(ChatMessage m) {
		return chatDao.insertMsg(sqlSession, m);
	}

	// 이전 채팅목록 조회
	@Override
	public ArrayList<ChatMessage> getPrevChatMessage(int chatNo) {
		return chatDao.getPrevChatMessage(sqlSession, chatNo);
	}

	

	

}
