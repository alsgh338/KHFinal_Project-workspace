package com.mata.persfume.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mata.persfume.chat.model.vo.ChatMessage;

@Repository
public class ChatDao {
	
	// 원데이클래스 번호로 채팅방 번호 추출
	public String selectChatRoomId(SqlSessionTemplate sqlSession, String classNo) {
		return sqlSession.selectOne("chatMapper.selectChatRoomId", classNo);
	}

	// 사용자 번호로 사용자 이름 추출
	public String getMemName(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("chatMapper.getMemName", memNo);
	}
	
	// 채팅에 참여한 유저가 채팅참여 가능한 유저인지 체크
	public boolean checkUserCanExistChat(SqlSessionTemplate sqlSession, String userId, String chatNo) {
		 if((int)(sqlSession.selectOne("chatMapper.checkUserCanExistChat")) > 0) {
			 return true; // 쿼리문 결과가 0보다 크다면 채팅참여 가능한 유저
		 }
		return false; 	  // 0이라면 채팅참여 불가능한 유저
	}

	// 채팅내역 저장
	public int insertMsg(SqlSessionTemplate sqlSession, ChatMessage m) {
		return sqlSession.insert("chatMapper.insertMsg", m);
	}

	// 이전 채팅목록 조회
	public ArrayList<ChatMessage> getPrevChatMessage(SqlSessionTemplate sqlSession, int chatNo) {
		ArrayList<ChatMessage> list = (ArrayList)sqlSession.selectList("chatMapper.getPrevChatMessage", chatNo);
		
		System.out.println(list);
		
		
		return list;
	}

	
	
	
}
