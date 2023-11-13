package com.spring.todoproject.login.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString @EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NaverLoginDTO {
	
	private String id;
	private String tokenpw;
	private String name;
	private String nickname;
	private String email1;
	private String email2;

}



