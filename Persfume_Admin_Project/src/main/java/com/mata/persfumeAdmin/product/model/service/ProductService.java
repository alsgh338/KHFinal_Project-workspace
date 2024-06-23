package com.mata.persfumeAdmin.product.model.service;

import java.util.ArrayList;

import com.mata.persfumeAdmin.product.model.vo.Product;
import com.mata.persfumeAdmin.product.model.vo.ProductImg;

public interface ProductService {
	
	ArrayList<Product> selectAllproduct();
	
	ArrayList<Product> selectProduct(int productNo);

	int insertProduct(Product p);

	int insertProductImg(ProductImg pi1);

	ArrayList<ProductImg> selectProductpi(int productNo);
	
	int deleteProduct(int productNo);

	int productUpdate(Product p);

}
