package com.mata.persfume.cart.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mata.persfume.cart.model.vo.Cart;
import com.mata.persfume.common.model.vo.PageInfo;

@Repository
public class CartDao {
	
	 // 페이징된 장바구니 목록 조회
    public ArrayList<Cart> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return (ArrayList) sqlSession.selectList("cartMapper.selectList", null, rowBounds);
    }


    // 장바구니 추가
    public int addCart(SqlSessionTemplate sqlSession, Cart c) {
        return sqlSession.insert("cartMapper.addCart", c);
    }

    
    // 특정 회원의 장바구니 조회
    public ArrayList<Cart> selectCart(SqlSessionTemplate sqlSession,
    													int memNo) {
        return (ArrayList) sqlSession.selectList("cartMapper.selectCart", memNo);
    }
    

    // 장바구니  수정
    public int editCart(SqlSessionTemplate sqlSession, Cart c) {
        return sqlSession.update("cartMapper.editCart", c);
    }

    // 장바구니 삭제
    public int deleteCart(SqlSessionTemplate sqlSession, String[] cartNos) {
        return sqlSession.delete("cartMapper.deleteCart", cartNos);
    }

    
    
    // 장바구니 목록 조회
    public ArrayList<Cart> cartList(SqlSessionTemplate sqlSession, Cart c) {
        return (ArrayList) sqlSession.selectList("cartMapper.cartList", c);
    }

    //  장바구니 모두 삭제
    public int allDeleteCart(SqlSessionTemplate sqlSession, int memNo) {
        return sqlSession.delete("cartMapper.allDeleteCart", memNo);
    }

   
    // 장바구니 목록 개수 조회
    public int selectListCount(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("cartMapper.selectListCount");
    }





	



	public Cart selectList(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("noticeMapper.selectNotice", memNo);
	}









	

	

	
}
