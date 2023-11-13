package com.spring.todoproject.login.naver;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@Builder
public class NaverLoginRequestDTO {
	
//  sendData(id, nickname, email, name, token);

	private String id;
	private String nickname;
	private String email1;
	private String email2;
	private String name;
	private String token;
	private String profile_color;
	
	
}
