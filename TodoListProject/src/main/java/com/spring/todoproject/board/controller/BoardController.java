package com.spring.todoproject.board.controller;



import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.spring.todoproject.board.dto.BoardLikeCountResponseDTO;
import com.spring.todoproject.board.dto.BoardListRequestDTO;
import com.spring.todoproject.board.dto.BoardRequestDTO;
import com.spring.todoproject.board.service.IBoardService;
import com.spring.todoproject.user.entity.User;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController //이걸 사용하려면 , ModelAndView 를 사용해야 화면이 보인다.
@RequestMapping("/board")
@RequiredArgsConstructor
@Slf4j
public class BoardController {
	
	@Autowired
	private final IBoardService service;
	
	//글쓰기 페이지를 열어주는 메서드
	@GetMapping("")
	public ModelAndView boardList(HttpSession session) {		
		ModelAndView mv = new ModelAndView();
		// 세션에 담긴 로그인 정보를 통해 유저아이디를 가져올 것.
		//String userId = (String) session.getAttribute("login");
		//test 를 위해
		session.setAttribute("login","abc1234");
		mv.setViewName("todok/board");
		System.out.println("test 를 위한 session data : " + session);
		return mv;
	}
	
	//글 등록 처리
	@PostMapping("/regist")
	public String regist(BoardRequestDTO dto) {

		service.boardRegist(dto);
		return "insertSuccess";		
	}
	
	//보드에 등록된 글 모두 가져온다
	@PostMapping("/getList") 
	public List<BoardListRequestDTO> getList(@RequestBody Map<String,String> params) {
		
		System.out.println("입력값  SELECT NUM !!!!! : " + params.get("selectNum"));
		return service.getList(params);	
	}
	
	// 닉네임 가져오기
	@PostMapping("/getNickName/{userId}")
	public User getNickName(@PathVariable String userId) {
		log.info("userId: {}", userId);
		
		
		User nickname = service.getNickName(userId);
		
		log.info("nickname: {}", nickname);
		
		return nickname;
		
	}
	
	//likeFlag + bno 받는 메서드
	@PostMapping("/likeupdate")
	public BoardLikeCountResponseDTO likeUpdate(@RequestBody Map<String, Object> params) {
		
		String userId = (String) params.get("userId");
		String likeFlag = (String) params.get("likeFlag");
		String boardBno = (String) params.get("boardBno");
		log.info(boardBno);
		
		
		return service.likeUpdate(userId, likeFlag, boardBno);
	}
	

}
