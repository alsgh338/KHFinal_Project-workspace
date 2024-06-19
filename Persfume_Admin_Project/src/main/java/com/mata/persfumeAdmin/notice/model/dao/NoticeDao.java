package com.mata.persfumeAdmin.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


import com.mata.persfumeAdmin.notice.model.vo.Notice;


@Repository
public class NoticeDao {

	
	// 공지사항 리스트 조회
		public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession) {
			
		
			return(ArrayList)sqlSession.selectList("noticeMapper.selectList" );
		}
		

	// 공지사항 작성용 메소드
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		
		
		return sqlSession.insert("noticeMapper.insertNotice", n);
		
	}
	
	// 조회수 증가용 메소드
	public int increaseCount(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.update("noticeMapper.increaseCount", noticeNo);
	}
	
	// 공지사항 상세조회용 메소드
	public Notice selectNotice(SqlSessionTemplate sqlSession,
							   int noticeNo) {
		
	
		return sqlSession.selectOne("noticeMapper.selectNotice", noticeNo);
	}
	
	// 공지사항 수정용 메소드
	public int updateNotice(SqlSessionTemplate sqlSession, Notice n) {
		
		return sqlSession.update("noticeMapper.updateNotice", n);
	}
	
	// 공지사항 삭제용 메소드
	public int deleteNotice(SqlSessionTemplate sqlSession,int noticeNo) {
		
		return sqlSession.update("noticeMapper.deleteNotice",noticeNo );
	
}


   
	
	
}



