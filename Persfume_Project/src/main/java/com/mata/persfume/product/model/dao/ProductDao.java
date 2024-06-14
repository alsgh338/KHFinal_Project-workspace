package com.mata.persfume.product.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.product.model.vo.Cart;
import com.mata.persfume.product.model.vo.Coupon;
import com.mata.persfume.product.model.vo.MemCoupon;
import com.mata.persfume.product.model.vo.OrderDetail;
import com.mata.persfume.product.model.vo.Product;
import com.mata.persfume.product.model.vo.ProductImg;

@Repository
public class ProductDao {

	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("productMapper.selectListCount");
	}
	
	public ArrayList<Product> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1 ) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("productMapper.selectList", null, rowBounds);
		
	}
	public ArrayList<ProductImg> selectImgList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1 ) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("productMapper.selectImgList", null, rowBounds);
		
	}
	
	public Product selectProduct(SqlSessionTemplate sqlSession, int pno) {
	 return sqlSession.selectOne("productMapper.selectProduct", pno);
	}
	
	public ArrayList<ProductImg> selectProductImgList(SqlSessionTemplate sqlSession, int pno) {
		 return (ArrayList)sqlSession.selectList("productMapper.selectProductImgList", pno);
		}
	public ProductImg selectProductImg(SqlSessionTemplate sqlSession, int pno) {
		 return sqlSession.selectOne("productMapper.selectProductImg", pno);
		}
	public ArrayList<MemCoupon> searchCoupon(SqlSessionTemplate sqlSession, int mno) {
		 return (ArrayList)sqlSession.selectList("productMapper.searchCoupon", mno);
		}
	public  Coupon searchCouponName(SqlSessionTemplate sqlSession, int cno){
		return sqlSession.selectOne("productMapper.searchCouponName", cno);
	}
	public  int orderComplete(SqlSessionTemplate sqlSession, String merchant_uid, int amount, String want5, int mno) {
	
	 OrderDetail od = new OrderDetail(merchant_uid, amount, want5, mno);
		
		return sqlSession.insert("productMapper.orderComplete", od);
	}
	public OrderDetail orderview(SqlSessionTemplate sqlSession, String merchant_uid) {
		return sqlSession.selectOne("productMapper.orderview", merchant_uid);
	}
	public int cartAdd(SqlSessionTemplate sqlSession, int account, int quantity, int mno, int pno) {
		Cart c = new Cart(account, quantity, mno, pno);
		return sqlSession.insert("productMapper.cartAdd", c);
	}
	public ArrayList<Cart> selectCartList(SqlSessionTemplate sqlSession, int mno){
		return (ArrayList)sqlSession.selectList("productMapper.selectCartList", mno);	
	}
	
	public int cartdelete(SqlSessionTemplate sqlSession, int deletecartNo) {
		int cno = deletecartNo;
		return sqlSession.delete("productMapper.cartdelete", cno);
		
	}
	public int cartUpdate(SqlSessionTemplate sqlSession, int basketNo, int quantity, int price) {
		Cart c = new Cart(basketNo, price, quantity);
		return sqlSession.update("productMapper.cartUpdate", c);
	}
	
	public Cart cartSelect(SqlSessionTemplate sqlSession, int basketNo) {
		int cno = basketNo;
		return sqlSession.selectOne("productMapper.cartSelect", cno);			
	}
	
}// 클래스종료
