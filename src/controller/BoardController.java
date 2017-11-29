package controller;

import java.io.File;
import java.io.IOException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import service.BoardService;
import vo.BoardVO;
import vo.ReplyVO;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;

	@RequestMapping(value = "/board.do")
	public ModelAndView board(@RequestParam(defaultValue="1")int page,@RequestParam(defaultValue = "0") String searchType,
			@RequestParam(defaultValue = "0") String searchWrite) {
		ModelAndView mv = new ModelAndView();

		mv.addObject("boardPage", service.makeBoardPage(searchType,searchWrite,page));
		
//		mv.addObject("boardList", service.svBoardList(searchType, searchWrite));
		
		mv.setViewName("board_list");
		return mv;
	}
	
	/////////////////////////
	@RequestMapping("ajaxRead.do")
	public void ajaxRead(int boardNum, HttpServletResponse respons) {
		respons.setContentType("text/html;charset=utf-8");
		Gson gson = new Gson();
		try {
			respons.getWriter().write(gson.toJson(service.svReplyList(boardNum)));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/////////////////////////	
	
	

	@RequestMapping("/writeForm.do")
	public String writeForm() {
		return "write_form";
	}

	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public String write(BoardVO board, HttpSession session, HttpServletRequest req) {
		String loginId = (String) session.getAttribute("loginId");
		String uploadPath = req.getServletContext().getRealPath("img");
		File dir = new File(uploadPath);

		if (!dir.exists()) {
			dir.mkdir();
		}
		String savedName = new Random().nextInt(100) + board.getImg().getOriginalFilename();
		File savedFile = new File(uploadPath + "/" + savedName);

		try {
			board.getImg().transferTo(savedFile);
			// System.out.println("---------------");
			// System.out.println("���ε� �Ϸ�");
			// System.out.println("����� ���:" + savedFile.getAbsolutePath());
			System.out.println("�̰� �������Ѵ� : img/" + savedName);
			// System.out.println("---------------");
			savedName = "img/" + savedName;
			System.out.println("write.do���� ���� �������� �̸� : " + board.getImg().getOriginalFilename());
			if (board.getImg().getOriginalFilename().length() < 3) {
				savedName = "noImg";
			}
			board.setBoardImg(savedName);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		if (loginId != null && loginId.length() > 0) {
			service.svInsert(board, loginId);
			return "write_result";
		} else {
			return "no_login";
		}
	}

	@RequestMapping("/read.do")
	public ModelAndView read(int boardNum, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");
		service.svUpdateCount(boardNum, loginId);

		// ������
		BoardVO board = service.svSelect(boardNum);
		mv.addObject("board", board);
		mv.setViewName("read");
		return mv;
	}

	@RequestMapping(value = "/repleForm.do", method = RequestMethod.POST)
	public ModelAndView repleForm(BoardVO board, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		// ���� �ϱ������ �̹��� ���� ���������� ����Ѵ�
		BoardVO board2 = service.svSelect(board.getBoardNum());
		board.setBoardImg(board2.getBoardImg());
		///////////////////////////////////

		mv.addObject("board", board);
		mv.setViewName("reple_form");

		return mv;
	}

	@RequestMapping(value = "/repleWrite.do", method = RequestMethod.POST)
	public String repleWrite(BoardVO board, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		if (service.svInsertReple(board, loginId) >= 0) {
			return "reple_success";
		} else {
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
		if (service.svUpdate(board)) {
			mv.setViewName("update_success");
			return mv;
		} else {
			mv.setViewName("update_fail");
			return mv;
		}
	}

	@RequestMapping("/delete.do")
	public ModelAndView delete(int boardNum) {
		ModelAndView mv = new ModelAndView();
		BoardVO board = service.svSelect(boardNum);
		
		//������ �������� ��۵� ��ü ���� 
		System.out.println("delete.do�� ������ boardnum : " +boardNum);
		service.svReplyAllDelete(boardNum);
		int result = service.svDelete(board);

		mv.addObject("result", result);
		mv.setViewName("delete_result");
		return mv;
	}

	/**************** ������� ���� �۾� ************************/
	@RequestMapping(value = "/replyWrite.do", method = RequestMethod.POST)
	public void replyWrite(int boardNum, String re_contents, HttpSession session, HttpServletResponse response) {
		System.out.println("replyWrite.do���� re_contents : " + re_contents);
		String loginId = (String) session.getAttribute("loginId");
		ReplyVO reply = new ReplyVO();
		reply.setRe_contents(re_contents);
		try {
			response.getWriter().write(0);
		} catch (IOException e) {
			e.printStackTrace();
		}
		service.svReplyInsert(boardNum, reply, loginId);
	}

	@RequestMapping("/replyDelete.do")
	public void replyDelete(int replyNum, HttpSession session, HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		System.out.println("replyDelete.do �� ���� replyNum : " + replyNum);
		String loginId = (String) session.getAttribute("loginId");

		String result = "";
		ReplyVO reply = service.svReplySelect(replyNum);
		// �α��� ���ǰ� �� �ۼ��ڰ� ���ٸ� ���� ����
		if (reply.getRe_writer().equals(loginId)) {
			service.svReplyDelete(replyNum);
			result = "����";
		} else {
			result = "����";
		}
		try {
			response.getWriter().write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("replyRead.do")
	public void replyRead(int boardNum, HttpServletResponse respons) {
		respons.setContentType("text/html;charset=utf-8");
		Gson gson = new Gson();
		try {
			respons.getWriter().write(gson.toJson(service.svReplyList(boardNum)));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
