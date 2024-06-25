package com.mata.persfume.member.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
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
import com.mata.persfume.member.model.vo.PWDmember;
import com.mata.persfume.oneClass.model.vo.OneClass;
import com.mata.persfume.oneClass.model.vo.OneClassRegist;
import com.mata.persfume.product.model.service.ProductService;
import com.mata.persfume.product.model.vo.Coupon;
import com.mata.persfume.product.model.vo.Favorites;
import com.mata.persfume.product.model.vo.MemCoupon;
import com.mata.persfume.product.model.vo.OrderDetail;
import com.mata.persfume.product.model.vo.OrderProduct;
import com.mata.persfume.product.model.vo.Product;
import com.mata.persfume.product.model.vo.ProductImg;
import com.mata.persfume.product.model.vo.ProductReview;

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
	
	@Autowired
	private ProductService productService;
	
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
			session.setAttribute("alertMsg", "반갑습니다 " + m.getMemName() +" 님");
			
			int memNo = m.getMemNo();
			
			int resultCo = memberService.insertCoupon(memNo);
			
			if(resultCo > 0) {
				
				System.out.println("쿠폰 발급 성공!");
				
				
			}else{
				System.out.println("쿠폰 발급 실패!");
			}
			
			
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
		
		
		mimeMessageHelper.setFrom("persfume2024@gmail.com");
		// 발신자 이메일 주소-
		
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
		
	} // sendMail fin.
	
	
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
		
	} // loginme fin.
	
	@PostMapping("login.me")
	public ModelAndView loginMember(Member m,
							ModelAndView mv,
							String saveId,
							HttpSession session,
							HttpServletResponse response) {
		
		//System.out.println("잘 호출되나요!!!!");
		
		// System.out.println("이렇게 해도 넘어오나 ? : " + m.getMemId());
		
			System.out.println("체크한거 잘 넘어오나? : " + saveId);
		
		// 아이디 저장 로직 추가
		if(saveId != null && saveId.equals("y")) {
					// 로그인 요청 시 아이디를 저장하겠다.
					
					// saveId 라는 키 값으로 현재 아이디값을 쿠키로 저장
					Cookie cookie = new Cookie("saveId",m.getMemId());
					
					System.out.println("저장할 아이디 값 잘 넘어오나? : " + m.getMemId());
					
					// 유효기간 1일 
					cookie.setMaxAge(1 * 24 * 60 * 60); // 초단위로 작성 
					// 2일이면  cookie.setMaxAge(2 * 24 * 60 * 60)
					// 3일이면  cookie.setMaxAge(3 * 24 * 60 * 60)
					
					// 만들어진 Cookie 객체를 response 에 첨부
					 response.addCookie(cookie);
				}else {
					// 아이디를 저장하지 않겠다.
					// 삭제 구문 따로 X 동일한 키값으로 덮어씌우기
					// 유효기간을 0초로 지정하면 됨
					Cookie cookie = new Cookie("saveId" , m.getMemId());
					
					cookie.setMaxAge(0);
					
					response.addCookie(cookie);
					
		}
		
		Member loginMember = memberService.loginMember(m);
		
		//System.out.println(loginMember);
		
		if(loginMember != null && 
				
		bcryptPasswordEncoder.matches(m.getMemPwd(), loginMember.getMemPwd())) {
		// 로그인 성공
			 
		
		session.setAttribute("loginMember", loginMember);
			 
		session.setAttribute("alertMsg", "성공적으로 로그인이 되었습니다.");
	
		
		System.out.println("로그인 성공!!!");
			 
		mv.setViewName("redirect:/");
			 
		 }else {
			 
			 mv.addObject("errorMsg", "로그인 실패");
			 
			 mv.setViewName("common/errorPage"); 
		 }
		
		return mv;
		
	}// loginMember fin.
	
	
	@GetMapping("logout.me")
	public ModelAndView logoutMember(HttpSession session,
				 			ModelAndView mv) {
		
//		System.out.println("로그아웃 잘 호출 되나?!");
		
		session.removeAttribute("loginMember");
		
		session.setAttribute("alertMsg", "성공적으로 로그아웃 되었습니다.");
		
		mv.setViewName("redirect:/");
		
		System.out.println("로그아웃 잘 되나?!");
		
		return mv;
		
	} // logoutMember fin.

	@GetMapping("myPage.me")
	public String myPage(){
		
		return "member/myPage";
		
	}//myPage fin.
	
	@GetMapping("delete.fo")
	public String deleteFo() {
		
		return "member/deleteMember";
	}// deleteMe fin.
	
	@PostMapping("delete.me")
	public ModelAndView deleteMember(Member m,
							String CheckPwd,
							String memId,
							String memPwd,
							HttpSession session,
				 			ModelAndView mv) {
		
		/*
		System.out.println("회원 탈퇴 잘 호출되나??");
		
		System.out.println("회원이 입력한 비밀번호 : " + CheckPwd);
		
		System.out.println("현재 탈퇴를 원하는 회원의 아이디 " + memId);
		
		System.out.println("현재 탈퇴를 원하는 회원의 비밀번호 " + memPwd);
		*/
		
		// 비밀번호를 잘 입력했는지 아닌지 부터 확인해야함
		if(bcryptPasswordEncoder.matches(CheckPwd, memPwd)) {
			// 알맞게 입력
			
			int result = memberService.deleteMember(m);
			
			if(result > 0) {// 탈퇴 성공
				
				System.out.println("탈퇴 성공");
				
				session.setAttribute("alertMsg", "탈퇴가 완료되었습니다. 꼭 다시 뵙길 바랍니다.");
				
				session.removeAttribute("loginMember");
				
				mv.setViewName("main");
				
			}else {// 탈퇴 실패 
				System.out.println("탈퇴 실패");
				
				session.setAttribute("alertMsg", "탈퇴에 실패했습니다. 다시 시도해주세요");
				
				mv.setViewName("member/deleteMember");
			}
			
		}else {
			// 틀리게 입력 할 시 틀렸다고 알람만 띄워주기
			
			System.out.println("비밀번호 틀렸습니다.");
			
			session.setAttribute("alertMsg", "비밀번호가 틀렸습니다. 다시 입력해주세요");
			
			mv.setViewName("member/deleteMember");
			
		}
		

			return mv;
		
		
	}

	
	@PostMapping("update.me")
	public String updateMember(Member m,
							HttpSession session,
							Model model) {
		
//		System.out.println("회원정보 수정 잘 호출되나?!");
		
		 int result =  memberService.updateMember(m);
		 
		 System.out.println(m.getGender());
		 
		 if(result > 0) {

				Member updateMember = memberService.loginMember(m);
				
				session.setAttribute("loginMember", updateMember);
				
				session.setAttribute("alertMsg", "회원정보가 수정되었습니다.");

				return "redirect:/myPage.me";
				
				
			}else { 
				model.addAttribute("errorMsg","회원정보 수정 실패, 다시 시도 해주세요");			
				
				return "common/errorPage";
				
			}
		 
	}// updateMember fin.
	
	@GetMapping("findId.me")
	public String findId() {
	
		System.out.println("아이디 찾기 폼 잘 호출 되나?");
		
		return "member/findId";
		
	}
	
	@PostMapping("IDfind.me")
	public String IDfind(String email,
					   HttpSession session){
		
		System.out.println("아이디 찾기 잘 호출 되나?!");
		
		System.out.println("사용자가 입력한 이메일 잘 끌어오나? " + email);
		
		String result = memberService.IDfind(email);
		
		System.out.println("아이디 찾기 성공했나 ? : " + result );
		
		session.setAttribute("ID", result);
		
		return "redirect:/findId.me";
	}
	
	@GetMapping("findPwd.me")
	public String findPwd() {
		System.out.println("비밀번호 찾기 폼 잘 호출되나?");
		
		return "member/findPwd";
	}
	
	
	public String sendPWD(String email) throws MessagingException{
		
		// 임시 비밀번호 생성 10자리 
		String randomString = RandomStringUtils.randomAlphanumeric(10);
		
		// 발급한 인증번호를 사용자에게 그냥 넘기는게 아니라
		// MEMEBR 테이블의 비밀번호 값을 임시 비밀번호로 바꿔주어야한다
		
		// 입력받은 이메일과 임시 비밀번호를 객체 하나로 가공 후 서비스단으로 넘기기 
		PWDmember pm1 = new PWDmember();
		
		pm1.setEmail(email);
		
		// 비밀번호 암호화
		String randomPwd = bcryptPasswordEncoder.encode(randomString);
		// 임시 비밀번호를 암호화해서 randomPwd 에 담는다
		
		pm1.setRandomPwd(randomPwd);
		// 암호화한 임시 비밀번호를 객체에 담아서
		
		memberService.sendPWD(pm1);
		// 서비스단으로 넘긴다 
	
		MimeMessage message = mailSender.createMimeMessage();
		
		
		MimeMessageHelper mimeMessageHelper
		= new MimeMessageHelper(message, true, "UTF-8");
		
		
		mimeMessageHelper.setTo(email);
		// 입력 받은 이메일로 설정
		
		mimeMessageHelper.setFrom("persfume2024@gmail.com");
		// 발신자 이메일 주소-
		
		// 제목
		mimeMessageHelper.setSubject("[Persfume] 임시 비밀번호 입니다");
		
		// 내용
		mimeMessageHelper.setText("<h1>[Persfume] 임시 비밀번호 입니다.</h1>"
				+ "<br>"
				+ "<div>"
				+ "<h3>"
				+ "로그인 화면으로 돌아가 아래의 임시비밀번호로 로그인 후 비밀번호를 변경해주세요"
				+ "</h3>"
				+ "<p> 임시비밀번호 : "+ randomString +"</p>"
				+ "</div>", true);
		
		// 메세지 전송
		mailSender.send(message);
		
		
		return "임시 비밀번호 전송 성공!!";

		
	} // sendPWD fin.
	
	@PostMapping("PWDfind.me")
	public String PWDfind(String ID,
						String email,
						HttpSession session) throws MessagingException {
		
		// 최종 결과값을 담을 변수 설정 
		
		System.out.println("비밀번호 찾기 잘 호출되나?!");
		
		System.out.println("사용자가 입력한 아이디 잘 끌어오나? : " + ID );
		
		// id 가 유효한 아이디 인지 체크
		int result1 = memberService.selectId(ID);
		
		if(result1 > 0) {// 아이디가 유효함
			
			// 입력한 이메일이 아이디에 맞는 이메일인지 확인하기
			String result2 = memberService.IDfind(email);
			
			System.out.println("이메일로 찾은 아이디는 ? " + result2);
			
			if(ID.contentEquals(result2)) {
				// 입력한 아이디와 이메일로 DB에서 찾은 아이디가 동일하다면 임시비밀번호 전송
				sendPWD(email);
				
				session.setAttribute("alertMsg", "임시비밀번호를 전송하였습니다.");
				
				return "member/loginForm";
			}else {
				// 아니라면 알람창 띄우고 돌아가기 
				 System.out.println("입력한 아이디와 이메일이 맞지 않습니다!");
				 
				session.setAttribute("alertMsg", "입력한 아이디와 이메일이 맞지 않습니다!");
				 
				return "redirect:/findPwd";
			}
			
		}else { // 유효하지 않음
			
			 System.out.println("아이디가 없는 아이디인디요?");
			 
			 session.setAttribute("alertMsg", "이 아이디는 없는 아이디 입니다");
			 
			 return "redirect:/findPwd";
		}
		
		
		
	}
	
	@GetMapping(value="updatePwd.fo")
	public String updatePwdForm() {
		
		return "member/updatePwd";
		
	}
	
	@PostMapping(value="updatePwd.me")
	public String updatePwd(PWDmember pm, HttpSession session) {
		
		System.out.println("비밀번호 변경 잘 호출되나?");
		
		System.out.println("회원번호도 잘 끌어오나? " + pm.getMemNo());
		
		System.out.println("회원이 입력한 새로운 비밀번호도 ? " + pm.getNewPwd());
		
		System.out.println("회원이 받았던 임시 비밀번호는 ? " + pm.getRandomPwd());
		
		System.out.println("현재 DB에 저장되어있는 비밀번호는 뭐야 ? " + pm.getMemPwd());
		
		// 사용자가 입력한 현재 비밀번호가 맞는지 확인 
		if(bcryptPasswordEncoder.matches(pm.getRandomPwd(),pm.getMemPwd())) {
			// 맞으면  새로 입력한 비밀번호로 변경해주기
			// 암호화 필수!
			System.out.println("너가 맞구나?!");
			
			
			// 비밀번호 암호화
			String newPwd = bcryptPasswordEncoder.encode(pm.getNewPwd());
			// 사용자가 입력한 새로운 비밀번호를 암호화해서 encPwd 에 담는다
			
			pm.setNewPwd(newPwd);
			// pm 객체에 암호화된 새로운비밀번호로 세팅한다
			
			// 이 pm 객체를 서비스단으로 넘겨준다 
			int result = memberService.updatePwd(pm);
			
			if(result > 0) {
				// 비밀번호 변경 성공
					
				System.out.println("비번 변경 성공!!");
				
				session.removeAttribute("loginMember");
				session.setAttribute("alertMsg", "비밀번호가 변경되었습니다. 다시 로그인 해주세요");
				 	
				return "redirect:/";
				
			}else {
				// 실패
				System.out.println("비번 변경 실패!!");
				
				return "member/updatePwd";
			}
			
			
		}else {
			// 틀리면
			System.out.println("너 누구여?!");
			
			return "member/updatePwd";
		}
		
		
	}
	

	
