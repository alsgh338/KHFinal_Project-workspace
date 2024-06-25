package com.mata.persfumeAdmin.product.model.service;

import java.util.ArrayList;

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

}
