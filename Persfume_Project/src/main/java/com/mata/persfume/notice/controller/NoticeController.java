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
		// �޴��� Ŭ�� �� : list.no (�⺻������ 1�� �������� ��û)
		// ����¡�� Ŭ�� �� : list.no?cpage=��û��������
		
		 //System.out.println(currentPage);
		// > defaultValue �Ӽ� ���� �� 400 ���� �߻�!!
		
		// ����¡ó���� ������ (4��)
		int listCount = noticeService.selectListCount();
		
		int pageLimit = 10;
		int boardLimit = 5;
		
		// PageInfo ��ü ������
		PageInfo pi 
			= Pagination.getPageInfo(listCount, 
								 	 currentPage, 
								 	 pageLimit, 
								 	 boardLimit);
		
		 System.out.println(pi);
		
		// �Խñ� ��� ��ȸ
		ArrayList<Notice> list 
					= noticeService.selectList(pi);
		
		
		for(Notice n : list) {
			System.out.println(n);
		}
		

		
		// ���䵥���� ���
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		// ���������� ������
		return "notice/noticeListView";
	}
	
	
	//�Խñ� �ۼ��ϱ� 
	@GetMapping("enrollForm.no")
	public ModelAndView enrollForm(ModelAndView mv) {
		
		// �Խñ� �ۼ��ϱ� ������ ������
		mv.setViewName("notice/noticeEnrollForm");
		
		return mv;
	}
	
	// * ���� �������� ���ε� ����� �����ϰ� �ʹٸ�?
	// > form �±� ���ο��� �������� input type="file" ��ҿ�
	//   ������ Ű������ �ο� (��. upfiles)
	// > �ش� ��û�� ���ް����� �Ű������� 
	//   MultipartFile[] upfiles �Ǵ�
	//   ArrayList<MultipartFile> upfiles �� �޾�
	//   �ݺ��� ó���ϸ� ��!!
	//   (� ������� �޵� ���� 0��° �ε������� ��������
	//    ÷������ �������� �� ���� ����)
	
	 @PostMapping("insert.no")
	    public String insertNotice(Notice notice, @RequestParam("upfile") MultipartFile upfile, HttpSession session, Model model) {
	        if (!upfile.isEmpty()) {
	            // ���� ���ε� ��� ����
	            String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
	            String changeName = saveFile(upfile, savePath);

	            // ���� ���ϸ�� ����� ���ϸ� ����
	           // notice.setNoticeImgOrigin(upfile.getOriginalFilename());
	           // notice.setNoticeImgChange("resources/uploadFiles/" + changeName);
	            
	        }

	        int result = noticeService.insertNotice(notice);

	        if (result > 0) {
	            return "redirect:/noticeList";
	        } else {
	            model.addAttribute("msg", "�������� ��� ����");
	            return "common/errorPage";
	        }
	    }

	    private String saveFile(MultipartFile file, String savePath) {
	        // ������ ����� ���丮 ����
	        File folder = new File(savePath);
	        if (!folder.exists()) {
	            folder.mkdirs();
	        }

	        // ���� ���ϸ�� ����� ���ϸ� ����
	        String originalFileName = file.getOriginalFilename();
	        String changeName = System.currentTimeMillis() + "_" + originalFileName;

	        // ���� ����
	        try {
	            file.transferTo(new File(savePath + changeName));
	        } catch (IOException e) {
	            e.printStackTrace();
	            // ���� ó�� �ڵ� �߰�
	        }

	        return changeName;
	    }
	
	
	@GetMapping("detail.no")
	public ModelAndView selectBoard(int nno,
									ModelAndView mv) {
		
		// System.out.println(nno);
		// > bno ���� ����ȸ �ϰ��� �ϴ� �ش� �Խñ� ��ȣ�� �������
		
		// 1. �ش� �Խñ� ��ȸ�� ������ ���� ȣ�� �� ��� �ޱ�
		int result = noticeService.increaseCount(nno);
		
		if(result > 0) { // ���������� ��ȸ���� �����Ǿ��ٸ�
			
			// �Խñ� ����ȸ ���������� ������
			// �ش� �Խñ� ������ ��ȸ�ؿ;���!!
			Notice n = noticeService.selectNotice(nno);
			
			// ��ȸ�� �����͸� ��Ƽ� ������������ ������
			
			mv.addObject("n", n)
			  .setViewName("notice/noticeDetailView");
			
		} else { // ��ȸ�� ������ �����ߴٸ�
			
			// ���������� ��Ƽ� ������������ ������
			mv.addObject("errorMsg", "�Խñ� ����ȸ ����")
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
		// > �����ϰ��� �ϴ� �۹�ȣ
		
		int result = noticeService.deleteNotice(nno);
		
		if(result > 0) { // ����
			
			// ������ �Խñۿ� ÷�������� �־��� ���
			// > ���� ���� ó��
			// (������ �뷮�� ����)
			if(!filePath.equals("")) {
				
				// �ش� ������ �������� Ǯ ��� �˾Ƴ���
				String realPath = session.getServletContext()
										 .getRealPath(filePath);
				
				// realPath �� ����Ű�� ���� ��ü ���� �� delete
				new File(realPath).delete();
			}
			
			// session �� ��ȸ�� �˶������� ���� ��
			// list.no �� url ���û
			session.setAttribute("alertMsg", "���������� �Խñ��� �����Ǿ����ϴ�.");
			
			return "redirect:/list.no";
			
		} else { // ����
			
			// ���������� ��Ƽ� ������������ ������
			model.addAttribute("errorMsg", "�Խñ� ���� ����");
			
			return "common/errorPage";
		}
	}
	
//	@PostMapping("updateForm.no")
//	public String updateForm(int nno, Model model) {
//		// filePath ���� �ѱ�� �ϳ�, �����ÿ��� �ʿ��ϱ� ������
//		// ���� ��û �� ���ް����� ���� ����!!
//		
//		// �Խñ� �Ѱ� ��ȸ
//		// > ���� �Խñ� �󼼺��� ���� ���� ��Ȱ��
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
//		// ���� �Ѿ�� ÷�������� ���� ���
//		if(!reupfile.getOriginalFilename().equals("")) {
//			
//			// 1. ������ ÷�������� �־��� ���
//			// > ������ ÷�������� ã�Ƽ� ����
//			// > ���� �Ѿ�� ÷�������� ������ ���ε� ��Ű��
//			// > b �� ���� �Ѿ�� ÷�����Ͽ� ���� 
//			//   �������ϸ�, �������ϸ� (��� ����) �� ���
//			
//			// 2. ������ ÷�������� ������ ���
//			// > ���� �Ѿ�� ÷�������� ������ ���ε� ��Ű��
//			// > b �� ���� �Ѿ�� ÷�����Ͽ� ���� 
//			//   �������ϸ�, �������ϸ� (��� ����) �� ���
//			
//			// ���� ÷�������� �־��� ��� ���� ���� ���� ����
//			// > ���� ÷�������� �־��� ��� b ��
//			//   originName, changeName �ʵ尪�� ���� �Ѿ��
//			if(n.getOriginName() != null) {
//				// ���� ÷�������� �־��� ���
//				// > �ش� ������ ã�Ƽ� ����
//				
//				String realPath 
//						= session.getServletContext()
//								 .getRealPath(n.getChangeName());
//				
//				new File(realPath).delete();
//			}
//			
//			// ���� �Ѿ�� ÷������ ���ϸ��� �����۾� �� ������ ���ε�
//			String changeName = savePath(reupfile, session);
//			
//			// b �� ���� �Ѿ�� ÷�������� �������ϸ�, �������ϸ� �ʵ尪 ���
//			n.setOriginName(reupfile.getOriginalFilename());
//			n.setChangeName("resources/uploadFiles/" + changeName);
//			
//		}
//		
//		/*
//		 * * b �� ������ ����ִ� ����
//		 * boardTitle, boardContent, boardNo
//		 * 
//		 * * �߰������� ����ؾ� �� ����� ��
//		 * 1. ���� ÷�ε� ���� X, ���� ÷�� ���� X
//		 * > originName : null, changeName : null
//		 * 
//		 * 2. ���� ÷�ε� ���� X, ���� ÷�� ���� O
//		 * > originName : ���� ÷�������� �������ϸ�,
//		 *   changeName : ���� ÷�������� �������ϸ�
//		 * 
//		 * 3. ���� ÷�ε� ���� O, ���� ÷�� ���� X
//		 * > originName : ���� �Ѿ�� ÷�������� �������ϸ�,
//		 *   changeName : ���� �Ѿ�� ÷�������� �������ϸ�
//		 *   
//		 * 4. ���� ÷�ε� ���� O, ���� ÷������ O
//		 * > originName : ���� �Ѿ�� ÷�������� �������ϸ�,
//		 *   changeName : ���� �Ѿ�� ÷�������� �������ϸ�
//		 *   
//		 * ����, Board ���̺�� Attachment ���̺��� ���� �� ���
//		 * 2. Board ���̺� Update
//		 * 3. Board ���̺� Update, Attachment ���̺� Insert
//		 * 4. Board ���̺� Update, Attachment ���̺� Update
//		 * �� ������ ����ؾ���!!  
//		 */
//		
//		int result = noticeService.updateNotice(n);
//		
//		if(result > 0) { // ����
//			
//			// ��ȸ�� �˶������� ��Ƽ� 
//			// �ش� �Խñ� �󼼺��� �������� url ���û
//			session.setAttribute("alertMsg", "���������� �Խñ��� �����Ǿ����ϴ�.");
//			
//			return "redirect:/detail.no?nno=" + n.getNoticeNo();
//			
//		} else { // ����
//			
//			// ���������� ��Ƽ� ������������ ������
//			model.addAttribute("errorMsg", "�Խñ� ���� ����");
//			
//			return "common/errorPage";
//		}
//	}
//	
//	
//	// ---------------- �Ϲݸ޼ҵ� ---------------------
//	
//	// ���� �Ѿ�� ÷������ �� ��ü�� ������ ������ �����Ű�� �޼ҵ�
//	// > �Ϲݸ޼ҵ�� BoardController �� ����� ����
//	// > Controller Ŭ������ url �� ��û�ϴ� �޼ҵ常 �ִٶ�� ���� ����!!
//	//   ��, �Ϲݸ޼ҵ嵵 ���� �ʿ��ϴٸ� �� ���� ȣ���ص���!!
//	public String savePath(MultipartFile upfile,
//						   HttpSession session) {
//		
//		// ��) "bono.jpg" --> "2024052116143012345.jpg"
//		// 1. �������ϸ� �̾ƿ���
//		String originName = upfile.getOriginalFilename(); 
//										// "bono.jpg"
//		
//		// 2. �ð� �������� ���ڿ��� �̾Ƴ��� (����Ͻú���)
//		String currentTime 
//				= new SimpleDateFormat("yyyyMMddHHmmss")
//									.format(new Date());
//										// "20240521161430" 
//		
//		// 3. �ڿ� ���� 5�ڸ� ������ ���� (10000 ~ 99999)
//		int ranNum = (int)(Math.random() * 90000 + 10000);
//										// 12345
//		
//		// 4. �������ϸ����κ��� Ȯ���ڸ� �̱�
//		String ext 
//			= originName.substring(originName.lastIndexOf("."));
//										// ".jpg"
//		
//		// 5. 2 ~ 4 ���� ��� �̾� ���̱�
//		String changeName = currentTime + ranNum + ext;
//		
//		// 6. ���ε��ϰ��� �ϴ� �������� ������ ��� �˾Ƴ���
//		// > application ��ü�κ���
//		// (webapp/resources/uploadFiles/~~)
//		String savePath
//				= session.getServletContext()
//						 .getRealPath("/resources/uploadFiles/");
//		
//		// 7. ��ο� �������ϸ� ��ü �� ������ ���ε����ֱ�
//		// > MultipartFile ��ü�� �����ϴ�
//		//   transferTo �޼ҵ带 �̿���
//		try {
//			
//			upfile.transferTo(new File(savePath + changeName));
//		
//		} catch (IllegalStateException | IOException e) {
//			e.printStackTrace();
//		}
//		
//		// �������ϸ� ���ڿ��� ����
//		return changeName;
//	}
//	
//	
	
}










