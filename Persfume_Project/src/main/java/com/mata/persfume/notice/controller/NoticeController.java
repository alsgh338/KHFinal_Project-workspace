package com.mata.persfume.notice.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mata.persfume.common.model.vo.PageInfo;
import com.mata.persfume.common.template.Pagination;
import com.mata.persfume.notice.model.service.NoticeService;
import com.mata.persfume.notice.model.vo.Notice;


@Controller
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("list.no")
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		// 메뉴바 클릭 시 : list.no (기본적으로 1번 페이지로 요청)
		// 페이징바 클릭 시 : list.no?cpage=요청페이지수
		
		 //System.out.println(currentPage);
		// > defaultValue 속성 생략 시 400 에러 발생!!
		
		// 페이징처리용 변수들 (4개)
		int listCount = noticeService.selectListCount();
		
		int pageLimit = 10;
		int boardLimit = 5;
		
		// PageInfo 객체 만들어내기
		PageInfo pi 
			= Pagination.getPageInfo(listCount, 
								 	 currentPage, 
								 	 pageLimit, 
								 	 boardLimit);
		
		 System.out.println(pi);
		
		// 게시글 목록 조회
		ArrayList<Notice> list 
					= noticeService.selectList(pi);
		
		
		for(Notice n : list) {
			System.out.println(n);
		}
		

		
		// 응답데이터 담기
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		// 응답페이지 포워딩
		return "notice/noticeListView";
	}
	
	
	//게시글 작성하기 
	@GetMapping("enrollForm.no")
	public ModelAndView enrollForm(ModelAndView mv) {
		
		// 게시글 작성하기 페이지 포워딩
		mv.setViewName("notice/noticeEnrollForm");
		
		return mv;
	}
	
	// * 만약 다중파일 업로드 기능을 구현하고 싶다면?
	// > form 태그 내부에서 여러개의 input type="file" 요소에
	//   동일한 키값으로 부여 (예. upfiles)
	// > 해당 요청시 전달값으로 매개변수로 
	//   MultipartFile[] upfiles 또는
	//   ArrayList<MultipartFile> upfiles 로 받아
	//   반복문 처리하면 끝!!
	//   (어떤 방법으로 받든 간에 0번째 인덱스부터 차곡차곡
	//    첨부파일 정보들이 들어가 있을 것임)
	
	 @PostMapping("insert.no")
	    public String insertNotice(Notice notice, @RequestParam("upfile") MultipartFile upfile, HttpSession session, Model model) {
	        if (!upfile.isEmpty()) {
	            // 파일 업로드 경로 설정
	            String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
	            String changeName = saveFile(upfile, savePath);

	            // 원본 파일명과 저장된 파일명 설정
	           // notice.setNoticeImgOrigin(upfile.getOriginalFilename());
	           // notice.setNoticeImgChange("resources/uploadFiles/" + changeName);
	            
	        }

	        int result = noticeService.insertNotice(notice);

	        if (result > 0) {
	            return "redirect:/noticeList";
	        } else {
	            model.addAttribute("msg", "공지사항 등록 실패");
	            return "common/errorPage";
	        }
	    }

	    private String saveFile(MultipartFile file, String savePath) {
	        // 파일이 저장될 디렉토리 생성
	        File folder = new File(savePath);
	        if (!folder.exists()) {
	            folder.mkdirs();
	        }

	        // 원본 파일명과 변경된 파일명 설정
	        String originalFileName = file.getOriginalFilename();
	        String changeName = System.currentTimeMillis() + "_" + originalFileName;

	        // 파일 저장
	        try {
	            file.transferTo(new File(savePath + changeName));
	        } catch (IOException e) {
	            e.printStackTrace();
	            // 예외 처리 코드 추가
	        }

	        return changeName;
	    }
	
	
	@GetMapping("detail.no")
	public ModelAndView selectBoard(int nno,
									ModelAndView mv) {
		
		// System.out.println(nno);
		// > bno 에는 상세조회 하고자 하는 해당 게시글 번호가 담겨있음
		
		// 1. 해당 게시글 조회수 증가용 서비스 호출 및 결과 받기
		int result = noticeService.increaseCount(nno);
		
		if(result > 0) { // 성공적으로 조회수가 증가되었다면
			
			// 게시글 상세조회 페이지에서 보여질
			// 해당 게시글 정보를 조회해와야함!!
			Notice n = noticeService.selectNotice(nno);
			
			// 조회된 데이터를 담아서 응답페이지로 포워딩
			
			mv.addObject("n", n)
			  .setViewName("notice/noticeDetailView");
			
		} else { // 조회수 증가에 실패했다면
			
			// 에러문구를 담아서 에러페이지로 포워딩
			mv.addObject("errorMsg", "게시글 상세조회 실패")
			  .setViewName("common/errorPage");
		}
		
		return mv;
	}
	@PostMapping("delete.no")
	public String deleteNotice(int nno,
							  String filePath,
							  Model model,
							  HttpSession session) {
		
		// System.out.println(bno);
		// > 삭제하고자 하는 글번호
		
		int result = noticeService.deleteNotice(nno);
		
		if(result > 0) { // 성공
			
			// 삭제된 게시글에 첨부파일이 있었을 경우
			// > 파일 삭제 처리
			// (서버에 용량만 차지)
			if(!filePath.equals("")) {
				
				// 해당 파일의 물리적인 풀 경로 알아내기
				String realPath = session.getServletContext()
										 .getRealPath(filePath);
				
				// realPath 가 가리키는 파일 객체 생성 후 delete
				new File(realPath).delete();
			}
			
			// session 에 일회성 알람문구를 담은 후
			// list.no 로 url 재요청
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			
			return "redirect:/list.no";
			
		} else { // 실패
			
			// 에러문구를 담아서 에러페이지로 포워딩
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			
			return "common/errorPage";
		}
	}
	
