package com.mata.persfume.product.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.common.template.Pagination;
import com.mata.persfume.product.model.service.ProductService;
import com.mata.persfume.product.model.vo.Coupon;
import com.mata.persfume.product.model.vo.MemCoupon;
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
	
	@PostMapping("order.po")
	public  ModelAndView productOrder(int pno, ModelAndView mv, HttpServletRequest request, HttpServletResponse response) {
		
		int pCount = Integer.parseInt(request.getParameter("result1"));
	
		Product p = productService.selectProduct(pno);
		ProductImg pi = productService.selectProductImg(pno);
		
		int memNo = 1; // 회원기능 완성 전 테스트용 더미 데이터 나중에 꼭 지우셈 
		
		mv.addObject("memNo", memNo);
		mv.addObject("p", p);
		mv.addObject("pi", pi);
		mv.addObject("pCount", pCount).setViewName("product/productOrderView");
		
		return mv;	
	}
	
	@ResponseBody
	@RequestMapping(value="ajax1.do", produces="application/json; charset=UTF-8")
	public String ajaxMethod1(int mno) {
		

		ArrayList<MemCoupon> list =  productService.searchCoupon(mno);
		ArrayList<Coupon> clist = new ArrayList<>();
		
		// 쓸 수 있는 쿠폰만 긁어온다 .
		// 쿠폰이름 가지러 간다. 
		if(list == null) {
			
		}else {
		
		for(int i =0 ; i<list.size(); i++) {
			Coupon c = productService.searchCouponName(list.get(i).getCouponNo());
			clist.add(c);
	
		}
	
		}// else 종료
		
			
		
		return new Gson().toJson(clist); //
	}
	
	@GetMapping("complete.po")
	@ResponseBody
	public String complete2(String merchant_uid, int amount, String imp_uid, String want5, int mno)  throws Exception{
		
		System.out.println(amount);
		System.out.println(merchant_uid);
		System.out.println(imp_uid);
		System.out.println(mno);
		System.out.println(want5);
		return "";
	}

}// 클래스종료
