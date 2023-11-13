package com.spring.todoproject.main.entity;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import com.spring.todoproject.main.dto.TodoRequestDTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
@Builder
public class Todo {
	
	private int todoNo;
	private String userId;
	private LocalDate clickDate;
	private String todoContent;
	// NullPointerException 방지를 위한 디폴트값 초기화
	private int chkBtn = 0; // 생각해보니까 생성되지도 않아서 이 값은 존재하지도 않음
	
	public Todo(TodoRequestDTO reqDto) {
		this.todoNo = 0;
		this.userId = reqDto.getUserId();
		this.clickDate = strToDate(reqDto.getClickDate());
		this.todoContent = reqDto.getTodoContent();
	}
	
	// todoUpdate 시 사용할 생성자
	public Todo(TodoRequestDTO reqDto, boolean chkBtn) {
		this.todoNo = reqDto.getTodoNo();
		this.chkBtn = boolToInt(reqDto.isChkBtn());
	}
	
	// getTodoOfDate 시 사용할 생성자
	public Todo(String userId, String clickDate) {
		this.userId = userId;
		this.clickDate = strToDate(clickDate);
	}
	
	
	private LocalDate strToDate(String strDate) {
	
		DateTimeFormatter fmt;
		if(strDate.indexOf("월") == 8) {
			if(strDate.indexOf("일") == 12) {fmt = DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");}
			else {fmt = DateTimeFormatter.ofPattern("yyyy년 MM월 d일");}
		}else {
			if(strDate.indexOf("일") == 11) {fmt = DateTimeFormatter.ofPattern("yyyy년 M월 dd일");}
			else {fmt = DateTimeFormatter.ofPattern("yyyy년 M월 d일");}
		}
		
        LocalDate ldt = LocalDate.parse(strDate, fmt);
        return ldt;
	}	
	
	private int boolToInt(boolean chkBtn) {
		return chkBtn ? 1: 0;
	}
}
