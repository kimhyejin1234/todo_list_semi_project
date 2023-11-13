package com.spring.todoproject.myaccount.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.todoproject.main.mapper.IMainMapper;
import com.spring.todoproject.main.service.MainService;
import com.spring.todoproject.myaccount.dto.MyacntUpdRequestDTO;
import com.spring.todoproject.myaccount.dto.ProfBoxDTO;
import com.spring.todoproject.myaccount.dto.UserInfoResponseDTO;
import com.spring.todoproject.myaccount.entity.Users;
import com.spring.todoproject.myaccount.mapper.IMyaccountMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class MyaccountService {

	@Autowired
	private final IMyaccountMapper mapper;

	// 프로필 박스에 필요한 값을 받아옴
	public ProfBoxDTO getProfInfo(String userId) {
		ProfBoxDTO dto = mapper.getProfInfo(userId);
		dto.setBoardLikeCnt(mapper.getBoardLikeCnt(userId));
		
		return dto;
	}

	// 유저상세정보에 필요한 값을 받아옴
	public UserInfoResponseDTO getUserInfo(String userId) {
		Users entity = mapper.getUserInfo(userId);
		String email = entity.getEmail1() + entity.getEmail2();
		
		UserInfoResponseDTO dto = UserInfoResponseDTO.builder()
				.userId(entity.getUserId())
				.userPw(entity.getUserPw())
				.name(entity.getName())
				.nickName(entity.getNickName())
				.email(email)
				.profileColor(entity.getProfileColor())
				.build();
		return dto;
	}

	// 유저정보 수정
	public void updateAccount(MyacntUpdRequestDTO dto) {
		if(dto.getUserPw().equals("")) {
			log.info("닉네임만 교체!");
			dto.setProfileColor(dto.getProfileColor().substring(1));
			mapper.updateNick(dto);
		} else {
			log.info("비밀번호도 함께 교체!");
			dto.setProfileColor(dto.getProfileColor().substring(1));
			mapper.updateNickPw(dto);
		}
		
	}
	
	
}