//	@PostMapping("updateForm.no")
//	public String updateForm(int nno, Model model) {
//		// filePath 값을 넘기긴 하나, 삭제시에만 필요하기 때문에
//		// 굳이 요청 시 전달값으로 받지 않음!!
//		
//		// 게시글 한건 조회
//		// > 기존 게시글 상세보기 서비스 로직 재활용
//		Notice n = noticeService.selectNotice(nno);
//		
//		model.addAttribute("n", n);
//		
//		// /WEB-INF/views/board/boardUpdateForm.jsp
//		return "notice/noticeUpdateForm";
//	}
//	
//	@PostMapping("update.no")
//	public String updateNotice(Notice n, 
//							  MultipartFile reupfile,
//							  HttpSession session,
//							  Model model) {
//		
//		// System.out.println(b);
//		// System.out.println(reupfile);
//		
//		// 새로 넘어온 첨부파일이 있을 경우
//		if(!reupfile.getOriginalFilename().equals("")) {
//			
//			// 1. 기존에 첨부파일이 있었을 경우
//			// > 기존의 첨부파일을 찾아서 삭제
//			// > 새로 넘어온 첨부파일을 서버로 업로드 시키기
//			// > b 에 새로 넘어온 첨부파일에 대한 
//			//   원본파일명, 수정파일명 (경로 포함) 더 담기
//			
//			// 2. 기존에 첨부파일이 없었을 경우
//			// > 새로 넘어온 첨부파일을 서버로 업로드 시키기
//			// > b 에 새로 넘어온 첨부파일에 대한 
//			//   원본파일명, 수정파일명 (경로 포함) 더 담기
//			
//			// 기존 첨부파일이 있었을 경우 기존 파일 삭제 먼저
//			// > 기존 첨부파일이 있었을 경우 b 의
//			//   originName, changeName 필드값이 같이 넘어옴
//			if(n.getOriginName() != null) {
//				// 기존 첨부파일이 있었을 경우
//				// > 해당 파일을 찾아서 삭제
//				
//				String realPath 
//						= session.getServletContext()
//								 .getRealPath(n.getChangeName());
//				
//				new File(realPath).delete();
//			}
//			
//			// 새로 넘어온 첨부파일 파일명을 수정작업 후 서버로 업로드
//			String changeName = savePath(reupfile, session);
//			
//			// b 에 새로 넘어온 첨부파일의 원본파일명, 수정파일명 필드값 담기
//			n.setOriginName(reupfile.getOriginalFilename());
//			n.setChangeName("resources/uploadFiles/" + changeName);
//			
//		}
//		
//		/*
//		 * * b 에 무조건 담겨있는 내용
//		 * boardTitle, boardContent, boardNo
//		 * 
//		 * * 추가적으로 고려해야 할 경우의 수
//		 * 1. 새로 첨부된 파일 X, 기존 첨부 파일 X
//		 * > originName : null, changeName : null
//		 * 
//		 * 2. 새로 첨부된 파일 X, 기존 첨부 파일 O
//		 * > originName : 기존 첨부파일의 원본파일명,
//		 *   changeName : 기존 첨부파일의 수정파일명
//		 * 
//		 * 3. 새로 첨부된 파일 O, 기존 첨부 파일 X
//		 * > originName : 새로 넘어온 첨부파일의 원본파일명,
//		 *   changeName : 새로 넘어온 첨부파일의 수정파일명
//		 *   
//		 * 4. 새로 첨부된 파일 O, 기존 첨부파일 O
//		 * > originName : 새로 넘어온 첨부파일의 원본파일명,
//		 *   changeName : 새로 넘어온 첨부파일의 수정파일명
//		 *   
//		 * 만약, Board 테이블과 Attachment 테이블을 따로 둘 경우
//		 * 2. Board 테이블 Update
//		 * 3. Board 테이블 Update, Attachment 테이블 Insert
//		 * 4. Board 테이블 Update, Attachment 테이블 Update
//		 * 이 쿼리를 고려해야함!!  
//		 */
//		
//		int result = noticeService.updateNotice(n);
//		
//		if(result > 0) { // 성공
//			
//			// 일회성 알람문구를 담아서 
//			// 해당 게시글 상세보기 페이지로 url 재요청
//			session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
//			
//			return "redirect:/detail.no?nno=" + n.getNoticeNo();
//			
//		} else { // 실패
//			
//			// 에러문구를 담아서 에러페이지로 포워딩
//			model.addAttribute("errorMsg", "게시글 수정 실패");
//			
//			return "common/errorPage";
//		}
//	}
//	
//	
//	// ---------------- 일반메소드 ---------------------
//	
//	// 현재 넘어온 첨부파일 그 자체를 서버의 폴더로 저장시키는 메소드
//	// > 일반메소드로 BoardController 에 만들고 있음
//	// > Controller 클래스에 url 을 요청하는 메소드만 있다라는 법은 없음!!
//	//   즉, 일반메소드도 내가 필요하다면 막 만들어서 호출해도됨!!
//	public String savePath(MultipartFile upfile,
//						   HttpSession session) {
//		
//		// 예) "bono.jpg" --> "2024052116143012345.jpg"
//		// 1. 원본파일명 뽑아오기
//		String originName = upfile.getOriginalFilename(); 
//										// "bono.jpg"
//		
//		// 2. 시간 형식으로 문자열로 뽑아내기 (년월일시분초)
//		String currentTime 
//				= new SimpleDateFormat("yyyyMMddHHmmss")
//									.format(new Date());
//										// "20240521161430" 
//		
//		// 3. 뒤에 붙을 5자리 랜덤수 얻어내기 (10000 ~ 99999)
//		int ranNum = (int)(Math.random() * 90000 + 10000);
//										// 12345
//		
//		// 4. 원본파일명으로부터 확장자명 뽑기
//		String ext 
//			= originName.substring(originName.lastIndexOf("."));
//										// ".jpg"
//		
//		// 5. 2 ~ 4 까지 모두 이어 붙이기
//		String changeName = currentTime + ranNum + ext;
//		
//		// 6. 업로드하고자 하는 물리적인 서버의 경로 알아내기
//		// > application 객체로부터
//		// (webapp/resources/uploadFiles/~~)
//		String savePath
//				= session.getServletContext()
//						 .getRealPath("/resources/uploadFiles/");
//		
//		// 7. 경로와 수정파일명 합체 후 파일을 업로드해주기
//		// > MultipartFile 객체가 제공하는
//		//   transferTo 메소드를 이용함
//		try {
//			
//			upfile.transferTo(new File(savePath + changeName));
//		
//		} catch (IllegalStateException | IOException e) {
//			e.printStackTrace();
//		}
//		
//		// 수정파일명 문자열을 리턴
//		return changeName;
//	}
//	
//	
	
}










