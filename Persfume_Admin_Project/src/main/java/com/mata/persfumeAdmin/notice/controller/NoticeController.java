package com.mata.persfumeAdmin.notice.controller;

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

import com.mata.persfumeAdmin.notice.model.service.NoticeService;
import com.mata.persfumeAdmin.notice.model.vo.Notice;


@Controller
public class NoticeController {

   @Autowired
   private NoticeService noticeService;
   
   
   //공지글 리스트 
      @GetMapping("adList.no")
      public String selectList( Model model) {
         
      
         // 게시글 목록 조회
         ArrayList<Notice> list = noticeService.selectList();
         
         
         
         /*for(Notice n : list) {
         System.out.println(n);
         
   }
   */
         
         model.addAttribute("list", list);
         
         // 응답페이지 포워딩
         return "notice/noticeListView";
      }
      
      
      //공지글 상세보기
      @GetMapping("detail.no")
      public ModelAndView selectNotice(int nno,
                              ModelAndView mv) {
         
          //System.out.println(nno);
      
         
         // 1. 해당 게시글 조회수 증가용 서비스 호출 및 결과 받기
         int result = noticeService.increaseCount(nno);
         
         if(result > 0) { // 성공적으로 조회수가 증가되었다면
            
            // 공지글 상세조회 페이지에서 보여질
            // 해당 게시글 정보를 조회해와야함!!
            Notice n = noticeService.selectNotice(nno);
            
             
            
            // 조회된 데이터를 담아서 응답페이지로 포워딩
           
         
      
               mv.addObject("n", n)
                 .setViewName("notice/noticeUpdateForm");
         } else { // 조회수 증가에 실패했다면
            
            // 에러문구를 담아서 에러페이지로 포워딩
            mv.addObject("errorMsg", "게시글 상세조회 실패")
              .setViewName("common/errorPage");
         }
         
         return mv;
      }
   
   //공지글 작성하기 
   @GetMapping("adEnrollForm.no")
   public ModelAndView enrollForm(ModelAndView mv) {
      
      // 게시글 작성하기 페이지 포워딩
      mv.setViewName("notice/noticeEnrollForm");
      
      return mv;
   }
   
   //공지사항 등록 처리
   @PostMapping("insert.no")
   public ModelAndView insertNotice(Notice n, 
           				 			MultipartFile upfile,
           				 			HttpSession session,
           				 			ModelAndView mv) {
   
   
   
		if(!upfile.getOriginalFilename().equals("")) {
         // 요청 시 전달된 파일이 있을 경우
         
         // 파일명 수정 작업 후 서버에 업로드 시키기
         // > 기존에는 cos.jar 에서 제공하는 FileRenamePolicy 이용
         //   스프링에서는 기본적으로 제공되는게 없기 때문에 내가 직접 짜야함
         String noticeImgChange = savePath(upfile, session);    
         n.setNoticeImgOrigin(upfile.getOriginalFilename());
         n.setNoticeImgChange("resources/uploadFiles/" + noticeImgChange);
         
      }
      
       System.out.println(n);
   
      int result = noticeService.insertNotice(n);
      
      // 결과에 따른 응답페이지 처리
      if(result > 0) { // 성공
         
         // 일회성 알람문구를 출력하고 list.no 로 url 재요청
         session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
         
         mv.setViewName("redirect:/adList.no");
         
      } else { // 실패
         
       
         mv.addObject("errorMsg", "게시글 등록 실패")
           .setViewName("common/errorPage");
      
      }  
      
      return mv;
      
   } // insertNotice 메소드 영역 끝
   
   
   
   //공지글 삭제하기
   @PostMapping("adDelete.no")
   public String deleteNotice(@RequestParam("noticeNo") Integer nno,
                              @RequestParam("filePath") String filePath,
                              Model model,
                              HttpSession session) {
       if (nno == null) {
           model.addAttribute("errorMsg", "유효하지 않은 공지글 번호입니다.");
           return "common/errorPage";
       }

       int result = noticeService.deleteNotice(nno);

       if(result > 0) { // 성공
           if(filePath != null && !filePath.equals("")) {
               String realPath = session.getServletContext().getRealPath(filePath);
               new File(realPath).delete();
           }
           session.setAttribute("alertMsg", "성공적으로 공지글이 삭제되었습니다.");
           return "redirect:/adList.no";
       } else { // 실패
           model.addAttribute("errorMsg", "게시글 삭제 실패");
           return "common/errorPage";
       }
   }//deleteNotice 메소드 영억 끝

   
   @PostMapping("adUpdateForm.no")
   public String updateForm(int nno, Model model) {
      // filePath 값을 넘기긴 하나, 삭제시에만 필요하기 때문에
      // 굳이 요청 시 전달값으로 받지 않음!!
      
      // 게시글 한건 조회
      // > 기존 게시글 상세보기 서비스 로직 재활용
      Notice n = noticeService.selectNotice(nno);
      
      model.addAttribute("n", n);
      
      // /WEB-INF/views/board/boardUpdateForm.jsp
      return "notice/noticeList";
   }

   @PostMapping("adUpdate.no")
   public String updateNotice(Notice n, 
	                          MultipartFile reupfile,
	                          HttpSession session,
	                          Model model) {
         
         if(!reupfile.getOriginalFilename().equals("")) {
            
            if(n.getNoticeImgOrigin() != null) {
               String realPath = session.getServletContext().getRealPath(n.getNoticeImgChange());
               new File(realPath).delete();
            }
            
            String noticeImgChange = savePath(reupfile, session);
            n.setNoticeImgOrigin(reupfile.getOriginalFilename());
            n.setNoticeImgChange("resources/uploadFiles/" + noticeImgChange);
         }
         
         int result = noticeService.updateNotice(n);
         
         if(result > 0) { // 성공
            session.setAttribute("alertMsg", "공지글이 수정되었습니다.");
            return "redirect:/adList.no";
         } else { // 실패
            model.addAttribute("errorMsg", "게시글 수정 실패");
            return "common/errorPage";
         }
   }
public String savePath(MultipartFile upfile,
                  		HttpSession session) {
   
   // 예) "bono.jpg" --> "2024052116143012345.jpg"
   // 1. 원본파일명 뽑아오기
   String noticeImgOrigin = upfile.getOriginalFilename(); 
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
      = noticeImgOrigin.substring(noticeImgOrigin.lastIndexOf("."));
                           // ".jpg"
   
   // 5. 2 ~ 4 까지 모두 이어 붙이기
   String noticeImgChange = currentTime + ranNum + ext;
   
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
      
      upfile.transferTo(new File(savePath + noticeImgChange));
   
   } catch (IllegalStateException | IOException e) {
      e.printStackTrace();
   }
   
   // 수정파일명 문자열을 리턴
  
   return noticeImgChange;
}



@PostMapping("restore.no")
public String restoreNotice(int nno, Model model, HttpSession session) {
	
	int result = noticeService.restoreNotice(nno);
	 session.setAttribute("alertMsg", "성공적으로 공지글이 복구되었습니다.");
	return "redirect:/adList.no";
}
}












