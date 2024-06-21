package com.mata.persfumeAdmin.event.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mata.persfumeAdmin.event.model.vo.Event;
import com.mata.persfumeAdmin.event.model.vo.EventImg;

@Repository
public class EventDao {

	// 이벤트 리스트 조회
	public ArrayList<Event> selectEventList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("eventMapper.selectEventList");
	}

	// 이벤트 상세 조회
	public Event selectEventDetail(SqlSessionTemplate sqlSession, int eno) {
		return sqlSession.selectOne("eventMapper.selectEventDetail", eno);
	}

	// 이벤트 상세 조회 (썸네일만)
	public Event selectEventThumbnail(SqlSessionTemplate sqlSession, int eno) {
		return sqlSession.selectOne("eventMapper.selectEventThumbnail", eno);
	}

	// 이벤트 본문 수정
	public int modifyEvent(SqlSessionTemplate sqlSession, Event e) {
		return sqlSession.update("eventMapper.modifyEvent", e);
	}

	// 이벤트 사진 수정
	public int modifyEventImg(SqlSessionTemplate sqlSession, EventImg ei) {
		return sqlSession.update("eventMapper.modifyEventImg", ei);
	}

	// 이벤트 작성
	public int insertEvent(SqlSessionTemplate sqlSession, Event e) {
		return sqlSession.update("eventMapper.insertEvent", e);
	}

	// 이벤트 작성 (이미지)
	public int insertEventImg(SqlSessionTemplate sqlSession, EventImg ei) {
		return sqlSession.update("eventMapper.insertEventImg", ei);
	}

	public int deleteEvent(SqlSessionTemplate sqlSession, int eno) {
		return sqlSession.update("eventMapper.deleteEvent", eno);
	}

	public int restoreEvent(SqlSessionTemplate sqlSession, int eno) {
		return sqlSession.update("eventMapper.restoreEvent", eno);
	}

}
