package com.mata.persfumeAdmin.oneClass.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mata.persfumeAdmin.oneClass.model.vo.OneClass;
import com.mata.persfumeAdmin.oneClass.model.vo.OneClassImg;
import com.mata.persfumeAdmin.oneClass.model.vo.OneClassRegist;
import com.mata.persfumeAdmin.oneClass.model.vo.OneClassReview;
import com.mata.persfumeAdmin.oneClass.model.vo.OneClassTeacher;


// 관리자용 DAO
@Repository
public class OneClassDao {
	
	
	public int insertOneClass(SqlSessionTemplate sqlSession, OneClass oc) {
		System.out.println(oc);
		return sqlSession.insert("oneClassMapper.insertOneClass", oc);
	}

	public int insertOneClassImg(SqlSessionTemplate sqlSession, ArrayList<OneClassImg> ociList) {
		System.out.println(ociList);
		
		int result = 1;
		for(OneClassImg oci : ociList) {
			System.out.println(oci);
			result *= sqlSession.insert("oneClassMapper.insertOneClassImg", oci);
		}
		
		return result;
	}
	
	public ArrayList<OneClass> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("oneClassMapper.selectList");

	}
	
	public OneClass selectOneClass(SqlSessionTemplate sqlSession, int ocno) {
		return sqlSession.selectOne("oneClassMapper.selectOneClass",ocno);
	}
	
	public ArrayList<OneClassImg> selectOneClassImgList(SqlSessionTemplate sqlSession, int ocno) {
		return (ArrayList)sqlSession.selectList("oneClassMapper.selectOneClassImgList",ocno);
	}
	
	public int updateOneClass(SqlSessionTemplate sqlSession, OneClass oc) {
		return sqlSession.update("oneClassMapper.updateOneClass",oc);
	}
	
	public ArrayList<OneClassRegist> selectRegistList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("oneClassMapper.selectRegistList");
	}

	public int deleteOneClass(SqlSessionTemplate sqlSession, int ocno) {
		return sqlSession.update("oneClassMapper.deleteOneClass",ocno);
	}
	
	public int restoreOneClass(SqlSessionTemplate sqlSession, int ocno) {
		return sqlSession.update("oneClassMapper.restoreOneClass",ocno);
	}
	
	public int updateOneClassImg(SqlSessionTemplate sqlSession, ArrayList<OneClassImg> ociList) {
		int result = 1;
		for(int i = 0 ; i < ociList.size(); i++) {
			System.out.println("히히" + ociList.get(i));
			result *= sqlSession.update("oneClassMapper.updateOneClassImg", ociList.get(i));
			
			System.out.println("킥킥" + result);
		}
		
		return result;
	}
	
	
	public ArrayList<OneClassTeacher> selectTeacherList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("oneClassMapper.selectTeacherList");
	}
	
	public ArrayList<OneClassReview> selectReviewList(SqlSessionTemplate sqlSession,String octc) {
		return (ArrayList)sqlSession.selectList("oneClassMapper.selectReviewList", octc);
	}
	
	public int deleteReview(SqlSessionTemplate sqlSession , int ocrno) {
		return sqlSession.delete("oneClassMapper.deleteReview", ocrno);
	}
	
	public int deleteRegist(SqlSessionTemplate sqlSession ,String ocrno) {
		return sqlSession.update("oneClassMapper.deleteRegist", ocrno);

	}

}
