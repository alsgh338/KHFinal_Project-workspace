package com.mata.persfume.event.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.event.model.vo.Event;

@Repository
public class EventDao {

	// 게시글 총 갯수
	public int selectListCount(SqlSession sqlSession) {
		return sqlSession.selectOne("eventMapper.selectListCount");
	}

	public ArrayList<Event> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("eventMapper.selectList", null, rowBounds);
	}

}
