package com.mata.persfumeAdmin.product.model.service;

import java.util.ArrayList;

import com.mata.persfumeAdmin.product.model.vo.OrderDetail;
import com.mata.persfumeAdmin.product.model.vo.OrderProduct;
import com.mata.persfumeAdmin.product.model.vo.Product;
import com.mata.persfumeAdmin.product.model.vo.ProductImg;
import com.mata.persfumeAdmin.product.model.vo.ProductReview;

public interface ProductService {
	
	ArrayList<Product> selectAllproduct();
	
	ArrayList<Product> selectProduct(int productNo);

	int insertProduct(Product p);

	int insertProductImg(ProductImg pi);

	ArrayList<ProductImg> selectProductpi(int productNo);
	
	int deleteProduct(int productNo);

	int productUpdate(Product p);

	int productImgUpdate(ProductImg pi);

	ArrayList<ProductReview> selectAllreview();
	
	int reviewDelete(int reviewNo);
	
	int productImgdele(String delimgPath);

	int insertProductImg2(ProductImg pi);

	// 나의주문내역 용도  회원번호로 주문내역 긁어오기
	ArrayList<OrderDetail> selectOrderDetail(int mno);
	// 주문번호로 오더지 긁어오기 단일 객체
	ArrayList<OrderProduct> selectOrderProduct1(int ono);
	// 상품상세조회(상품번호) 
	Product selectProduct1(int pno);
	// 상품 배송 출발 버튼 클릭 
	int orderDelivery(int ono);
	// 환불요청 시 관리자가 환불 승인 
	int doRefund(int odId);
	// 그냥 모든 주문 긁어오기
	ArrayList<OrderDetail> selectOrderDetail1();
}
