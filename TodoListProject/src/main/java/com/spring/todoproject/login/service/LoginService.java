package com.spring.todoproject.login.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.todoproject.login.dto.NaverLoginDTO;
import com.spring.todoproject.login.mapper.ILoginMapper;
import com.spring.todoproject.login.naver.NaverLoginReponseDTO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LoginService {

	@Autowired
	private final ILoginMapper mapper;

	private final BCryptPasswordEncoder encoder;

	public String login(String userId, String userPw) {
		System.out.println("아이디: " + userId);
		System.out.println("비번: " + userPw);
		String dbPw = mapper.login(userId);
		

		System.out.println(dbPw);
		if (dbPw != null) {
			System.out.println("아이디있음");
			//날것의 비밀번호와 암호화된 비밀번호의 일치 여부를 알려주는 matches()
			if(encoder.matches(userPw, dbPw)) {
				System.out.println("유효성검사 비밀번호 맞음");
				return "Success";
			} else {
				System.out.println("유효성검사 비밀번호 틀림");
				return "Fail";
			}
		} else {

			return "데이터가 안옴";
		}

	}

	public String naverlogin(String userId, String userPw, String name, String nickname, String email1, String email2, String profile_color) {
		/*
		 * dto.getId(), dto.getToken(), dto.getName(), dto.getNickname(), dto.getEmail()
		 */

		System.out.println("naverlogin 서비스에 들어옴");
		
		NaverLoginReponseDTO dto = new NaverLoginReponseDTO();


		String naverUserId = mapper.naverlogintest(email1, email2);

		
		if(naverUserId != null) { 
			System.out.println("네이버아이디 있음");
		} else { 
			mapper.naverlogininsert(userId, userPw, name, nickname, email1, email2, profile_color);
			System.out.println("네이버아이디 만듦");
		}
		
		return naverUserId;

	}

}
