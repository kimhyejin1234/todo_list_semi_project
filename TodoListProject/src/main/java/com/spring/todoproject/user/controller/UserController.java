package com.spring.todoproject.user.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.todoproject.user.dto.UserInsertInfoRequestDTO;
import com.spring.todoproject.user.service.IUserService;
import com.spring.todoproject.util.MailSenderService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/todok")
@RequiredArgsConstructor
public class UserController {
	
	@Autowired
	private final IUserService service;
	private final MailSenderService mailService;
	
	//회원가입 페이지로 이동
	@GetMapping("/join")
	public void UserJoin() {}
	
	//아이디 중복확인(비동기)
	@GetMapping("/id/{account}")  
	@ResponseBody 
	public String idCheck(@PathVariable String account) {
		System.out.println("클라이언트로 부터 전달된 아이디: " + account);
		int result = service.idCheck(account);
		if(result == 1)return "duplicated"; //리턴된 아이디 수 가 있다면 1("duplicated") 없으면 0("ok")
		else return "ok";
	}
	
	//이메일 인증
	@PostMapping("/email")
	@ResponseBody
	public String mailCheck(@RequestBody String email) {
		System.out.println("이메일 인증 요청 들어옴" + email);
		mailService.joinEamil(email); 
		return mailService.joinEamil(email);
	}
	
	
	// @RequestMapping(value = "/test1", method = RequestMethod.GET)
	@PostMapping("/join")
	public String insertUserDate(HttpServletRequest request, Model model, UserInsertInfoRequestDTO dto) {
		// service.insertUserData();
		
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");
		String name = request.getParameter("name");
		String nickName = request.getParameter("nickName");
		String email1= request.getParameter("email1");
		String email2 = request.getParameter("email2");
//		System.out.println("�엯�젰�븳 id媛�" + id);
		
		dto.setUserId(id);
		dto.setUserPw(pw);
		dto.setName(name);
		dto.setNickName(nickName);
		dto.setEmail1(email1);
		dto.setEmail2(email2);
		
		service.insertUserData(dto);
		
		return "redirect:/main";
	}
	
	
	
	
}