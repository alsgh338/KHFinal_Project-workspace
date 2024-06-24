package com.mata.persfume.product.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.product.model.vo.Cart;
import com.mata.persfume.product.model.vo.Coupon;
import com.mata.persfume.product.model.vo.Favorites;
import com.mata.persfume.product.model.vo.MemCoupon;
import com.mata.persfume.product.model.vo.OrderDetail;
import com.mata.persfume.product.model.vo.OrderProduct;
import com.mata.persfume.product.model.vo.Product;
import com.mata.persfume.product.model.vo.ProductImg;
import com.mata.persfume.product.model.vo.ProductReview;

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
	public  int orderComplete(SqlSessionTemplate sqlSession, String merchant_uid, int amount, String want5, int mno, int adno, String address, String phone) {
	
	 OrderDetail od = new OrderDetail(merchant_uid, amount, want5, mno, adno, address, phone);
		
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
	
	public int insertOrderProduct(SqlSessionTemplate sqlSession, int pcount, int account, int ono, int pno) {
		OrderProduct op = new OrderProduct(pcount, account, ono, pno);
		return sqlSession.insert("productMapper.insertOrderProduct", op);
		
	}
	public int minusQuantity(SqlSessionTemplate sqlSession, int newQuantity, int pno) {
		Product p = new Product(pno, newQuantity);
		return sqlSession.update("productMapper.minusQuantity", p);
	}
	public int completeCart(SqlSessionTemplate sqlSession, int mno) {
		return sqlSession.delete("productMapper.completeCart", mno);
		
	}
	public OrderDetail selectOrder(SqlSessionTemplate sqlSession, int ono) {
		return sqlSession.selectOne("productMapper.selectOrder", ono);
	}
	public ArrayList<OrderProduct> selectOrderProduct(SqlSessionTemplate sqlSession, int ono) {
		 return (ArrayList)sqlSession.selectList("productMapper.selectOrderProduct", ono);
	}
	public int insertProduct(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.insert("productMapper.insertProduct", p);
		
	}
	public int insertProductImg(SqlSessionTemplate sqlSession, ProductImg pi) {
		return sqlSession.insert("productMapper.insertProductImg", pi);
		
	}
	public Product selectProductNo(SqlSessionTemplate sqlSession, String productName) {
		return sqlSession.selectOne("productMapper.selectProductNo", productName);
	}
	public int insertProductImg2(SqlSessionTemplate sqlSession, ProductImg pi) {
		return sqlSession.insert("productMapper.insertProductImg2", pi);
		
	}
	public ArrayList<OrderDetail> selectOrderDetail(SqlSessionTemplate sqlSession, int mno) {
		 return (ArrayList)sqlSession.selectList("productMapper.selectOrderDetail", mno);
	}
	public ArrayList<OrderProduct> selectOrderProduct1(SqlSessionTemplate sqlSession, int ono) {
		return (ArrayList)sqlSession.selectList("productMapper.selectOrderProduct1", ono);
	}
	public int insertProductReview(SqlSessionTemplate sqlSession, ProductReview pr) {
		return sqlSession.insert("productMapper.insertProductReview", pr);
		
	}
	public ArrayList<ProductReview> selectProductReviewList(SqlSessionTemplate sqlSession, int pno){
		return (ArrayList)sqlSession.selectList("productMapper.selectProductReviewList", pno);
	}
	public int favoriteAdd(SqlSessionTemplate sqlSession, int mno, int pno) {
		Favorites fa = new Favorites(pno, mno);
		return sqlSession.insert("productMapper.favoriteAdd", fa);
	}
	public Favorites selectFavorites(SqlSessionTemplate sqlSession, int mno, int pno){
		Favorites fa = new Favorites(pno, mno);
		return sqlSession.selectOne("productMapper.selectFavorites", fa);
	}
	public int favoriteDel(SqlSessionTemplate sqlSession, int mno, int pno) {
		Favorites fa = new Favorites(pno, mno);
		return sqlSession.delete("productMapper.favoriteDel", fa);
	}
	public  ArrayList<Product> searchselectList(SqlSessionTemplate sqlSession, PageInfo pi, String text){
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1 ) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("productMapper.searchselectList", text, rowBounds);	
	}
	public  ArrayList<Product> selectTopNoteList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("productMapper.selectTopNoteList");
	}
	public  ArrayList<Product> selectMiddleNoteList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("productMapper.selectMiddleNoteList");
	}
	public  ArrayList<Product> selectBaseNoteList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("productMapper.selectBaseNoteList");
	}
	
	public ArrayList<Product> selectAscList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1 ) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("productMapper.selectAscList", null, rowBounds);
		
	}
	public ArrayList<Product> selectDescList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1 ) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("productMapper.selectDescList", null, rowBounds);
		
	}
	public ArrayList<Product> selectPopList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() -1 ) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("productMapper.selectPopList", null, rowBounds);
		
	}
	public ArrayList<Product> saleProductList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("productMapper.saleProductList");
	}
	public int updatepro(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.update("productMapper.updatepro", p);
	}
	public int updateProductImg(SqlSessionTemplate sqlSession, ProductImg pi) {
		return sqlSession.update("productMapper.updateProductImg", pi);
	}
	public int updateProductImg2(SqlSessionTemplate sqlSession, ProductImg pi) {
		return sqlSession.update("productMapper.updateProductImg2", pi);
	}
	public int orderDelivery(SqlSessionTemplate sqlSession, int ono) {
		return sqlSession.update("productMapper.orderDelivery", ono);
	}
	
	// 메인페이지 썸네일 12개 출력용 - 2024-06-21 윤민호
	public ArrayList<ProductImg> getProductThumbnail(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("productMapper.getProductThumbnail");
	}
	public int wantRefund(SqlSessionTemplate sqlSession, int odId) {
		return sqlSession.update("productMapper.wantRefund", odId);
	}
	public int doRefund(SqlSessionTemplate sqlSession, int odId) {
		return sqlSession.update("productMapper.doRefund", odId);
	}
	public ArrayList<Favorites> myFavoriteList(SqlSessionTemplate sqlSession, int mno){
		return (ArrayList)sqlSession.selectList("productMapper.myFavoriteList", mno);
	}
	public Product searchNote(SqlSessionTemplate sqlSession, String array) {
	
		return sqlSession.selectOne("productMapper.searchNote", array);
	}
	public ArrayList<MemCoupon> myCoupon(SqlSessionTemplate sqlSession, int mno){
		return (ArrayList)sqlSession.selectList("productMapper.myCoupon", mno);
	}
	public Coupon CouponName(SqlSessionTemplate sqlSession, int CouponNo){
		return sqlSession.selectOne("productMapper.CouponName", CouponNo);
	}
	public Favorites countFavorite(SqlSessionTemplate sqlSession, int pno){
		return sqlSession.selectOne("productMapper.countFavorite", pno);
	}
	
}// 클래스종료
