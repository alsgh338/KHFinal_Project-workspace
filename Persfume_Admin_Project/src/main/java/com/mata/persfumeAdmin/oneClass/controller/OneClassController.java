package com.mata.persfumeAdmin.oneClass.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mata.persfumeAdmin.oneClass.model.service.OneClassService;
import com.mata.persfumeAdmin.oneClass.model.vo.OneClass;
import com.mata.persfumeAdmin.oneClass.model.vo.OneClassImg;
import com.mata.persfumeAdmin.oneClass.model.vo.OneClassRegist;
import com.mata.persfumeAdmin.oneClass.model.vo.OneClassReview;
import com.mata.persfumeAdmin.oneClass.model.vo.OneClassTeacher;


// 관리자 컨트롤러
@Controller
public class OneClassController {
	
	
	@Value("${key.imp}")
    private String impApiKey;
	
    @Value("${key.impKey}")
    private String apiKey;
 
    @Value("${key.impSecretkey}")
    private String secretKey;
	
	@Autowired
	private OneClassService oneClassService;
	
	//클래스 목록 조회 컨트롤러 
	@GetMapping("list.oc")
	public String selectList(Model model) {
		
		ArrayList<OneClass> list = oneClassService.selectList();
		
		System.out.println(list);
		
		model.addAttribute("list",list);
		
		return "oneClass/oneClassListView";
	}
	
	@GetMapping("detail.oc")
	public String selectOneClass(int ocno,Model model) {
		
		OneClass oc = oneClassService.selectOneClass(ocno);
				
		if(oc != null) {
			ArrayList<OneClassImg> ociList = oneClassService.selectOneClassImgList(ocno);
			
			model.addAttribute("oc",oc);
			model.addAttribute("ociList",ociList);
			
		}
		
		
		return "oneClass/oneClassDetailView";
	}
	
	
	@GetMapping("enrollForm.oc")
	public String enrollForm(Model model) {
		
		return "oneClass/oneClassEnrollFormView";
	}
	
	@PostMapping("insert.oc")
	public String insertBoard(OneClass oc, 
									MultipartFile upThumbnail,
									MultipartFile[] upFiles,
									HttpSession session,
									Model model) {
		
		ArrayList<OneClassImg> ociList = new ArrayList();
		
		oc.setClassDetail(oc.getClassDetail().replaceAll("<hr>", "\\r\\n").replaceAll("<hr>", "\\r").replaceAll("<hr>", "\\n"));

		
		
		if(!upThumbnail.getOriginalFilename().equals("")) {
			String changeName = savePath(upThumbnail, session);
			OneClassImg oci = new OneClassImg();
			oci.setClassImgOrigin(upThumbnail.getOriginalFilename());
			oci.setClassImgChange(changeName);
			oci.setClassImgPath("resources/uploadFiles/oneClass/" + changeName);
			oci.setImgType(1);
			ociList.add(oci);
		}
		
		
		for(MultipartFile mf : upFiles) {
			
			if(!mf.getOriginalFilename().equals("")) {
				String changeName = savePath(mf, session);
				OneClassImg oci = new OneClassImg();
				oci.setClassImgOrigin(mf.getOriginalFilename());
				oci.setClassImgChange(changeName);
				oci.setClassImgPath("resources/uploadFiles/oneClass/" + changeName);
				oci.setImgType(2);
				ociList.add(oci);
			}
			
		}
		
		

		int result = oneClassService.insertOneClass(oc);
		
		if(result > 0) { 
			int imgResult = oneClassService.insertOneClassImg(ociList);
			
			
			if(imgResult > 0) {
				return "redirect:/list.oc";
			} else {
				return "redirect:/list.oc";
			}
		}
		
		return "redirect:/list.oc";
		
	}
	
