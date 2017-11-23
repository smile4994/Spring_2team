package controller;

import java.awt.BorderLayout;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.BoardService;
import vo.BoardVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;
	
	@RequestMapping("/board.do")
	public ModelAndView board() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardList", service.svBoardList());
		mv.setViewName("board_list");
		return mv;
	}
	
	@RequestMapping("/writeForm.do")
	public String writeForm() {
		return "write_form";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String write(BoardVO board, HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		if(loginId!=null && loginId.length()>0) {
			service.svInsert(board, loginId);
			return "write_result";
		}else {
			return "no_login";
		}
	}
	
	@RequestMapping("/read.do")
	public ModelAndView read(int boardNum, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String loginId = (String)session.getAttribute("loginId");
		service.svUpdateCount(boardNum, loginId);
		BoardVO board = service.svSelect(boardNum);
		
		mv.addObject("board",board);
		mv.setViewName("read");
		return mv;
	}
	
	@RequestMapping("/repleForm.do")
	public ModelAndView repleForm(int boardNum, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		BoardVO board = service.svSelect(boardNum);
		mv.addObject("board",board);
		mv.setViewName("reple_form");
		return mv;
	}
	
	@RequestMapping(value="/replyWrite.do", method=RequestMethod.POST)
	public String repleWrite(BoardVO board, HttpSession session) {
		String loginId = (String)session.getAttribute("loginId");
		if(service.svInsertReple(board, loginId) >= 0 ){
			return "reple_success";
		}else {
			return "reple_fail";
		}
	}
	
	@RequestMapping("/updateForm.do")
	public ModelAndView update(int boardNum) {
		ModelAndView mv = new ModelAndView();
		BoardVO board = service.svSelect(boardNum);
		mv.addObject("board", board);
		mv.setViewName("update_form");
		return mv;
	}
	
	@RequestMapping("/updateWrite.do")
	public ModelAndView updateWrite(BoardVO board) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardNum", board.getBoardNum());
		if(service.svUpdate(board)) {
			mv.setViewName("update_success");
			return mv;
		}else {
			mv.setViewName("update_fail");
			return mv;
		}
	}
	
	@RequestMapping("/delete.do")
	public ModelAndView delete(int boardNum) {
		ModelAndView mv = new ModelAndView();
		BoardVO board = service.svSelect(boardNum);
		int result = service.svDelete(board);
		
		mv.addObject("result", result);
		mv.setViewName("delete_result");
		return mv;
	}
	
}
