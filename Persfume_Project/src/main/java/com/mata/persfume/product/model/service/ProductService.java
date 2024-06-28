package com.mata.persfume.product.model.service;

import java.util.ArrayList;

import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.member.model.vo.Member;
import com.mata.persfume.product.model.vo.Cart;
import com.mata.persfume.product.model.vo.Coupon;
import com.mata.persfume.product.model.vo.Favorites;
import com.mata.persfume.product.model.vo.MemCoupon;
import com.mata.persfume.product.model.vo.OrderDetail;
import com.mata.persfume.product.model.vo.OrderProduct;
import com.mata.persfume.product.model.vo.Product;
import com.mata.persfume.product.model.vo.ProductImg;
import com.mata.persfume.product.model.vo.ProductReview;

public interface ProductService {

	
	
	// 상품조회 상품 총 갯수 조회
		int selectListCount();
		// 상품조회 (등록일순) 조회
		ArrayList<Product> selectList(PageInfo pi);
		// 상품조회(등록일순) 이미지 조회
		ArrayList<ProductImg> selectImgList(PageInfo pi);
		// 상품상세조회(상품번호) 
		Product selectProduct(int pno);
		// 상품상세조회이미지(상품번호)
		ArrayList<ProductImg> selectProductImgList(int pno);
		// 상품상세조회이미지 썸네일(상품번호)
		ProductImg selectProductImg(int pno);
		// 회원번호로 등록된 쿠폰 가져오기(회원번호)
		ArrayList<MemCoupon> searchCoupon(int mno);
		// 쿠폰 이름을 위한 리스트
		Coupon searchCouponName(int cno);
		// 주문 완료하면 주문 테이블에 정보 넣기
		int orderComplete(String merchant_uid, int amount, String want5, int mno, int adno, String address, String phone);
		// 주문 완료하면 상품주문테이블에 정보 넣기
		int insertOrderProduct(int pcount, int account, int ono, int pno);
		// 주문 테이블에 정보 넣기 성공 후 정보 긁어오기
		OrderDetail orderview(String merchant_uid);
		// 카트에 상품 담기
		int cartAdd(int account, int quantity, int mno, int pno);
		// 카트에 담긴 물건 리스트 조회
		ArrayList<Cart> selectCartList(int mno);
		// 카트에 담긴 선택 물건 삭제
		int cartdelete(int deletecartNo);
		// 카트 수량 변경
		int cartUpdate(int basketNo, int quantity, int price);
		// 카트 가져오기
		Cart cartSelect(int basketNo);
		// 구매 완료하면 재고수량 빼기
		int minusQuantity(int newQuantity, int pno);
		// 장바구니 구매하면 장바구니에 있는 것들 삭제 
		int completeCart(int mno);
		// 주문 완료 후 주문 완료 페이지 보여주기용 
		OrderDetail selectOrder(int ono);
		// 주문완료 후 주문완료 페이지 보여주기용(오더지 긁어오기)
		ArrayList<OrderProduct> selectOrderProduct(int ono);
		// 상품 테이블에 상품 넣기
		int insertProduct(Product p);
		// 상품이미지테이블에 이미지 넣기(썸네일)
		int insertProductImg(ProductImg pi);
		// 상품이미지테이블에 이미지 넣기(썸네일 아닌 사진)
		int insertProductImg2(ProductImg pi);
		// 상품 테이블에서 상품명 이용해서 상품가져오기
		Product selectProductNo(String productName);
		// 나의주문내역 용도  회원번호로 주문내역 긁어오기
		ArrayList<OrderDetail> selectOrderDetail(int mno);
		// 주문번호로 오더지 긁어오기 단일 객체
		ArrayList<OrderProduct> selectOrderProduct1(int ono);
		// 상품 리뷰 넣기 
		int insertProductReview(ProductReview pr);
		// 상품번호로 해당 상품 리뷰 리스트로 긁어오기(상세페이지 조회용)
		ArrayList<ProductReview> selectProductReviewList(int pno);
		// 상품 찜하기 버튼 눌렀을 경우 찜  추가
		int favoriteAdd(int mno, int pno);
		// 상품 찜하기 되어 있는지 확인용
		Favorites selectFavorites(int mno, int pno);
		// 상품이 이미 찜하기 되어 있어서 삭제
		int favoriteDel(int mno, int pno);
		// 검색을 통한 상품 검색 리스트
		ArrayList<Product> searchselectList(PageInfo pi, String text);
		// 탑노트 리스트
		ArrayList<Product> selectTopNoteList();
		// 미들노트 리스트
		ArrayList<Product> selectMiddleNoteList();
		// 베이스노트 리스트
		ArrayList<Product> selectBaseNoteList();
		// 상품조회 (낮은순) 조회
		ArrayList<Product> selectAscList(PageInfo pi);
		// 상품조회 (높은순) 조회
		ArrayList<Product> selectDescList(PageInfo pi);
		// 상품조회 (판매순) 조회
		ArrayList<Product> selectPopList(PageInfo pi);
		// 상품 리스트 긁어오기(판매상품 조회용)
		ArrayList<Product> saleProductList();
		// 상품 정보 변경
		int updatepro(Product p);
		// 상품 이미지 경로 변경 썸네일
		int updateProductImg(ProductImg pi);
		// 상품 이미지 경로 변경 보조사진
		int updateProductImg2(ProductImg pi);
		// 상품 배송 출발 버튼 클릭 
		int orderDelivery(int ono);
		// 메인페이지 썸네일 12개 출력용 - 2024-06-21 윤민호
		ArrayList<ProductImg> getProductThumbnail();
		// 환불요청 시 환불요청 텍스트 변경
		int wantRefund(int odId);
		// 환불요청 시 관리자가 환불 승인 
		int doRefund(int odId);
		// 나의 찜 목록 조회에서 찜한 상품 목록 
		 ArrayList<Favorites> myFavoriteList(int mno);
		 // 상품리스트에서 체크박스 클릭 시 검색 기능 
		 Product searchNote(String array);
		 // 나의 쿠폰리스트 가져오기 
		 ArrayList<MemCoupon> myCoupon(int mno);
		 // 나의 쿠폰리스트에 쓸 쿠폰 이름 가져오기
		 Coupon CouponName(int CouponNo);
		 // 찜 개수 가져가기 
		 String countFavorite(int pno);
				 
				 
		 int deleteFavorite(Favorites f);
		 // 리뷰리스트 가져오기
		 ArrayList<ProductReview> myReview(int mno);
		 // 상품번호로 리뷰 가져오기 (나의 주문내역에서 리뷰 중복 작성 불가 위해서)
		 int selectReview(int pno);
		 
		 public Member selectMember(int memNo);
		 //사욯한 쿠폰 삭제
		 int couponDelete(MemCoupon mc);
		 // 회원 긁어오기
		
		
}//인터페이스 종료
