package com.spring.todoproject.login.controller;



import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.todoproject.login.naver.NaverLoginRequestDTO;
import com.spring.todoproject.login.service.LoginService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/todok")
@RequiredArgsConstructor
@Slf4j
public class LoginController {

	private final LoginService service;
	private final ApiExamMemberProfile apiExamMemberProfile;
	
	
	@GetMapping("/login")
	public void login() {

	}
	
	
	@PostMapping("/login")
	public void login(String userId, String userPw, Model model, HttpSession session) {

		 
		 System.out.println("controller에 들어옴");
		 System.out.printf("아이디:" + userId);
		 System.out.printf("비밀번호:" + userPw);
		 model.addAttribute("result", service.login(userId, userPw));
		 String res = service.login(userId, userPw);
		 System.out.println(res);
		 
		 
		 
		 if(res == "Success") {
			 Object uesrId = userId;
			 session.setAttribute("userId", userId);
		 }


	}
	


    
    
    @PostMapping("/login/naver/{token}")
    public String tokenpass(@PathVariable String token, HttpSession session) {
    	System.out.println("access_token: " + token);
    	
    	Object naverturn = naver(apiExamMemberProfile.parseJsonData(token));
    	
		Object uesrIdset = naverturn;
    	session.setAttribute("userId", uesrIdset);
    	
    	Object userIdget = session.getAttribute("userId");
    	
    	return null;
    	
 
    }
    
    @GetMapping("/login/naver/{signal}")
    public String tokenpass(@PathVariable String signal, Model model) {
    	model.addAttribute("signal", signal);
    	System.out.println("signal 응답옴");

    	return "redirect:/main";
    }

    

    


	public Object naver(NaverLoginRequestDTO dto) {

		log.info(dto.toString());
		
				
		String naverDto = service.naverlogin(dto.getId(), dto.getToken(), dto.getName(), dto.getNickname(), dto.getEmail1(), dto.getEmail2(), dto.getProfile_color());

		return naverDto;
	}
	
	


    

    


	
}
