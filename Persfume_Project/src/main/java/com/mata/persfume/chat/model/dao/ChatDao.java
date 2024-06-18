package com.mata.persfume.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mata.persfume.chat.model.vo.ChatMessage;
import com.mata.persfume.oneClass.model.vo.OneClassRegist;

@Repository
public class ChatDao {
	
	// 사용자 번호로 사용자 이름 추출
	public String getMemName(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("chatMapper.getMemName", memNo);
	}
	
	// 채팅에 참여한 유저가 채팅참여 가능한 유저인지 체크
	public boolean checkUserCanExistChat(SqlSessionTemplate sqlSession, ChatMessage m) {
		 int result = sqlSession.selectOne("chatMapper.checkUserCanExistChat", m);
		 
		 if(result > 0) {
			 
			 return true;
		 } else {
			 
			 return false;
		 }
		 		 
	}

	// 채팅내역 저장
	public int insertMsg(SqlSessionTemplate sqlSession, ChatMessage m) {
		return sqlSession.insert("chatMapper.insertMsg", m);
	}

	// 이전 채팅목록 조회
	public ArrayList<ChatMessage> getPrevChatMessage(SqlSessionTemplate sqlSession, String classNo) {
		ArrayList<ChatMessage> list = (ArrayList)sqlSession.selectList("chatMapper.getPrevChatMessage", classNo);
		
		return list;
	}
	
	public int insertChatMem(SqlSessionTemplate sqlSession, OneClassRegist ocr) {
		return sqlSession.insert("chatMapper.insertChatMem", ocr);
	}

	public ArrayList<ChatMessage> getChatList(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("chatMapper.getChatList", memNo);
	}
	

	
	
	
}
