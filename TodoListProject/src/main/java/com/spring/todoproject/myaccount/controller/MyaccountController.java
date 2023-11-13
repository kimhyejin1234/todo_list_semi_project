package com.spring.todoproject.myaccount.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.spring.todoproject.main.service.MainService;
import com.spring.todoproject.myaccount.dto.MyacntUpdRequestDTO;
import com.spring.todoproject.myaccount.dto.ProfBoxDTO;
import com.spring.todoproject.myaccount.dto.UserInfoResponseDTO;
import com.spring.todoproject.myaccount.service.MyaccountService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/myaccount")
@RequiredArgsConstructor
@Slf4j
public class MyaccountController {
	
	@Autowired
	private final MyaccountService service;
	
	
	@GetMapping("")
	public ModelAndView goMyaccount(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		// 세션에 담긴 로그인 정보를 통해 유저아이디를 가져올 것.
		String userId = (String) session.getAttribute("userId");
		
		//String userId = "id5";
		
		// 프로필 박스에 필요한 값을 "profBox" 라는 이름으로 담음
		ProfBoxDTO dto1 = service.getProfInfo(userId);
		mv.addObject("profBox", dto1);
		
		// 상세정보에 필요한 값을 ""라는 이름으로 담음
		UserInfoResponseDTO dto2 = service.getUserInfo(userId);
		mv.addObject("userInfo", dto2);
		
		mv.setViewName("/todok/myaccount");
		return mv;
	}
	
	
	@PostMapping("/update")
	public String updateAccount(MyacntUpdRequestDTO dto) {
		System.out.println(dto);
		service.updateAccount(dto);
		log.info("컨트롤러 완료~");
		
		return "redirect:/myaccount";
	}
	
	
	
	

	

}


