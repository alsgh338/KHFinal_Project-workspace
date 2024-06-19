package com.mata.persfumeAdmin.oneClass.controller;

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

import com.mata.persfumeAdmin.oneClass.model.service.OneClassService;
import com.mata.persfumeAdmin.oneClass.model.vo.OneClass;
import com.mata.persfumeAdmin.oneClass.model.vo.OneClassImg;


// 관리자 컨트롤러
@Controller
public class OneClassController {
	
	
	
	@Autowired
	private OneClassService oneClassService;
	
	//클래스 목록 조회 컨트롤러 
	@GetMapping("list.oc")
	public String selectList(Model model) {
		
		ArrayList<OneClass> list = oneClassService.selectList();
		
		model.addAttribute("list",list);
		
		return "oneClass/oneClassListView";
	}
	
	@GetMapping("detail.oc")
	public String selectOneClass(int ocno,Model model) {
		
		OneClass oc = oneClassService.selectOneClass(ocno);
				
		if(oc != null) {
			ArrayList<OneClassImg> ociList = oneClassService.selectOneClassImgList(ocno);			

			System.out.println(oc);
			model.addAttribute("oc",oc);
			
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
		
		System.out.println(oc.getStartTime());
		
		ArrayList<OneClassImg> ociList = new ArrayList();
		
		if(!upThumbnail.getOriginalFilename().equals("")) {
			String changeName = savePath(upThumbnail, session);
			OneClassImg oci = new OneClassImg();
			oci.setClassImgOrigin(upThumbnail.getOriginalFilename());
			oci.setClassImgChange(changeName);
			oci.setClassImgPath("resources\\classUploadFiles\\" + changeName);
			oci.setImgType(1);
			ociList.add(oci);
		}
		
		
		for(MultipartFile mf : upFiles) {
			
			if(!mf.getOriginalFilename().equals("")) {
				String changeName = savePath(mf, session);
				OneClassImg oci = new OneClassImg();
				oci.setClassImgOrigin(mf.getOriginalFilename());
				oci.setClassImgChange(changeName);
				oci.setClassImgPath("resources\\classUploadFiles\\" + changeName);
				oci.setImgType(2);
				ociList.add(oci);
			}
			
		}
		
		

		int result = oneClassService.insertOneClass(oc);
		
		if(result > 0) { 
			int imgResult = oneClassService.insertOneClassImg(ociList);
			
			
			if(imgResult > 0) {
				System.out.println("전부 성공");
				return "redirect:/list.oc";
			} else {
				System.out.println("사진 실패  클래스 성공");
				return "redirect:/list.oc";
			}
		}
		
		System.out.println("전부 실패");
		return "redirect:/list.oc";
		
	}
	
	@PostMapping("update.oc")
	public String updateOneClass(OneClass oc, Model model) {
		
		System.out.println(oc);
		
		int result = oneClassService.updateOneClass(oc);
		System.out.println(result);
		if(result > 0) {
			
			return "redirect:/list.oc";
		}
		
		return "redirect:/list.oc";
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
			
			String realPath = "C:\\KHFinal_Project-workspace\\Persfume_Project\\src\\main\\webapp\\resources\\classUploadFiles\\";
			System.out.println(realPath);
			
			// 7. 경로와 수정파일명 합체 후 파일을 업로드해주기
			// > MultipartFile 객체가 제공하는
			//   transferTo 메소드를 이용함
			try {
				
				upfile.transferTo(new File(realPath + changeName));
			
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			// 수정파일명 문자열을 리턴
			return changeName;
		}

}