	@PostMapping("update.oc")
	public String updateOneClass(OneClass oc,
								String prevThumb,
								String classImgPath,
								MultipartFile upThumbnail,
								MultipartFile[] upFiles,
								HttpSession session,
								Model model) {
		
		System.out.println(oc);
		System.out.println(upThumbnail);
		System.out.println(upFiles);
		System.out.println(classImgPath);
		System.out.println(prevThumb);
		
		ArrayList<OneClassImg> ociList = new ArrayList();
			
		if(upThumbnail.getSize() != 0) { // 썸네일 변경 사항이 있다면
			
			// 서버에서 이미지 삭제			
			String thumbnailRealPath = session.getServletContext().getRealPath(prevThumb);
			new File(thumbnailRealPath).delete();
			
			// 새로운 이미지 저장 및 경로 받아오기
			String changeName = savePath(upThumbnail, session);
			OneClassImg oci = new OneClassImg();
			oci.setClassImgOrigin(upThumbnail.getOriginalFilename());
			oci.setClassImgChange(changeName);
			oci.setClassImgPath("resources/uploadFiles/oneClass/" + changeName);
			oci.setPrevClassImgPath(prevThumb);
			oci.setImgType(1);
			
			ociList.add(oci);
		}
		
		
		for(int i = 0; i < upFiles.length; i++) {
			
			if(upFiles[i].getSize() != 0) { // 썸네일 변경 사항이 있다면
				String thumbnailRealPath = session.getServletContext().getRealPath(classImgPath);
				new File(thumbnailRealPath).delete();
				String changeName = savePath(upFiles[i], session);
				OneClassImg oci = new OneClassImg();
				oci.setClassImgOrigin(upFiles[i].getOriginalFilename());
				oci.setClassImgChange(changeName);
				oci.setClassImgPath("resources/uploadFiles/oneClass/" + changeName);
				oci.setPrevClassImgPath(classImgPath);
				oci.setImgType(1);
				ociList.add(oci);
			}
		}
		
		int result = oneClassService.updateOneClass(oc);
		
		if(result > 0) {
			
			oneClassService.updateOneClassImg(ociList);
			
			return "redirect:/list.oc";
		}
		
		return "redirect:/list.oc";
	}
	
	// 클래스 폐강
	@PostMapping("delete.oc")
	public String deleteOneClass(int ocno, Model model) {
		
		int result = oneClassService.deleteOneClass(ocno);;
		
		if(result > 0) {
			
		}
		
		return "redirect:/list.oc";
	}
	
	// 폐강 클래스 복구
	@PostMapping("restore.oc")
	public String restoreOneClass(int ocno, Model model) {
		
		int result = oneClassService.restoreOneClass(ocno);;
		
		return "redirect:/list.oc";
	}
	
	
	
	
	//클래스 예약 목록 조회 컨트롤러 
	@GetMapping("registList.oc")
	public String selectRegistList(Model model) {
		
		ArrayList<OneClassRegist> list = oneClassService.selectRegistList();
		
		model.addAttribute("list",list);
		
		return "oneClass/oneClassRegistListView";
	}
	
	
	// 클래스 강사 목록 조회
	
	@GetMapping("teacherList.oc")
	public String selectTeacherList(Model model) {
		
		ArrayList<OneClassTeacher> list = oneClassService.selectTeacherList();
		
		model.addAttribute("list",list);
		
		return "oneClass/oneClassReviewListView";
	}
	
	// 클래스 리뷰 목록 조회
	
	@GetMapping("review.oc")
	public String selectTeacherList(String octc, Model model) {
		
		ArrayList<OneClassReview> list = oneClassService.selectReviewList(octc);
		
		model.addAttribute("list",list);
		model.addAttribute("octc",octc);
		
		return "oneClass/oneClassReviewDetailView";
	}
	
	// 리뷰 삭제
	@PostMapping("deleteReview.oc")
	public String deleteReview(int ocrno, Model model) {
		
		int result = oneClassService.deleteReview(ocrno);
		
		
		return "redirect:/teacherList.oc";
	}
	
	// 클래스 예약 취소
	@PostMapping("deleteRegist.oc")
	public String deleteRegist(String ocrno, String refundMsg, Model model) {
		
		try {
			
			System.out.println(apiKey + "  /  " +  secretKey);
			int result = oneClassService.deleteRegist(ocrno);
			
			if(result > 0) { // DB에 해당 결제 정보 수정 성공
				String token = oneClassService.getToken(apiKey, secretKey);
				oneClassService.refundRequest(token, ocrno, refundMsg);
				
				return "redirect:/registList.oc";
				
			} else { // DB에 해당 결제 정보 수정 실패
				return "redirect:/registList.oc";
			}
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return "redirect:/registList.oc";
			
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
					 .getRealPath("/resources/uploadFiles/oneClass/");
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
