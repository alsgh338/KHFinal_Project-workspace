package com.mata.persfume.product.controller;

import java.io.File;
import java.io.IOException;
import java.net.http.HttpRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.common.template.Pagination;
import com.mata.persfume.member.model.service.MemberService;
import com.mata.persfume.member.model.vo.Member;
import com.mata.persfume.product.model.service.ProductService;
import com.mata.persfume.product.model.vo.Cart;
import com.mata.persfume.product.model.vo.Coupon;
import com.mata.persfume.product.model.vo.Favorites;
import com.mata.persfume.product.model.vo.MemCoupon;
import com.mata.persfume.product.model.vo.OrderDetail;
import com.mata.persfume.product.model.vo.OrderProduct;
import com.mata.persfume.product.model.vo.Product;
import com.mata.persfume.product.model.vo.ProductImg;
import com.mata.persfume.product.model.vo.ProductReview;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	
	
	/// 일반메소드  >>    메소드에서 당겨 쓸 용도
	public String savePath(MultipartFile upfile,
			   HttpSession session) {

// 1. 원본파일명 뽑아오기
String originName = upfile.getOriginalFilename(); 
				
// 2. 시간 형식으로 문자열로 뽑아내기 (년월일시분초)
String currentTime 
	= new SimpleDateFormat("yyyyMMddHHmmss")
						.format(new Date());
							// "20240521161430" 

// 3. 뒤에 붙을 5자리 랜덤수 얻어내기 (10000 ~ 99999)
int ranNum = (int)(Math.random() * 90000 + 10000);
							// 12345

// 4. 원본파일명으로부터 확장자명 뽑기
String ext 
= originName.substring(originName.lastIndexOf("."));
						

// 5. 2 ~ 4 까지 모두 이어 붙이기
String changeName = currentTime + ranNum + ext;

// 6. 업로드하고자 하는 물리적인 서버의 경로 알아내기
// > application 객체로부터
// (webapp/resources/uploadFiles/~~)
String savePath
	= session.getServletContext()
			 .getRealPath("/resources/uploadFiles/");

// 7. 경로와 수정파일명 합체 후 파일을 업로드해주기
// > MultipartFile 객체가 제공하는
//   transferTo 메소드를 이용함
try {

upfile.transferTo(new File(savePath + changeName));

} catch (IllegalStateException | IOException e) {
e.printStackTrace();
}

// 수정파일명 문자열을 리턴
return changeName;
}
	///
	
	
	@RequestMapping("list.po")
	public String productList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model){
		
		
		int listCount = productService.selectListCount();
		int pageLimit = 5;
		int boardLimit = 8;

		PageInfo pi 
		= Pagination.getPageInfo(listCount, 
							 	 currentPage, 
							 	 pageLimit, 
							 	 boardLimit);
		ArrayList<Product> list 
		= productService.selectList(pi);
	
		ArrayList<ProductImg> ilist = new ArrayList<>();
		ArrayList<String> falist = new ArrayList<>();
		
		for(int i = 0 ; i<list.size(); i++) {
		ProductImg pImg = productService.selectProductImg(list.get(i).getProductNo());
		ilist.add(pImg);
		String fa = productService.countFavorite(list.get(i).getProductNo());
		falist.add(fa);
	
		}
		// 노트 종류 별 뽑아오기
		ArrayList<Product> topN = productService.selectTopNoteList();
		ArrayList<Product> midN = productService.selectMiddleNoteList();
		ArrayList<Product> BaseN = productService.selectBaseNoteList();
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("ilist", ilist);
		model.addAttribute("falist", falist);
		
		model.addAttribute("topN", topN);
		model.addAttribute("midN", midN);
		model.addAttribute("BaseN", BaseN);
	
		
		return "product/productListView";
	}
	
	@GetMapping("search.do")
	public String searchDo(String text, @RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = productService.selectListCount();
		int pageLimit = 100;
		int boardLimit = 100;

		PageInfo pi 
		= Pagination.getPageInfo(listCount, 
							 	 currentPage, 
							 	 pageLimit, 
							 	 boardLimit);
		ArrayList<Product> list 
		= productService.searchselectList(pi, text);
	
		ArrayList<ProductImg> ilist = new ArrayList<>();
		ArrayList<String> falist = new ArrayList<>();
		
		for(int i = 0 ; i<list.size() ; i++) {
			ProductImg pmg = productService.selectProductImg(list.get(i).getProductNo());
			
			ilist.add(pmg);
			String fa = productService.countFavorite(list.get(i).getProductNo());
			falist.add(fa);
		}
		
		// 노트 종류 별 뽑아오기
				ArrayList<Product> topN = productService.selectTopNoteList();
				ArrayList<Product> midN = productService.selectMiddleNoteList();
				ArrayList<Product> BaseN = productService.selectBaseNoteList();
				
				model.addAttribute("pi", pi);
				model.addAttribute("list", list);
				model.addAttribute("ilist", ilist);
				model.addAttribute("falist", falist);
				model.addAttribute("topN", topN);
				model.addAttribute("midN", midN);
				model.addAttribute("BaseN", BaseN);

	//  result == 0 이면 삭제된것   1이면 찜 넣기 성공한 것임 

		return "product/productListView";
	}// 메소드종료
	
	@RequestMapping("asclist.po")
	public String productAscList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model){
		
		
		int listCount = productService.selectListCount();
		int pageLimit = 5;
		int boardLimit = 8;

		PageInfo pi 
		= Pagination.getPageInfo(listCount, 
							 	 currentPage, 
							 	 pageLimit, 
							 	 boardLimit);
		ArrayList<Product> list 
		= productService.selectAscList(pi);
	
		ArrayList<ProductImg> ilist = new ArrayList<>();
		ArrayList<String> falist = new ArrayList<>();
		for(int i = 0 ; i<list.size() ; i++) {
			ProductImg pmg = productService.selectProductImg(list.get(i).getProductNo());
			
			ilist.add(pmg);
			String fa = productService.countFavorite(list.get(i).getProductNo());
			falist.add(fa);
		}
		
		
		// 노트 종류 별 뽑아오기
		ArrayList<Product> topN = productService.selectTopNoteList();
		ArrayList<Product> midN = productService.selectMiddleNoteList();
		ArrayList<Product> BaseN = productService.selectBaseNoteList();
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("ilist", ilist);
		model.addAttribute("falist", falist);
		model.addAttribute("topN", topN);
		model.addAttribute("midN", midN);
		model.addAttribute("BaseN", BaseN);
	
		
		return "product/productListView";
	}
	@RequestMapping("desclist.po")
	public String productDescList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model){
		
		
		int listCount = productService.selectListCount();
		int pageLimit = 5;
		int boardLimit = 8;

		PageInfo pi 
		= Pagination.getPageInfo(listCount, 
							 	 currentPage, 
							 	 pageLimit, 
							 	 boardLimit);
		ArrayList<Product> list 
		= productService.selectDescList(pi);
	
		ArrayList<ProductImg> ilist = new ArrayList<>();
		ArrayList<String> falist = new ArrayList<>();
		
		for(int i = 0 ; i<list.size() ; i++) {
			ProductImg pmg = productService.selectProductImg(list.get(i).getProductNo());
			
			ilist.add(pmg);
			String fa = productService.countFavorite(list.get(i).getProductNo());
			falist.add(fa);
		}
		
		
		// 노트 종류 별 뽑아오기
		ArrayList<Product> topN = productService.selectTopNoteList();
		ArrayList<Product> midN = productService.selectMiddleNoteList();
		ArrayList<Product> BaseN = productService.selectBaseNoteList();
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("ilist", ilist);
		model.addAttribute("falist", falist);
		model.addAttribute("topN", topN);
		model.addAttribute("midN", midN);
		model.addAttribute("BaseN", BaseN);
	
		
		return "product/productListView";
	}
	@RequestMapping("poplist.po")
	public String productPopList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model){
		
		
		int listCount = productService.selectListCount();
		int pageLimit = 5;
		int boardLimit = 8;

		PageInfo pi 
		= Pagination.getPageInfo(listCount, 
							 	 currentPage, 
							 	 pageLimit, 
							 	 boardLimit);
		ArrayList<Product> list 
		= productService.selectPopList(pi);
	
		ArrayList<ProductImg> ilist = new ArrayList<>();
		ArrayList<String> falist = new ArrayList<>();
		for(int i = 0 ; i<list.size() ; i++) {
			ProductImg pmg = productService.selectProductImg(list.get(i).getProductNo());
			
			ilist.add(pmg);
			String fa = productService.countFavorite(list.get(i).getProductNo());
			falist.add(fa);
		}
		
		
		// 노트 종류 별 뽑아오기
		ArrayList<Product> topN = productService.selectTopNoteList();
		ArrayList<Product> midN = productService.selectMiddleNoteList();
		ArrayList<Product> BaseN = productService.selectBaseNoteList();
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		model.addAttribute("ilist", ilist);
		model.addAttribute("falist", falist);
		model.addAttribute("topN", topN);
		model.addAttribute("midN", midN);
		model.addAttribute("BaseN", BaseN);
	
		
		return "product/productListView";
	}
	
	
	
	@GetMapping("detail.po")
	public ModelAndView productDetail(int pno, ModelAndView mv, HttpSession session) {
		
		Product p = productService.selectProduct(pno);
		ArrayList<ProductImg> pilist = productService.selectProductImgList(pno);
		ProductImg pi = productService.selectProductImg(pno);
		
		
				
		if(session.getAttribute("loginMember") != null ) {
			int  memNo = ((Member)session.getAttribute("loginMember")).getMemNo();
			Favorites fa = productService.selectFavorites(memNo, pno);
			mv.addObject("memNo", memNo);
			mv.addObject("fa", fa);
		}

		// 이 상품에 대한 리뷰를 전부 가져옴
		
		
		ArrayList<ProductReview> prlist = productService.selectProductReviewList(pno);
		ArrayList<Member> mlist = new ArrayList<>();
		
		for(int i =0; i<prlist.size(); i++) {
			Member m = productService.selectMember(prlist.get(i).getMemNo());
		mlist.add(m);
		}
		
		
		mv.addObject("prlist", prlist);
		mv.addObject("mlist", mlist);
		
		mv.addObject("pi", pi);
		mv.addObject("pilist", pilist);
		mv.addObject("p", p)
		  .setViewName("product/productDetailView");
		
		
		
	
		return mv;
		
	}
	
	
	
	
	@PostMapping("order.po")
	public  ModelAndView productOrder(int pno, ModelAndView mv, HttpServletRequest request,HttpSession session, HttpServletResponse response) {
		
		int pCount = Integer.parseInt(request.getParameter("result1"));
	
		Product p = productService.selectProduct(pno);
		ProductImg pi = productService.selectProductImg(pno);
		
		int memNo = ((Member)session.getAttribute("loginMember")) .getMemNo();
		
		Member m = productService.selectMember(memNo);
		
		mv.addObject("m", m);
		mv.addObject("memNo", memNo);
		mv.addObject("p", p);
		mv.addObject("pi", pi);
		mv.addObject("pCount", pCount).setViewName("product/productOrderView");
		
		return mv;	
	}
	
	@ResponseBody
	@RequestMapping(value="ajax1.do", produces="application/json; charset=UTF-8")
	public String ajaxMethod1(int mno) {
		
		System.out.println(mno);
		
		ArrayList<MemCoupon> list =  productService.searchCoupon(mno);
		ArrayList<Coupon> clist = new ArrayList<>();
		
		// 쓸 수 있는 쿠폰만 긁어온다 .
		// 쿠폰이름 가지러 간다. 
		if(list == null) {
			
		}else {
		
		for(int i =0 ; i<list.size(); i++) {
			Coupon c = productService.searchCouponName(list.get(i).getCouponNo());
			clist.add(c);
			System.out.println(c);
	
		}
	
		}// else 종료
		
		return new Gson().toJson(clist); //
	}
	
	@GetMapping("complete.po")
	@ResponseBody
	public int complete2(String merchant_uid, int amount, String imp_uid, String want5, int mno, int pno, int pcount, int adno, String address, String phone, Model model, int cno)  throws Exception{
		
		
		int result =  productService.orderComplete(merchant_uid, amount, want5, mno, adno, address, phone);
	
		if(cno < 3) {
		
			MemCoupon mc = new MemCoupon(mno, cno); // 사용한 쿠폰번호, 회원번호로 객체 생성
			
			int cResult = productService.couponDelete(mc); // 사용한 쿠폰 삭제  Y > N 변경	
		} 
		
		if(result >0) { 	//주문테이블 삽입 성공
			
			OrderDetail od = productService.orderview(merchant_uid);
			Product p = productService.selectProduct(pno);
			
			result = od.getOrderNo();
			int account = ((p.getProductPrice()*(100-p.getDiscount()))/100); 
			int ono = od.getOrderNo();
			int result2 = productService.insertOrderProduct(pcount, account, ono, pno);
			
			if(result2 > 0) { // 주문상품(오더지) 삽입성공 >> 구매수량 만큼 재고 수량 빼기
				int newQuantity = p.getProductStock() - pcount;
				int result3 =  productService.minusQuantity(newQuantity, pno);
				if(result3>0) {// 구매수량 만큼 재고수량 빼기 성공
					
				}else { // 재고량이 구매수량보다 작아서 빼기 실패한 경우
					String errorMsg = "주문실패(재고수량 부족)";
					model.addAttribute("errorMsg", errorMsg);
				}
				
			}
			
			
			model.addAttribute("od", od);
	
		}else {// 주문 실패 
			String errorMsg = "주문실패";
			model.addAttribute("errorMsg", errorMsg);
		}
		
		return result;
	}
	
	
	@GetMapping("BasketAdd.ba")
	public String cartAdd( Model model, int productNo, int quantity, int mno) {
		int pno = productNo;
		Product p = productService.selectProduct(pno);
	
		int account = ((p.getProductPrice()*(100-p.getDiscount())*quantity)/100); 

		int result = productService.cartAdd(account, quantity, mno, pno);
	
		if(result >0) {
			model.addAttribute("mno", mno);
			
			return "product/cartFormRedirect";
				
	
		}else {
			String errorMsg = "카트 추가 실패";
			model.addAttribute("errorMsg", errorMsg);
			return "common/errorPage";
		}
	
	}
	
	
	
	@PostMapping("CartForm")
	public String cartForm( Model model, int mno, HttpSession session) {
		ArrayList<Cart> clist = productService.selectCartList(mno);
		ArrayList<ProductImg> pilist = new ArrayList<>(); 
		ArrayList<Product> plist = new ArrayList<>(); 
		
		for(int i =0; i<clist.size(); i++) {
			ProductImg pi = productService.selectProductImg(clist.get(i).getProductNo());
			Product pp = productService.selectProduct(clist.get(i).getProductNo());
			
			plist.add(pp);
			pilist.add(pi);
			}
			int memNo = ((Member)session.getAttribute("loginMember")).getMemNo();
			
			model.addAttribute("memNo", memNo);
			model.addAttribute("plist", plist);
			model.addAttribute("pilist", pilist);
			model.addAttribute("clist", clist);
		
			return "product/cartForm";
	}
	
	@PostMapping("BasketDelete.ba")
	@ResponseBody
	public int cartdelete(String selectedItems) {

		String[] array = selectedItems.split(",");
		int result= 0;
		
		for(int i = 0; i < array.length; i++ ) {
			int deletecartNo = Integer.parseInt(array[i]);
			result = productService.cartdelete(deletecartNo);	
		}	
		
		return result;
	}
	
	@ResponseBody
	@GetMapping("BasketEdit.ba")
	public void cartUpdate(int basketNo, int quantity) {
	
	Cart c = productService.cartSelect(basketNo);
	Product p = productService.selectProduct(c.getProductNo());
	
	int price = (p.getProductPrice() * (100-p.getDiscount()) /100) * quantity;
		
	int result = productService.cartUpdate(basketNo, quantity, price);
		
	}
	
	@ResponseBody
	@PostMapping("basketOrder.ba")
	public ModelAndView basketOrder(ModelAndView mv, HttpSession session){
			
		int memNo = ((Member)session.getAttribute("loginMember")).getMemNo();
		
		ArrayList<Cart> clist = productService.selectCartList(memNo);
		
		ArrayList<Product> plist = new ArrayList<>();
		ArrayList<ProductImg> pilist = new ArrayList<>();
		
		for(int i = 0 ; i<clist.size() ; i++ ) {
			
			Product p =  productService.selectProduct(clist.get(i).getProductNo());
			ProductImg pi = productService.selectProductImg(clist.get(i).getProductNo());
		
			plist.add(p);
			pilist.add(pi);
			
			System.out.println("장바구니나오는지확인"+clist.get(i));
			System.out.println(plist.get(i));
		}
		
		Member m = productService.selectMember(memNo);
		
		System.out.println("장바구니 확인용"+m );
		
		mv.addObject("m", m);
		mv.addObject("clist", clist);
		mv.addObject("plist", plist);
		mv.addObject("pilist", pilist);
		mv.addObject("memNo", memNo).setViewName("product/cartOrderView");
		
		return mv;
		
		
	}

	@GetMapping("completeCart.po")
	@ResponseBody
	public int complete3( String merchant_uid, int amount, String imp_uid, String want5, int mno, String pno, String pcount, int adno, String address, String phone, Model model, int cno)  throws Exception{		
		 pcount = pcount.replaceAll("\\[", "");
		 pcount = pcount.replaceAll("\\]", "");
		
		 pno = pno.replaceAll("\\[", "");
		 pno = pno.replaceAll("\\]", "");
		
		String[] array = pcount.split(",");
		String[] array1 = pno.split(",");
		
		if(cno < 3) {
		
			MemCoupon mc = new MemCoupon(mno, cno); // 사용한 쿠폰번호, 회원번호로 객체 생성
			
			int cResult = productService.couponDelete(mc); // 사용한 쿠폰 삭제  Y > N 변경
		}
		
		int result1 =  productService.orderComplete(merchant_uid, amount, want5, mno, adno, address, phone); // 일단 기본 주문테이블 넣기
	if(result1 > 0) { //  기본 주문 테이블에 데이터 삽입 성공 시 
		OrderDetail od = productService.orderview(merchant_uid);
		result1 = od.getOrderNo();
		for(int i = 0; i < array.length; i++ ) {
			int pcount1 = Integer.parseInt(array[i]);
			int pno1 = Integer.parseInt(array1[i]);
			Product p = productService.selectProduct(pno1);
			int account = ((p.getProductPrice()*(100-p.getDiscount()))/100); 
			int ono = od.getOrderNo();
			int result2 = productService.insertOrderProduct(pcount1, account, ono, pno1);
			if(result2 > 0) { // 주문상품(오더지) 삽입성공 >> 구매수량 만큼 재고 수량 빼기
				int newQuantity = p.getProductStock() - pcount1;
				int result3 =  productService.minusQuantity(newQuantity, pno1);
				if(result3>0) {// 구매수량 만큼 재고수량 빼기 성공
					
				}else { // 재고량이 구매수량보다 작아서 빼기 실패한 경우
					String errorMsg = "주문실패(재고수량 부족)";
					model.addAttribute("errorMsg", errorMsg);
				}//else종료
				
			}//if문종료 ( 주문완료시 재고수량 뺴는  조건문 )
			
			
		}//for문 종료    오더지를   장바구니 담은 상품 수 만큼 넣기	
		int result5 = productService.completeCart(mno); // 카트에 있는 것을 구매 완료 했으니 카트를 비우자
	
	}
	 
		return result1;
	}


	@GetMapping("orderComp.or")
	public String orderComp(Model model, int ono){
		model.addAttribute("ono", ono);
		
		return "product/orderCompleteRedirect";
		
	}
	
	
	@ResponseBody
	@PostMapping("orderComplete")
	public ModelAndView orderComplete(ModelAndView mv, int ono){
	

		
		OrderDetail od = productService.selectOrder(ono);
		ArrayList<OrderProduct> oplist = productService.selectOrderProduct(ono);
		ArrayList<Product> plist = new ArrayList<>();
		
		for(int i = 0; i<oplist.size(); i++) {
			Product p = productService.selectProduct(oplist.get(i).getProductNo());
			
			plist.add(p);
		}
		mv.addObject("od", od);
		mv.addObject("oplist", oplist);
		mv.addObject("plist", plist).setViewName("product/orderComplete");

		
		return mv;
	}
	
	@PostMapping("insert.po")
	public ModelAndView insertProduct(String productName, String productDetail, int productPrice, int productQuantity, String gender, int discount, String category, String topNote, String middleNote, String baseNote,
									MultipartFile upfile, MultipartFile upfile2, MultipartFile upfile3,
									HttpSession session,
									ModelAndView mv) {
		
		
		if(!upfile.getOriginalFilename().equals("")) {
	
			String changeName = savePath(upfile, session);
			String changeName2 = savePath(upfile2, session);
			String changeName3 = savePath(upfile3, session);
		
			ProductImg pi = new ProductImg();
			pi.setProductImgOrigin(upfile.getOriginalFilename());
			pi.setProductImgPath("resources/uploadFiles/" + changeName);
			pi.setProductImgChange(changeName);
			
			ProductImg pi2 = new ProductImg();
			pi2.setProductImgOrigin(upfile.getOriginalFilename());
			pi2.setProductImgPath("resources/uploadFiles/" + changeName2);
			pi2.setProductImgChange(changeName2);
			
			ProductImg pi3 = new ProductImg();
			pi3.setProductImgOrigin(upfile.getOriginalFilename());
			pi3.setProductImgPath("resources/uploadFiles/" + changeName3);
			pi3.setProductImgChange(changeName3);

			
			String productExplain = productDetail; int productStock = productQuantity; 
			Product p = new Product(productName, productExplain, productPrice,  productStock, discount, category, gender, topNote, middleNote, baseNote);	
		
			int result1 = productService.insertProduct(p);

			if(result1>0) {// 상품테이블에 상품 넣기 성공 
				
				Product p1 = productService.selectProductNo(productName);
				
				System.out.println(pi.getProductImgPath());
				
			pi.setProductNo(p1.getProductNo());
			pi2.setProductNo(p1.getProductNo());
			pi3.setProductNo(p1.getProductNo());
			
					int result5 = productService.insertProductImg(pi); // 해당 상품의 썸네일 이미지 넣기
					int result6 = productService.insertProductImg2(pi2); // 해당 상품의 썸네일 아닌 이미지 넣기
					int result7 = productService.insertProductImg2(pi3); // 해당 상품의 썸네일 아닌 이미지 넣기
			
					if((result5 + result6 + result7) >2) { // 성공
						session.setAttribute("alertMsg", "성공적으로 상품이 등록되었습니다.");
						mv.setViewName("product/productListView");
					}else {//실패
						mv.addObject("errorMsg", "게시글 등록 실패")
						  .setViewName("common/errorPage");
					}
					
			}// 상품테이블에 넣는 if문 종료
		}// 업로드파일이 null이 아닌 if문 종료


		return mv;
	
	}

	
	@GetMapping("insertProductForm.po")
	public String insertProductForm() {
	return "product/insertProductForm";
	}
	
	@GetMapping("insertReview.po")
	public String insertReviewForm(int odId, int pno, int mno, int ono, Model model) {
		Product p = productService.selectProduct(pno);
		OrderDetail od = productService.selectOrder(ono);		
		
		
		model.addAttribute("p", p);
		model.addAttribute("odId", odId);
		model.addAttribute("mno", mno);
		model.addAttribute("od", od);
		
		
		
	return "product/insertReview";
	}
	
	
	@GetMapping("myOrderList.po")
	public ModelAndView myProductList( ModelAndView mv, int memNo) {
		
		int mno = memNo;
		
		ArrayList<OrderDetail> odlist = productService.selectOrderDetail(mno);
		
		
		ArrayList<OrderProduct> oplist = new ArrayList<>();
		ArrayList<OrderProduct> oplist2 = new ArrayList<>();
		ArrayList<Product> plist = new ArrayList<>();
		ArrayList<Integer> relist = new ArrayList<>();
		for(int i =0; i<odlist.size(); i++) {
			if(i == 0) {
			 oplist = productService.selectOrderProduct1(odlist.get(i).getOrderNo());
			}else {
				oplist2 = productService.selectOrderProduct1(odlist.get(i).getOrderNo());
				oplist.addAll(oplist2);
			}
			
		}// 반복문 종료
		for(int i = 0; i<oplist.size(); i++) {
			Product p = productService.selectProduct(oplist.get(i).getProductNo());
		plist.add(p);
		int re = productService.selectReview(oplist.get(i).getOdId());
		relist.add(re);
		}
		mv.addObject("relist", relist);
		mv.addObject("odlist", odlist);
		mv.addObject("oplist", oplist);
		mv.addObject("plist", plist).setViewName("member/myOrderList");

		

		return mv;
		
	}
	
	@PostMapping("insertProductReview.po")
	public ModelAndView insertProductReview(ModelAndView mv, int rating, String review, int pno, int mno, int odId, MultipartFile upfile, HttpSession session) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = savePath(upfile, session);
		
			ProductReview pr = new ProductReview(); 
			pr.setReviewImgOrigin(upfile.getOriginalFilename());
			pr.setReviewImgPath("resources/uploadFiles/" + changeName);
			pr.setReviewContent(review);
			pr.setReviewRating(rating);
			pr.setMemNo(mno);
			pr.setProductNo(pno);
			pr.setOdId(odId);
			
			int result = productService.insertProductReview(pr);
			
			if(result >0){ // 리뷰 작성 성공
			mv.addObject("alertMsg", "게시글 등록 성공")
				  .setViewName("redirect:/myPage.me");
			}else {// 리뷰 작성 실패
				mv.addObject("alertMsg", "게시글 등록 실패")
				  .setViewName("redirect:/myPage.me");
			}
			
		}
	
		return mv;
	}	
	@ResponseBody
	@GetMapping("favorite.fa")
	public Integer favoriteEdit(Integer mno, Integer pno) {
		
	
	Favorites fa =  productService.selectFavorites(mno, pno);	
		int result = 0;
	
	if(fa == null) { // 찜이 안되어 있을 경우 
		result = productService.favoriteAdd(mno, pno);  // 찜 넣기 
		
		if(result >0) {  // 찜 넣기 성공 
		
		}
	}else {// 이미 찜 한 경우 
		result =  productService.favoriteDel(mno, pno);
		if(result >0) {// 삭제 성공
			result = 0;
		}
	}
	//  result == 0 이면 삭제된것   1이면 찜 넣기 성공한 것임 

	return result;		
	}// 메소드종료

	
	@GetMapping("saleproductList.po")
	public String saleProductList(Model model) {
		ArrayList<Product> list = productService.saleProductList();
		model.addAttribute("list", list);
		

	return "product/productView";		
	}// 메소드종료
	
	@GetMapping("updateProduct.po")
	public String updateProduct(int pno, Model model) {
		
		Product p =  productService.selectProduct(pno);
		ArrayList<ProductImg> pllist =  productService.selectProductImgList(pno); 
		
		model.addAttribute("p", p);
		model.addAttribute("pllist", pllist);

	return "product/updateProductForm";		
	}// 메소드종료
	
	@PostMapping("updatepro.po")
	public ModelAndView updatepro(Product p, int pno, MultipartFile upfile, MultipartFile upfile2, MultipartFile upfile3, HttpSession session, ModelAndView mv) {
		
		p.setProductNo(pno); // 상품번호 상품객체에 넣기
		
		if(!upfile.getOriginalFilename().equals("")) {
	
			String changeName = savePath(upfile, session);
			String changeName2 = savePath(upfile2, session);
			String changeName3 = savePath(upfile3, session);
		
			ProductImg pi = new ProductImg();
			pi.setProductImgOrigin(upfile.getOriginalFilename());
			pi.setProductImgPath("resources/uploadFiles/" + changeName);
			pi.setProductNo(pno);
			
			ArrayList<ProductImg> pilist = productService.selectProductImgList(pno);
			
			
			ProductImg pi2 = new ProductImg();
			pi2.setProductImgOrigin(upfile.getOriginalFilename());
			pi2.setProductImgPath("resources/uploadFiles/" + changeName2);
			pi2.setProductNo(pno);
		
			
			ProductImg pi3 = new ProductImg();
			pi3.setProductImgOrigin(upfile.getOriginalFilename());
			pi3.setProductImgPath("resources/uploadFiles/" + changeName3);
			pi3.setProductNo(pno);
			
			
			for(int i = 0; i<pilist.size(); i++) {
				if(i == 0) {
					pi2.setProductImgNo(pilist.get(i).getProductImgNo());
				}else {
					pi3.setProductImgNo(pilist.get(i).getProductImgNo());
				}
			}

			int result =  productService.updatepro(p);
			if(result > 0) { // 상품 테이블에 넣기 성공
		
				
			}
			int result5 = productService.updateProductImg(pi); // 해당 상품의 썸네일 이미지 넣기			
			int result6 = productService.updateProductImg2(pi2); // 해당 상품의 썸네일 아닌 이미지 넣기
			int result7 = productService.updateProductImg2(pi3); // 해당 상품의 썸네일 아닌 이미지 넣기
	
			if((result5 + result6 + result7) >2) { // 성공
				session.setAttribute("alertMsg", "성공적으로 상품이 등록되었습니다.");
				mv.setViewName("list.po");
			}else {//실패
				mv.addObject("errorMsg", "게시글 등록 실패")
				  .setViewName("common/errorPage");
			}		
	}
		return mv;
	}
	

	@GetMapping("productDelivery.po")
	public ModelAndView productDelivery( ModelAndView mv) {
		
		int mno =1;
		
		ArrayList<OrderDetail> odlist = productService.selectOrderDetail(mno);
		
		
		ArrayList<OrderProduct> oplist = new ArrayList<>();
		ArrayList<OrderProduct> oplist2 = new ArrayList<>();
		ArrayList<Product> plist = new ArrayList<>();
		
		for(int i =0; i<odlist.size(); i++) {
			if(i == 0) {
			 oplist = productService.selectOrderProduct1(odlist.get(i).getOrderNo());
			}else {
				oplist2 = productService.selectOrderProduct1(odlist.get(i).getOrderNo());
				oplist.addAll(oplist2);
			}
			
		}// 반복문 종료
		for(int i = 0; i<oplist.size(); i++) {
			Product p = productService.selectProduct(oplist.get(i).getProductNo());
		plist.add(p);
		}
		mv.addObject("odlist", odlist);
		mv.addObject("oplist", oplist);
		mv.addObject("plist", plist).setViewName("product/productDelivery");

		

		return mv;
		
	}
	
	@GetMapping("orderdelivery.po")
	public ModelAndView orderDelivery(ModelAndView mv, int mno, int odId, int pno, int ono) {
		int result = productService.orderDelivery(ono);
		
		ArrayList<OrderDetail> odlist = productService.selectOrderDetail(mno);
		
		
		ArrayList<OrderProduct> oplist = new ArrayList<>();
		ArrayList<OrderProduct> oplist2 = new ArrayList<>();
		ArrayList<Product> plist = new ArrayList<>();
		
		for(int i =0; i<odlist.size(); i++) {
			if(i == 0) {
			 oplist = productService.selectOrderProduct1(odlist.get(i).getOrderNo());
			}else {
				oplist2 = productService.selectOrderProduct1(odlist.get(i).getOrderNo());
				oplist.addAll(oplist2);
			}
			
		}// 반복문 종료
		for(int i = 0; i<oplist.size(); i++) {
			Product p = productService.selectProduct(oplist.get(i).getProductNo());
		plist.add(p);
		}
		mv.addObject("odlist", odlist);
		mv.addObject("oplist", oplist);
		mv.addObject("plist", plist).setViewName("product/productDelivery");

		
		
		return mv;
		
	}
	
	// 메인페이지 썸네일 12개 출력용 - 2024-06-21 윤민호
	@GetMapping("getProductThumbnail")
	@ResponseBody
	public ArrayList<ProductImg> getProductThumbnail(Model model) {
		
		ArrayList<ProductImg> list = productService.getProductThumbnail();
		
		return list;
	}

	@PostMapping("wantRefund.po")
	public String wantRefund(int odId , Model model, int memNo) {
		
		int result = productService.wantRefund(odId);
		
		/* myProductList(mv, memNo); */
		
		
		
		return "redirect:/myOrder.me?memNo="+memNo;
	
	}

	@PostMapping("doRefund.po")
	public ModelAndView doRefund(int odId , ModelAndView mv) {
		
		int result = productService.doRefund(odId);
		
		productDelivery(mv);
		
		return mv;
	
	}
	
	@GetMapping("myFavorite.li")
	public ModelAndView myFavoriteList( ModelAndView mv, HttpSession session) {
		
		int mno = ((Member)session.getAttribute("loginMember")).getMemNo();
		
		ArrayList<Favorites> flist  =  productService.myFavoriteList(mno);
		
		ArrayList<ProductImg> pilist = new ArrayList<>();
		ArrayList<Product> plist = new ArrayList<>();
		ArrayList<Favorites> falist = new ArrayList<>();
		
		for(int i =0 ; i<flist.size() ; i++) {
			
			ProductImg pi = productService.selectProductImg(flist.get(i).getProductNo());
		pilist.add(pi);
		
		Product p = productService.selectProduct(flist.get(i).getProductNo());
		plist.add(p);
		
		
		
	
		}
		
	
		
		
		mv.addObject("plist", plist);
		mv.addObject("pilist", pilist);
		mv.addObject("falist", falist);
		mv.addObject("flist", flist).setViewName("product/myFavorite");

		return mv;
	}
	
	@GetMapping("searchNote.no")
	public ModelAndView searchNote(String notes, @RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
	
		
		int listCount = productService.selectListCount();
		int pageLimit = 5;
		int boardLimit = 8;

		PageInfo pi 
		= Pagination.getPageInfo(listCount, 
							 	 currentPage, 
							 	 pageLimit, 
							 	 boardLimit);
		String[] array = notes.split(",");
		
	
		Set<String> productNoSet = new HashSet<>();
		 Set<Product> resultSet = new HashSet<>();
	
	        
	        // 나머지 검색 결과를 순회하며 Set에 추가합니다.
	        for (int i = 0; i < array.length; i++) {
	            ArrayList<Product> list2 = productService.searchselectList(pi, array[i]);
	            
	            for(Product p : list2) {
	            	
	            	int isExist = 1;
	            
	            	for(Product p2 : resultSet) {
	            		
	            		if(p.getProductNo() == p2.getProductNo()) {
	            			isExist *= 0;
	            		} else {
	            			isExist *= 1;
	            		}
	            		
	            	}
	            	
	            	if(isExist == 0) { // 이미 존재?
	            		
	            	} else { // 이미 존재 X?
	            		
	            		resultSet.add(p);
	            		productNoSet.add(String.valueOf(p.getProductNo()));
	            	}
	            	
	            
//	            	for (Product product : list2) {
//		            	  productNoSet.add(String.valueOf(product.getProductNo()));
//		            }
	            	
	            	
	            }
	          
	            //resultSet.addAll(list2);

	            
	        
	        }
	        
	        // 최종 결과를 ArrayList로 변환합니다.
	        ArrayList<Product> list = new ArrayList<>(resultSet);
		 
	        mv.addObject("productNoSet", productNoSet);
	        

			ArrayList<ProductImg> ilist = new ArrayList<>();
			ArrayList<String> falist = new ArrayList<>();
		for(int i = 0 ; i<list.size() ; i++) {
			ProductImg pmg = productService.selectProductImg(list.get(i).getProductNo());
		
			ilist.add(pmg);
			String fa = productService.countFavorite(list.get(i).getProductNo());
			falist.add(fa);
		}
	    
		
		// 노트 종류 별 뽑아오기
				ArrayList<Product> topN = productService.selectTopNoteList();
				ArrayList<Product> midN = productService.selectMiddleNoteList();
				ArrayList<Product> BaseN = productService.selectBaseNoteList();
				
				mv.addObject("pi", pi);
				mv.addObject("list", list);
				mv.addObject("ilist", ilist);
				mv.addObject("falist", falist);
				mv.addObject("topN", topN);
				mv.addObject("midN", midN);
				mv.addObject("BaseN", BaseN).setViewName("product/test");

	//  result == 0 이면 삭제된것   1이면 찜 넣기 성공한 것임 

		return mv;
	
	
	}
	@GetMapping("myCoupon.li")
	public ModelAndView myCoupon(ModelAndView mv, HttpSession session) {
		
		int mno = ((Member)session.getAttribute("loginMember")).getMemNo();
		
		ArrayList<MemCoupon> clist = productService.myCoupon(mno);
		
		ArrayList<Coupon> cclist = new ArrayList<>();
		
		for(int i = 0 ; i<clist.size() ; i++) {
			Coupon c = productService.CouponName(clist.get(i).getCouponNo());
			cclist.add(c);
			
		}
		
		mv.addObject("cclist", cclist);
		mv.addObject("clist", clist).setViewName("product/myCouponList");
		
		return mv;
	
	}
	
	@GetMapping("myReview.re")
	public ModelAndView myReview(ModelAndView mv, HttpSession session) {
		
		int mno = ((Member)session.getAttribute("loginMember")).getMemNo();
		
		ArrayList<ProductReview> relist = productService.myReview(mno);
	
	
		
		mv.addObject("relist", relist).setViewName("product/myReviewList");
		
		return mv;
	
	}
	
	
	@PostMapping("delFavorite.me")
	public String deleteFavorite(Favorites f, Model model, HttpSession session) {
		
		int result = productService.deleteFavorite(f);
		
		if(result > 0) { // 삭제됨
			session.setAttribute("alertMsg", "상품이 제거되었습니다.");
		} else {
			session.setAttribute("alertMsg", "상품 제거에 실패했습니다.");
		}
		
		
		
		return "redirect:/myPage.me";
	}
	
	
}// 클래스종료
