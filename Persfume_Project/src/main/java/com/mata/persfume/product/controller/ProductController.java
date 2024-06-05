package com.mata.persfume.product.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.common.template.Pagination;
import com.mata.persfume.product.model.service.ProductService;
import com.mata.persfume.product.model.vo.Product;
import com.mata.persfume.product.model.vo.ProductImg;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	
	
	@RequestMapping("list.po")
	public String productList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model){
		
		
		int listCount = productService.selectListCount();
		int pageLimit = 10;
		int boardLimit = 5;

		PageInfo pi 
		= Pagination.getPageInfo(listCount, 
							 	 currentPage, 
							 	 pageLimit, 
							 	 boardLimit);
		ArrayList<Product> list 
		= productService.selectList(pi);
	
		ArrayList<ProductImg> ilist 
		= productService.selectImgList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("ilist", ilist);
	
		
	
		
		return "product/productListView";
	}
	
	@GetMapping("detail.po")
	public ModelAndView productDetail(int pno, ModelAndView mv) {
		
		Product p = productService.selectProduct(pno);
		ArrayList<ProductImg> pilist = productService.selectProductImgList(pno);
		ProductImg pi = productService.selectProductImg(pno);
		
		mv.addObject("pi", pi);
		mv.addObject("pilist", pilist);
		mv.addObject("p", p)
		  .setViewName("product/productDetailView");
		
		
		return mv;
		
	}
	
	public 
}// 클래스종료
