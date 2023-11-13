package com.spring.todoproject.main.mapper;

import java.util.List;

import com.spring.todoproject.main.dto.MostLikeRecomdResponseDTO;
import com.spring.todoproject.main.dto.TodoRequestDTO;
import com.spring.todoproject.main.entity.Todo;

public interface IMainMapper {

	
	// 가장 많은 좋아요를 받은 추천 board_bno 3개 추출
	List<MostLikeRecomdResponseDTO> mostLikeBno ();

	// 매개값으로 받은 board_bno의 사용자의 프로필컬러 hex, bno, user_id, board_content 값 받아오기
	MostLikeRecomdResponseDTO getMostLikeData (int boardBno);

	// 매개값으로 받은 userId 유저의 닉네임을 추출
	String getNickname(String userId);

	// todo테이블에 화면단에 입력된 todo 추가
	void insertMyTodo(Todo entity);

	// 화면단에 뿌릴 todo 데이터에 input type="hidden" 에 저장해놓을 todo_no를 받기위한 로직
	// insertMyTodo 직후에 반드시 호출하여 가장 최근 시퀀스값을 가져올 것.
	String getlastTodoNo();

	// 화면 단의 todo의 checked 값을 동기화(checked=true=1)
	void updateMyTodoChkO(Todo entity);

	// 화면 단의 todo의 checked 값을 동기화(checked=false=0)
	void updateMyTodoChkX(Todo entity);

	// Date와 userId 에 해당하는 모든 todo리스트 가져옴
	List<Todo> getTodoOfDate(Todo entity);

	// 투두 삭제
	void deleteTodo(TodoRequestDTO dto);
	
	

}