//	여기서부터 조회 관련 
	
	@PostMapping(value="myClass.me")
	public String myClass(int memNo, Model model) throws ParseException {
		
		System.out.println("클래스 예약 조회 잘 호출 되나??");
		
		System.out.println("현재 로그인한 회원의 회원번호도 잘 끌어오나?" + memNo);
		 
		ArrayList<OneClassRegist> registlist =  memberService.selectClass(memNo);
		 
		model.addAttribute("registlist", registlist); // Model에 list를  attribute로 설정
		
		System.out.println(registlist);
			
		// 예약한 클래스에 대한 정보
		ArrayList<OneClass> classList =  memberService.selectClassAbout(registlist);
		System.out.println(classList);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yy/MM/dd");
		
		
		for(int i = 0; i < classList.size(); i++) {
			Date startDate = dateFormat.parse(classList.get(i).getStartTime());
			
			System.out.println(startDate + " / " + startDate.after(new Date()));
			
			if(startDate.after(new Date())) {
				classList.get(i).setIsFuture("Y");
			} else {
				classList.get(i).setIsFuture("N");
			}
		}
		
		
		model.addAttribute("classList", classList); // Model에 list를  attribute로 설정
		
		System.out.println(classList);
			
		return "member/myClass";
	}
	
	@PostMapping("cansle.me")
	public void cansle(int registNo) {
		
		System.out.println("클래스 에약 취소 컨트롤러로 예약번호 잘 끌어오나?? " + registNo);
	}
	
	
	@PostMapping(value="myReview.me")
	public String myReview(int memNo, Model model){
		
		 System.out.println("리뷰 폼 잘 호출 되나??");
		 
		 System.out.println("현재 로그인한 회원의 회원번호도 잘 끌어오나?" + memNo);

		
		// 1. 세션의 memNo 으로 회원이 쓴 리뷰 색출
		// 2. 리뷰 테이블의 productNo 으로 리뷰를 누르면 해당 리뷰로 갈 수 있게 쏘기
		// 3. 리뷰 제목, 리뷰 내용 정도만 보여주기 
			
		ArrayList<ProductReview> relist = productService.myReview(memNo);
		
		
		
		model.addAttribute("relist", relist);
		
		
		return "member/myReview";
	
}
	
	
	@PostMapping("myLike.me")
	public String myLike(int memNo, Model model){
		
//		 System.out.println("좋아요 폼 잘 호출 되나??");
		
		System.out.println("현재 로그인한 회원의 회원번호도 잘 끌어오나?" + memNo);
		
		ArrayList<Favorites> flist =  productService.myFavoriteList(memNo);
		System.out.println(flist);
		
		ArrayList<ProductImg> pilist = new ArrayList<>();
		ArrayList<Product> plist = new ArrayList<>();
		ArrayList<Favorites> falist = new ArrayList<>();
		
		for(int i =0 ; i<flist.size() ; i++) {
			System.out.println(i+"번째 반복중");
			
			ProductImg pi = productService.selectProductImg(flist.get(i).getProductNo());
			pilist.add(pi);
			
			System.out.println("A");
			
			Product p = productService.selectProduct(flist.get(i).getProductNo());
			System.out.println(flist.get(i).getProductNo());
			plist.add(p);
			
			System.out.println("B");

		}
		
		
		model.addAttribute("plist", plist); // Model에 list를  attribute로 설정
		model.addAttribute("pilist", pilist); // Model에 list를  attribute로 설정
		model.addAttribute("flist", flist); // Model에 list를  attribute로 설정
		
		return "member/myLike";
		
		
		
		
	}
	
	@PostMapping("myOrder.me")
	public String myOrder(int memNo, Model model){
		
//		 System.out.println("주문목록 폼 잘 호출 되나??");
		
		System.out.println("현재 로그인한 회원의 회원번호도 잘 끌어오나?" + memNo);
		
		ArrayList<OrderDetail> odlist = productService.selectOrderDetail(memNo);
		
		
		ArrayList<OrderProduct> oplist = new ArrayList<>();
		ArrayList<OrderProduct> oplist2 = new ArrayList<>();
		ArrayList<Product> plist = new ArrayList<>();
		ArrayList<ProductReview> relist = new ArrayList<>();
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
		ProductReview re = productService.selectReview(oplist.get(i).getOdId());
		relist.add(re);
		}
		model.addAttribute("relist", relist);
		model.addAttribute("odlist", odlist);
		model.addAttribute("oplist", oplist);
		model.addAttribute("plist", plist);
		
		return "member/myOrder";
		
		
		
	}
	
	
	@ResponseBody
	@PostMapping(value="visitcnt.me", produces="text/html; charset=UTF-8")
	public String insertVisitCount() {
		
		Date today = new Date(System.currentTimeMillis());
		
		String result = String.valueOf(memberService.insertVisitCount(today));		
		return result;
		
	}
	
	@PostMapping("myCoupon.me")
	public String myCoupon(int memNo, Model model) {
		
		
		ArrayList<MemCoupon> clist = productService.myCoupon(memNo);
		System.out.println(clist);
		
		ArrayList<Coupon> cclist = new ArrayList<>();
		
		for(int i = 0 ; i<clist.size() ; i++) {
			Coupon c = productService.CouponName(clist.get(i).getCouponNo());
			cclist.add(c);
		}
		
		model.addAttribute("clist", clist);
		model.addAttribute("cclist", cclist);
		System.out.println(cclist);
		
		return "member/myCoupon";
	
	}
	
	
	
	

}
