package com.mata.persfume.member.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mata.persfume.member.model.service.MemberService;
import com.mata.persfume.member.model.vo.Member;

@Controller
public class MemberController {
	
	// 비밀번호 암호화를 위한 Autowired 설정
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private MemberService memberService;
	
	// 인증번호를 담아둘 해시맵 생성 (전역변수)
	// key : 인증할 email 주소, value : 인증번호
	// 단, 동기화 문제 때문에 동기화 기능을 제공하게끔 객체를 생성할 것
	// (동시에 여러 사람이 인증 요청을 보냈을 경우 인증번호를 동시에 put 할 수 있게끔)
	private Map<String, String> certNoList 
					= Collections.synchronizedMap(new HashMap<>());
	// 참고)
	// 만약에 인증 시 제한시간을 걸고싶다면?
	// > CERT 테이블 (EMAIL, CERT_NO, CREATE_DATE) 생성 후

	
	@GetMapping("enroll.me")
	public String memberEnrollform() {
		
		return "member/memberEnrollform";
		
	}
	
	@ResponseBody
	@GetMapping(value="idCheck.me", produces ="text/html; charset=UTF-8")
	public String idCheck(String checkId) {
		
		int count = memberService.idCheck(checkId);
		
		if(count > 0) { //있는 아이디
			
			return "NNNNN";
			
		}else { // 없는 아이디
			
			return "NNNNY";
		}
	
	}
	
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
		
	} 

}
