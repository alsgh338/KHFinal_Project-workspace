package com.mata.persfume.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.notice.model.vo.Notice;


@Repository
public class NoticeDao {
	
	//공지사항 리스트 총 갯수 조회
	public int selectListCount(SqlSessionTemplate sqlSession) {
			
			return sqlSession.selectOne("noticeMapper.selectListCount");
		}
	
	
	// 공지사항 리스트 조회
	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return(ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
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
	public int updateNotice(SqlSessionTemplate sqlSession,
							Notice n) {
		
		return sqlSession.update("noticeMapper.updateNotice", n);
	}
	
	// 공지사항 삭제용 메소드
	public int deleteNotice(SqlSessionTemplate sqlSession,int noticeNo) {
		
		return sqlSession.update("noticeMapper.deleteNotice",noticeNo );
	
}


    // 공지사항 검색 리스트 총 갯수 조회
    public int getSearchListCount(SqlSessionTemplate sqlSession, String searchType, String keyword) {
        Map<String, String> map = new HashMap<>();
        map.put("searchType", searchType);
        map.put("keyword", keyword);
        return sqlSession.selectOne("noticeMapper.getSearchListCount", map);
    }
    
	 // 공지사항 검색 리스트 조회
    public ArrayList<Notice> searchNoticeList(SqlSessionTemplate sqlSession, PageInfo pi, String searchType, String keyword) {
    	   Map<String, Object> map = new HashMap<>();
           map.put("searchType", searchType);
           map.put("keyword", keyword);
           int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
           RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        
        return (ArrayList) sqlSession.selectList("noticeMapper.searchNoticeList", map, rowBounds);
    }


	// 메인화면에 표시할 공지 (최신순 5개) - 2024-06-21 윤민호
	public ArrayList<Notice> showMainNotice(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("noticeMapper.showMainNotice");
	}

	
}



