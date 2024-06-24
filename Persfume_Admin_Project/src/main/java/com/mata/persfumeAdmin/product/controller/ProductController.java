package com.mata.persfumeAdmin.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mata.persfumeAdmin.product.model.service.ProductService;
import com.mata.persfumeAdmin.product.model.vo.Product;
import com.mata.persfumeAdmin.product.model.vo.ProductImg;
import com.mata.persfumeAdmin.product.model.vo.ProductReview;

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
	
	@GetMapping("proEnroll.pr")
	public String productEnrollForm() {
		
		return "Product/ProductEnrollForm";
	}
	
	@PostMapping("insert.po")
	public String productEnroll(Product p,
							MultipartFile thumbnailPr,
							MultipartFile[] upFilePr,
							HttpSession session,
							ModelAndView mv) {
		
		int result = productService.insertProduct(p);
		
		System.out.println("상품추가 잘 호줄되나?");
		
		
		if(result > 0) {
			
			String changeNamePrTh = savePath(thumbnailPr, session); // 수정파일명 얻기
			
			ProductImg pi1 = new ProductImg();
			
			pi1.setProductImgChange(changeNamePrTh);
			pi1.setImgType(1);
			pi1.setProductImgOrigin(thumbnailPr.getOriginalFilename()); // 업로드된 파일의 원본명 얻어서 객체에 넣기
			pi1.setProductImgPath("resources/uploadFiles/product/" + changeNamePrTh); // 저장경로 만들어서 객체에 넣기
			
			// 이 시점에는 pi1 객체에 썸네일이미지의 정보가 담겨있음
			
			int result1 = productService.insertProductImg(pi1);
			
//			파일 배열을 다루기
			
			// 업로드된 파일들을 반복문을 통해 저장하고, ProductImg 객체 설정
            for (MultipartFile file : upFilePr) {
                if (!file.isEmpty()) { // 파일이 비어있지 않다면!
                    String changeNamePr = savePath(file, session); // 파일 저장 및 이름 변경
        
                    ProductImg pi2 = new ProductImg();
                    
                    pi2.setProductImgChange(changeNamePr);
                    pi2.setImgType(2); // 예시로 2로 설정, 실제로는 파일 타입에 따라 다를 수 있음
                    pi2.setProductImgOrigin(file.getOriginalFilename()); // 원본 파일 이름 설정
                    pi2.setProductImgPath("resources/uploadFiles/product/" + changeNamePr); // 저장 경로 설정
                    
                    // 이 시점에서는 pi2 객체에 이미지 파일'들'의 정보가 담겨있음
                    
                    int result2 = productService.insertProductImg(pi2);
                    
                    if(result2 > 0) {
                    	System.out.println("상품 이미지 넣기 성공!");
                    	
                    }else {
                    	System.out.println("상품 이미지 넣기 실패!");
                    }
                }
            }
            
            if(result1 > 0) {
            	System.out.println("썸네일 넣기 성공!");
            	
				session.setAttribute("alertMsg", "상품이 등록되었습니다.");
				
				mv.setViewName("redirect:/proList.pr?condition=onGoing");
            	
            }else {
            	System.out.println("썸네일 넣기 실패!");
            }
			
            
		} else {
			System.out.println("상품 추가 실패 ㅠㅠ");
			
			mv.addObject("errorMsg", "상품 등록에 실패하였습니다. 다시 시도해주세요").setViewName("common/errorPage");
		}
		
		return "redirect:/proList.pr";
	}
	

	@GetMapping("update.pr")
	public String productUpdateForm(int productNo,
							HttpSession session,
							Model model) {
		
		System.out.println("상품 수정 폼  잘 호출되나?");
		
		ArrayList<Product> list = productService.selectProduct(productNo);
		
		ArrayList<ProductImg> pilist = productService.selectProductpi(productNo);
		
		// 상품 수정하기 페이지용 - 한개의 제품만 보여져야함
		// Product p = productService.selectProduct(productNo);
		// model.addAttribute("p", p);
		// 
		
		System.out.println(list);
		
		System.out.println(pilist);
		
		model.addAttribute("list", list); // Model에 list를  attribute로 설정
		
		model.addAttribute("list2", pilist);
		
		return "Product/ProductUpdateForm";
		
	}
	
	@PostMapping("updatePr.pr")
	public String productUpdate(Product p,
						String[] classImgPath,
						String prevThumb,
						MultipartFile upThumbnail, 
						MultipartFile[] upFiles, 
						HttpSession session) {
//		System.out.println("classImgPath 가 뭐야??" + classImgPath[0]);
//		System.out.println("삼풍 수정하기 잘 호출 되나??");
//		
//		System.out.println("상품 수정하기 에서 p : " + p);
//		
//		System.out.println("상품 수정하기 에서 upTh :  " + upThumbnail);
//		// 썸네일 정보
//		
//		System.out.println("상품 수정하기에서 upfiles" + upFiles[0]);
		// 그냥 첨부파일 정보
		
		// 상품 정보 수정
		int result1 = productService.productUpdate(p);
		
		
		if(result1 > 0) {
			System.out.println("상품 수정 성공 ");
			
			if(upThumbnail.getSize() > 0) {
			// 사진이 있다면
			// 이 때 부터 사진 정보 수정하기
	        String upThumbnailchangeName = savePath(upThumbnail, session); // 썸네일 수정파일명 얻기

	        System.out.println("1번이미지" + upThumbnailchangeName);
	        System.out.println(p.getProductNo());
	        
	        int result2 = 0;
			
			ProductImg pi1 = new ProductImg();
			// 썸네일 이미지 
			pi1.setProductImgChange(upThumbnailchangeName);
			pi1.setImgType(1);
			pi1.setProductImgOrigin(upThumbnail.getOriginalFilename()); // 업로드된 파일의 원본명 얻어서 객체에 넣기
			pi1.setProductImgPath("resources/uploadFiles/product/" + upThumbnailchangeName); // 저장경로 만들어서 객체에 넣기
			pi1.setProductNo(p.getProductNo());
            pi1.setPrevImgPath(prevThumb);
			
			System.out.println();
			System.out.println(pi1);
			System.out.println();
			
			result2 = productService.productImgUpdate(pi1);
			
			System.out.println("result2 " + result2);
			
		    }else{
				System.out.println("썸네일 수정 X");// 여기까지가 썸네일 수정
			}

			
			// 여기서부터 본문사진들 수정
	
			// 이미지'들'
			// 업로드된 파일들을 반복문을 통해 저장하고, ProductImg 객체 설정
				if(upFiles != null) {
					// upFiles null 이 아니면  수정작업 시작하기
					for (int i = 0; i < upFiles.length; i++) {
						
						System.out.println("반복 1");
						
						
						
		                if (!upFiles[i].isEmpty()) { // 파일이 비어있지 않다면!
		                    String upFileschangeName = savePath(upFiles[i], session); // 파일 저장 및 이름 변경
		            		
//		            		System.out.println("2번 이미지" + upFileschangeName);
		                    
		                    ProductImg pi2 = new ProductImg();
		                    
		                    pi2.setProductImgChange(upFileschangeName);
		                    pi2.setImgType(2);
		                    pi2.setProductImgOrigin(upFiles[i].getOriginalFilename()); // 원본 파일 이름 설정
		                    pi2.setProductImgPath("resources/uploadFiles/product/" + upFileschangeName); // 저장 경로 설정
		                    pi2.setProductNo(p.getProductNo());
		                    pi2.setPrevImgPath(classImgPath[i]);
		                    
		                    
		                    
		                    // 이 시점에서는 pi2 객체에 이미지 파일'들'의 정보가 담겨있음
		                    
		                    // 서비스단으로 pi2 넘기면서 결과값 보기
		                    int result3 = productService.productImgUpdate(pi2);
		              
//		                    System.out.println("result3!!" + result3);
//		                    
//		                    System.out.println(pi2);
		                    
		                }else {
		                	System.out.println("이미지 수정작업 실패");
		                }
		            }
					
					  return "redirect:/proList.pr";
					  
				}else {
					
					}
					
					System.out.println("upFiles 가 비었으면");
					
					 return "redirect:/proList.pr";
				}
		
		
		
		
		
		
		
		
	           
		// 여기까지가 상품텍스트정보 수정 if 문 
		 return "redirect:/proList.pr";
	}
	
	
	@PostMapping("imgdelte.pr")
	public int imgdelte(String delimgPath) {
		
		System.out.println("사진 삭제 잘 호출되나?");
		
		System.out.println("이미지 파일 경로 잘 가져오나??" + delimgPath);
		
		int result = productService.productImgdele3(delimgPath);
		
		return result;
		
	}
	
	
	@PostMapping("delete.pr")
	public String deleteProduct(int productNo) {
		
		System.out.println("상품 삭제하기 잘 호출되나?");
		
		System.out.println("상품 삭제하기 서블릿에서 상품번호 : " + productNo);
		
		int result = productService.deleteProduct(productNo);
		
		if(result > 0) {
			// 삭제 성공
			
			System.out.println("삭제성공");
		}else {
			// 삭제 실패
			System.out.println("삭제 실패");
		}
		
		 return "redirect:/proList.pr";
	
	}
	
	
	
	
	// ------- 상품 리뷰 ----------
	@GetMapping("reviewList.re")
	public String reviewList(Model model) {
		
		
		ArrayList<ProductReview> list =  productService.selectAllreview();
		
		System.out.println(list);
		
		model.addAttribute("list", list); // Model에 list를  attribute로 설정
		
		return "Product/reviewListView";
	}
	
	@PostMapping(value = "delete.re")
	public String reviewDelete(int reviewNo,
							ModelAndView mv,
							HttpSession session) {
		
		
		System.out.println("리뷰 삭제 controller 에서 리뷰번호 잘 가져오나 ? " + reviewNo);
		
		int result = productService.reviewDelete(reviewNo);
		
	
		
		if(result > 0) {
			// 삭제 성공 
			System.out.println("삭제 성공");
			
			return  "redirect:/reviewList.re";
			
		}else {
			
			System.out.println("삭제 실패");
			
			session.setAttribute("alertMsg", "리뷰 삭제 실패");
			
			return "redirect:/reviewList.re";

		}
		
	}
	
	
	
	
	

	// ---------------- 일반메소드 ---------------------
	
		// 현재 넘어온 첨부파일 그 자체를 서버의 폴더로 저장시키는 메소드
		// > 일반메소드로 BoardController 에 만들고 있음
		// > Controller 클래스에 url 을 요청하는 메소드만 있다라는 법은 없음!!
		//   즉, 일반메소드도 내가 필요하다면 막 만들어서 호출해도됨!!
		public String savePath(MultipartFile upfile,
							   HttpSession session) {
			
			// 예) "bono.jpg" --> "2024052116143012345.jpg"
			// 1. 원본파일명 뽑아오기
			String originName = upfile.getOriginalFilename(); 
											// "bono.jpg"
			
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
											// ".jpg"
			
			// 5. 2 ~ 4 까지 모두 이어 붙이기
			String changeName = currentTime + ranNum + ext;
			
			// 6. 업로드하고자 하는 물리적인 서버의 경로 알아내기
			// > application 객체로부터
			// (webapp/resources/uploadFiles/~~)
			// 컨텍스트 경로를 절대 경로로 변환하기
			
			String savePath = session.getServletContext()
					 .getRealPath("/resources/uploadFiles/product/");
			System.out.println(savePath);
			
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

}
