package com.spring.todoproject.login.mapper;

import org.apache.ibatis.annotations.Param;

public interface ILoginMapper {
	
	// 아이디 비밀번호가 DB에 있는지 확인
	String login(String userId);







	String naverlogintest(@Param("email1")String email1, @Param("email2") String email2);







	void naverlogininsert(@Param("userId") String userId,@Param("userPw") String userPw,
			@Param("name") String name,@Param("nickname") String nickname,
			@Param("email1") String email1 ,@Param("email2") String email2, String profile_color);


}
