package com.mata.persfume.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.product.model.dao.ProductDao;
import com.mata.persfume.product.model.vo.Cart;
import com.mata.persfume.product.model.vo.Coupon;
import com.mata.persfume.product.model.vo.Favorites;
import com.mata.persfume.product.model.vo.MemCoupon;
import com.mata.persfume.product.model.vo.OrderDetail;
import com.mata.persfume.product.model.vo.OrderProduct;
import com.mata.persfume.product.model.vo.Product;
import com.mata.persfume.product.model.vo.ProductImg;
import com.mata.persfume.product.model.vo.ProductReview;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ProductDao productDao;
	
	
	@Override
	public int selectListCount() {
	
		return productDao.selectListCount(sqlSession);
		
	}

	@Override
	public ArrayList<Product> selectList(PageInfo pi) {
		
		return productDao.selectList(sqlSession, pi);
	}

	@Override
	public ArrayList<ProductImg> selectImgList(PageInfo pi) {

		return productDao.selectImgList(sqlSession, pi);
	}

	@Override
	public Product selectProduct(int pno) {
		
		return productDao.selectProduct(sqlSession, pno);
	}

	@Override
	public ArrayList<ProductImg> selectProductImgList(int pno) {
	
		return productDao.selectProductImgList(sqlSession, pno);
	}

	@Override
	public ProductImg selectProductImg(int pno) {
		
		return productDao.selectProductImg(sqlSession, pno);
	}

	@Override
	public ArrayList<MemCoupon> searchCoupon(int mno) {
		
		return productDao.searchCoupon(sqlSession, mno);
	}

	@Override
	public Coupon searchCouponName(int cno) {
		
		return productDao.searchCouponName(sqlSession, cno);
	}

	@Override
	public int orderComplete(String merchant_uid, int amount, String want5, int mno, int adno, String address, String phone) {
	
		return productDao.orderComplete(sqlSession, merchant_uid, amount, want5, mno, adno, address, phone);
	}

	@Override
	public OrderDetail orderview(String merchant_uid) {
		
		return productDao.orderview(sqlSession, merchant_uid);
	}

	@Override
	public int cartAdd(int account, int quantity, int mno, int pno) {
		
		return productDao.cartAdd(sqlSession, account, quantity, mno, pno );
	}

	@Override
	public ArrayList<Cart> selectCartList(int mno) {
		
		return productDao.selectCartList(sqlSession, mno);
	}

	@Override
	public int cartdelete(int deletecartNo) {
		
		return productDao.cartdelete(sqlSession, deletecartNo);
	}

	@Override
	public int cartUpdate(int basketNo, int quantity, int price) {
		
		return  productDao.cartUpdate(sqlSession, basketNo, quantity, price);
	}

	@Override
	public Cart cartSelect(int basketNo) {
		
		return  productDao.cartSelect(sqlSession, basketNo);
	}

	@Override
	public int insertOrderProduct(int pcount, int account, int ono, int pno) {
		return  productDao.insertOrderProduct(sqlSession, pcount, account, ono, pno);
	}

	@Override
	public int minusQuantity(int newQuantity, int pno) {
		return productDao.minusQuantity(sqlSession, newQuantity, pno);
	}

	@Override
	public int completeCart(int mno) {
		return productDao.completeCart(sqlSession, mno);
	}

	@Override
	public OrderDetail selectOrder(int ono) {
	
		return  productDao.selectOrder(sqlSession, ono);
	}

	@Override
	public ArrayList<OrderProduct> selectOrderProduct(int ono) {
		return (ArrayList)productDao.selectOrderProduct(sqlSession, ono);
	}

	@Override
	public int insertProduct(Product p) {
	
		return productDao.insertProduct(sqlSession, p);
	}

	@Override
	public int insertProductImg(ProductImg pi) {
		
		return productDao.insertProductImg(sqlSession, pi);
	}

	@Override
	public Product selectProductNo(String productName) {
		return productDao.selectProductNo(sqlSession, productName);
	}

	@Override
	public int insertProductImg2(ProductImg pi) {
		
		return productDao.insertProductImg2(sqlSession, pi);
	}

	@Override
	public ArrayList<OrderDetail> selectOrderDetail(int mno) {
		
		return (ArrayList)productDao.selectOrderDetail(sqlSession, mno);
	}

	@Override
	public ArrayList<OrderProduct> selectOrderProduct1(int ono) {
		return (ArrayList)productDao.selectOrderProduct1(sqlSession, ono);
	}

	@Override
	public int insertProductReview(ProductReview pr) {
	
		return productDao.insertProductReview(sqlSession, pr);
	}

	@Override
	public ArrayList<ProductReview> selectProductReviewList(int pno) {
	
		return (ArrayList)productDao.selectProductReviewList(sqlSession, pno);
	}

	@Override
	public int favoriteAdd(int mno, int pno) {
		return productDao.favoriteAdd(sqlSession, mno, pno);
	}

	@Override
	public Favorites selectFavorites(int mno, int pno) {
		return productDao.selectFavorites(sqlSession, mno, pno);
	}

	@Override
	public int favoriteDel(int mno, int pno) {
		return productDao.favoriteDel(sqlSession, mno, pno);
	}

	@Override
	public ArrayList<Product> searchselectList(PageInfo pi, String text) {
	
		return (ArrayList)productDao.searchselectList(sqlSession, pi, text);
	}

	@Override
	public ArrayList<Product> selectTopNoteList() {
		return (ArrayList)productDao.selectTopNoteList(sqlSession);
	}

	@Override
	public ArrayList<Product> selectMiddleNoteList() {
		return (ArrayList)productDao.selectMiddleNoteList(sqlSession);
	}

	@Override
	public ArrayList<Product> selectBaseNoteList() {
		return (ArrayList)productDao.selectBaseNoteList(sqlSession);
	}

	@Override
	public ArrayList<Product> selectAscList(PageInfo pi) {
		return  productDao.selectAscList(sqlSession, pi);
	}

	@Override
	public ArrayList<Product> selectDescList(PageInfo pi) {
		return  productDao.selectDescList(sqlSession, pi);
	}

	@Override
	public ArrayList<Product> selectPopList(PageInfo pi) {
		return  productDao.selectPopList(sqlSession, pi);
	}

	@Override
	public ArrayList<Product> saleProductList() {
		return productDao.saleProductList(sqlSession);
	}

	@Override
	public int updatepro(Product p) {
		return productDao.updatepro(sqlSession, p);
	}

	@Override
	public int updateProductImg(ProductImg pi) {
		return productDao.updateProductImg(sqlSession, pi);
	}

	@Override
	public int updateProductImg2(ProductImg pi) {
		return productDao.updateProductImg2(sqlSession, pi);
	}

	@Override
	public int orderDelivery(int ono) {
		return  productDao.orderDelivery(sqlSession, ono);
	}

	// 메인페이지 썸네일 12개 출력용 - 2024-06-21 윤민호
	@Override
	public ArrayList<ProductImg> getProductThumbnail() {
		return productDao.getProductThumbnail(sqlSession);
	}
	
	@Override
	public int wantRefund(int odId) {
		return productDao.wantRefund(sqlSession, odId);

	}

	@Override
	public int doRefund(int odId) {
		return productDao.doRefund(sqlSession, odId);
	}

	@Override
	public ArrayList<Favorites> myFavoriteList(int mno) {
		return productDao.myFavoriteList(sqlSession, mno);
	}

	@Override
	public Product searchNote(String array) {
		return productDao.searchNote(sqlSession, array);
	}

	@Override
	public ArrayList<MemCoupon> myCoupon(int mno) {
		return productDao.myCoupon(sqlSession, mno);
	}

	@Override
	public Coupon CouponName(int CouponNo) {

		return productDao.CouponName(sqlSession, CouponNo);
	}

	@Override
	public Favorites countFavorite(int pno) {
		return productDao.countFavorite(sqlSession, pno);
	}



}
