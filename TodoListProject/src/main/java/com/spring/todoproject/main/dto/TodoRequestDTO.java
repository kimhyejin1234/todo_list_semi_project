package com.spring.todoproject.main.dto;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter @ToString @EqualsAndHashCode
@NoArgsConstructor @AllArgsConstructor
public class TodoRequestDTO {

	private int todoNo;
	private String userId;
	private String clickDate;
	private String todoContent;
	private boolean chkBtn;	
	
}
