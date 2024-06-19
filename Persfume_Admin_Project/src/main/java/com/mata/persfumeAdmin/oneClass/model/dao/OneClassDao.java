package com.mata.persfumeAdmin.oneClass.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mata.persfumeAdmin.oneClass.model.vo.OneClass;
import com.mata.persfumeAdmin.oneClass.model.vo.OneClassImg;
import com.mata.persfumeAdmin.oneClass.model.vo.OneClassRegist;
import com.mata.persfumeAdmin.oneClass.model.vo.OneClassReview;


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

	

}
