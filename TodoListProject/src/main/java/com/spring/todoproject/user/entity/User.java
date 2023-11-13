package com.spring.todoproject.user.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
 CREATE TABLE users
(
	-- (영어 대,소)+ 숫자
	user_id varchar2(30) NOT NULL,
	-- 영어(대, 소)+숫자
	-- 최소길이: 8
	user_pw varchar2(30) NOT NULL,
	-- 한글이름만 받기.
	name varchar2(30) NOT NULL,
	-- 한글
	-- 영어: 대,소,특수문자(제한된특수문자제공)
	nickname varchar2(30) NOT NULL,
	email1 varchar2(30) NOT NULL,
	-- @뒤에 닷컴주소
	email2 varchar2(20) NOT NULL,
	profile_color varchar2(12) DEFAULT 'D9D9D9' NOT NULL,
	PRIMARY KEY (user_id)
);
 */

@Getter @Setter @ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {

	private String userId;
	private String userPw;
	private String name;
	private String nickName;
	private String email1;
	private String email2;
	private String profileColor;

}
