package com.mata.persfume.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.notice.model.vo.Notice;


@Repository
public class NoticeDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
			
			return sqlSession.selectOne("noticeMapper.selectListCount");
		}
	
	
	// �������� ����Ʈ ��ȸ��
	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return(ArrayList)sqlSession.selectList("noticeMapper.selectList", null, rowBounds);
	}

	// �������� �ۼ��� �޼ҵ�
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		
		
		return sqlSession.insert("noticeMapper.insertNotice", n);
		
	}
	
	// ��ȸ�� ������ �޼ҵ�
	public int increaseCount(SqlSessionTemplate sqlSession,
							 int noticeNo) {
		
		return sqlSession.update("noticeMapper.increaseCount", noticeNo);
	}
	
	// �������� ����ȸ�� �޼ҵ�
	public Notice selectNotice(SqlSessionTemplate sqlSession,
							   int noticeNo) {
		
	
		return sqlSession.selectOne("noticeMapper.selectBoard", noticeNo);
	}
	
	// �������� ������ �޼ҵ�
	public int updateNotice(SqlSessionTemplate sqlSession,
							Notice n) {
		
		return sqlSession.update("noticeMapper.updateNotice", n);
	}
	
	// �������� ������ �޼ҵ�
	public int deleteNotice(SqlSessionTemplate sqlSession,
							int noticeNo) {
		
		return sqlSession.update("noticeMapper.deleteNotice",noticeNo );
	
}


	
}



