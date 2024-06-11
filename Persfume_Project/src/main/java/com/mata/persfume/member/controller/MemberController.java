package com.mata.persfume.member.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServlet;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mata.persfume.member.model.service.MemberService;
import com.mata.persfume.member.model.vo.Member;

@Controller
public class MemberController {

	// 인증번호를 담아둘 해시맵 생성 (전역변수)
	// key : 인증할 email 주소, value : 인증번호
	// 단, 동기화 문제 때문에 동기화 기능을 제공하게끔 객체를 생성할 것
	// (동시에 여러 사람이 인증 요청을 보냈을 경우 인증번호를 동시에 put 할 수 있게끔)
	private Map<String, String> certNoList 
					= Collections.synchronizedMap(new HashMap<>());
	
	@Autowired
	private JavaMailSender mailSender; // = new JavaMailSenderImpl();

	// 비밀번호 암호화를 위한 Autowired 설정
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("enroll.me")
	public String memberEnrollform() {
		
		return "member/memberEnrollform";
		
	} // memberEnrollform fin.
	
	@ResponseBody
	@GetMapping(value="idCheck.me", produces ="text/html; charset=UTF-8")
	public String idCheck(String checkId) {
		
		int count = memberService.idCheck(checkId);
		
		if(count > 0) { //있는 아이디
			
			return "NNNNN";
			
		}else { // 없는 아이디
			
			return "NNNNY";
		}
	
	} // idCheck fin.
	
	@PostMapping("insert.me")
	public String insertMember(Member m,
			Model model,
			HttpSession session,
	        @RequestParam(value="phone1") String phone1,
	        @RequestParam(value="phone2") String phone2,
	        @RequestParam(value="phone3") String phone3) {
		
		//System.out.println(m);
		
		// 비밀번호 암호화
		String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
		// 사용자가 입력한 비밀번호를 암호화해서 encPwd 에 담는다
		
		m.setMemPwd(encPwd);
		// m 객체에 암호화된 비밀번호로 세팅한다
		
		String phone = phone1 + phone2 + phone3;
	    m.setPhone(phone);
		
		int result =  memberService.insertMember(m);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "반갑습니다" + m.getMemName() +"님");
			
			return "redirect:/";
		}else {
			
			model.addAttribute("errorMsg", "회원가입 실패");
			
			return "common/errorPage";
		}
		
	}  // insertMember fin.
	
	@ResponseBody
	@PostMapping(value="sendMail.me", produces="text/html; charset=UTF-8")
	public String sendMail(String email) throws MessagingException{
		
		// 6자리의 랜덤 1회성 인증번호 발급
		// (1회성 인증번호 : One Time Password - OTP)
		// > 100000 ~ 999999
		int random = (int)(Math.random() * 900000 + 100000);
		
		// 발급한 인증번호를 사용자에게 그냥 넘기는게 아니라
		// 대조용으로 Controller 의 Map 으로 갖고 있을 것임!!
		certNoList.put(email, String.valueOf(random));
		// > CERT 테이블에 INSERT
		
		System.out.println(certNoList);
		System.out.println("이메일 : " + email);

		MimeMessage message = mailSender.createMimeMessage();
		
		
		MimeMessageHelper mimeMessageHelper
		= new MimeMessageHelper(message, true, "UTF-8");
		
		
		mimeMessageHelper.setTo(email);
		// 입력 받은 이메일로 설정
		
		// 제목
		mimeMessageHelper.setSubject("WELCOME to Persfume");
		
		// 내용
		mimeMessageHelper.setText("<h1>[Persfume] 이메일 인증 번호 입니다.</h1>"
				+ "<br>"
				+ "<div>"
				+ "<h3>"
				+ "회원가입 화면으로 돌아가 아래의 인증번호를 입력해주세요"
				+ "</h3>"
				+ "<p> 인증번호 : "+ random +"</p>"
				+ "</div>", true);
		
		// 메세지 전송
		mailSender.send(message);
		
		
		return "이메일 전송 성공!!";
		
//		------------------------------------------------------------
		/*
		// 사용자에게 이메일로 해당 인증번호 보내기
		SimpleMailMessage message = new SimpleMailMessage();
		
		message.setSubject("[Persfume] 이메일 인증 번호 입니다.");
		message.setText("인증번호 : " + random);
		message.setTo(email); // 보내는 사람이 한명이므로 String 타입
		
		
		System.out.println(message);
		
		mailSender.send(message);
		
		return "인증번호 발급 완료";
		*/
		
	}
	
	@ResponseBody
	@PostMapping(value="emailCheck.do", produces="text/html; charset=UTF-8")
	public String validate(String email, String checkNo) {
		
		 System.out.println(email);
		 System.out.println(checkNo);
		
		String result = "";
		
		if(certNoList.get(email).equals(checkNo)) {
			
			result = "인증 성공";
		
		} else {
			
			result = "인증 실패";
		}
		
		// 인증이 성공되든 실패되든 간에
		// 아까 발급받았던 인증번호는 무조건 삭제해야함!! (일회성이므로)
		certNoList.remove(email);
		
		System.out.println(certNoList);
		
		return result;
	}
	
	@GetMapping("login.fo")
	public String loginme() {
		
		return "member/loginForm";
		
	}
	
	@PostMapping("login.me")
	public ModelAndView loginMember(Member m,
							ModelAndView mv,
							HttpSession session,
							HttpServletResponse respons) {
		
		//System.out.println("잘 호출되나요!!!!");
		
		// System.out.println("이렇게 해도 넘어오나 ? : " + m.getMemId());
		
		
		Member loginMember = memberService.loginMember(m);
		
		//System.out.println(loginMember);
		
		if(loginMember != null && 
				
		bcryptPasswordEncoder.matches(m.getMemPwd(), loginMember.getMemPwd())) {
		// 로그인 성공
			 
		
		session.setAttribute("loginMember", loginMember);
			 
		session.setAttribute("alertMsg", "성공적으로 로그인이 되었습니다.");
	
	
		// 회원에게 부여할 쿠폰 먼저 발급
		memberService.makeCoupon();
		
		int memNo = loginMember.getMemNo();
		
		System.out.println("회원 번호를 잘 뽑아오나??"+ memNo);
		
		int resultC = memberService.insertCoupon(memNo);
		
		if(resultC > 0) {
			System.out.println("회원에게 쿠폰 발급 성공!");
		}else {
			System.out.println("회원에게 쿠폰 발급 실패!");
		}
		
		System.out.println("로그인 성공!!!");
			 
		mv.setViewName("redirect:/");
			 
		 }else {
			 
			 mv.addObject("errorMsg", "로그인 실패");
			 
			 mv.setViewName("common/errorPage"); 
		 }
		
		return mv;
		
	}
	

}
