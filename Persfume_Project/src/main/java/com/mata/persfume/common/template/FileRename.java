package com.mata.persfume.common.template;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public class FileRename {

	public static String savePath(MultipartFile upfile, HttpSession session) {
		
		// 1. 원본파일명 뽑아오기
		String originName = upfile.getOriginalFilename(); // "bono.jpg"
		
		// 2. 시간 형식으로 문자열 뽑아내기
		// "20240521161430" (년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 3. 뒤에 붙을 5자리 랜덤 수 얻어내기
		int ranNum = (int)(Math.random() * 90000 + 10000);
		
		// 4. 원본파일명으로부터 확장자명 뽑기
		String ext = originName.substring(originName.lastIndexOf("."));
		// ".jpg"
		
		// 5. 2 ~ 4 까지 모두 이어 붙이기
		String changeName = currentTime + ranNum + ext;
		
		// 6. 업로드하고자 하는 물리적인 서버의 경로 알아내기
		// > application 객체로부터 
		// (webapp/resources/uploadFiles/~~)
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		// 7. 경로와 수정파일명 합체 후 파일을 업로드 해주기
		// > MultipartFile 객체가 제공하는
		//   transferTo 메소드를 이용함
		try {
			
			upfile.transferTo(new File(savePath + changeName));
			
		} catch (IllegalStateException | IOException e) {
			
			e.printStackTrace();
		}
		
		return changeName;
	}
}
