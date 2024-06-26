package com.mata.persfume.chat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mata.persfume.chat.model.dao.ChatDao;
import com.mata.persfume.chat.model.vo.ChatMessage;
import com.mata.persfume.oneClass.model.vo.OneClassRegist;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ChatDao chatDao;
	
	// 사용자 번호로 사용자 이름 추출
	@Override
	public String getMemName(int memNo) {
		return chatDao.getMemName(sqlSession, memNo);
	}
	
	// 채팅에 참여한 유저가 채팅참여 가능한 유저인지 체크
	@Override
	public boolean checkUserCanExistChat(ChatMessage m) {
		return chatDao.checkUserCanExistChat(sqlSession, m);
	}

	// 채팅내역 저장
	@Override
	public int insertMsg(ChatMessage m) {
		return chatDao.insertMsg(sqlSession, m);
	}

	// 이전 채팅목록 조회
	@Override
	public ArrayList<ChatMessage> getPrevChatMessage(String classNo) {
		return chatDao.getPrevChatMessage(sqlSession, classNo);
	}
	
	// 채팅방 명단 추가 ajax
	@Override
	public int insertChatMem(OneClassRegist ocr) {
		return chatDao.insertChatMem(sqlSession, ocr);
	}

	// 내가 속한 채팅방 리스트 조회
	@Override
	public ArrayList<ChatMessage> getChatList(int memNo) {
		return chatDao.getChatList(sqlSession, memNo);
	}

	

	

}
