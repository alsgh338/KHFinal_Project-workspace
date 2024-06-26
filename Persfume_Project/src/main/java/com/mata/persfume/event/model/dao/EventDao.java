package com.mata.persfume.event.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.event.model.vo.Event;
import com.mata.persfume.event.model.vo.EventImg;

@Repository
public class EventDao {

	// 이벤트 총 갯수
	public int selectExpiredListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("eventMapper.selectExpiredListCount");
	}

	public int selectOngoingListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("eventMapper.selectOngoingListCount");
	}

	public int selectScheduledListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("eventMapper.selectScheduledListCount");
	}

	// 이벤트 리스트 조회
	public ArrayList<Event> selectExpiredList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("eventMapper.selectExpiredList", null, rowBounds);
	}

	public ArrayList<Event> selectOngoingList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("eventMapper.selectOngoingList", null, rowBounds);
	}

	public ArrayList<Event> selectScheduledList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("eventMapper.selectScheduledList", null, rowBounds);
	}

	public ArrayList<Event> selectEventList(SqlSessionTemplate sqlSession) {
		ArrayList<Event> list = (ArrayList)sqlSession.selectList("eventMapper.selectEventList");
		return list;
	}
	
	// 이벤트 작성 (제목, 내용, 기간)
	public int insertEvent(SqlSessionTemplate sqlSession, Event e) {		
		return sqlSession.insert("eventMapper.insertEvent", e);
	}

	// 이벤트 작성 (이미지 1장)
	public int insertEventImg(SqlSessionTemplate sqlSession, EventImg ei) {
		return sqlSession.insert("eventMapper.insertEventImg", ei);
	}

	// 조회수 증가용
	public int increaseCount(SqlSessionTemplate sqlSession, int eno) {
		return sqlSession.update("eventMapper.increaseCount", eno);
	}

	// 상세정보 조회용
	public Event selectEvent(SqlSessionTemplate sqlSession, int eno) {
		return sqlSession.selectOne("eventMapper.selectEvent", eno);
	}

	

	

	
	
	
	
}
