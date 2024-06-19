package com.mata.persfumeAdmin.product.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.mata.persfumeAdmin.product.model.service.ProductService;
import com.mata.persfumeAdmin.product.model.vo.Product;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@GetMapping("proList.pr")
	public String productList(Model model) {
		
		ArrayList<Product> list =  productService.selectAllproduct();
		
		System.out.println(list);
		
		model.addAttribute("list", list); // Model에 list를  attribute로 설정
		
		return "Product/ProductListView";
	}
	
	@GetMapping("update.pr")
	public String productUpdate(int productNo,
							HttpSession session,
							Model model) {
		
		System.out.println("상품 수정하기 잘 호출되나?");
		
		ArrayList<Product> list = productService.selectProduct(productNo);
		
		System.out.println(list);
		
		model.addAttribute("list", list); // Model에 list를  attribute로 설정
		
		return "Product/ProductEnrollForm";
		
	}

}
