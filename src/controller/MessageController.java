package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.MessageService;
import vo.MessageVO;

@Controller
public class MessageController {
	@Autowired
	private MessageService service;

	@RequestMapping(value = "/messageSend.do", method = RequestMethod.POST)
	public void send(String receiver, String content, HttpSession session, HttpServletResponse response) {
		String loginId = (String) session.getAttribute("loginId");
		String result = "";
		if (service.send(receiver, content, loginId) > 0) {
			result = "성공";
		} else {
			result = "실패";
		}
		try {
			response.getWriter().write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("messageList.do")
	public ModelAndView list(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");
		if (loginId.length() > 0 && loginId != null) {
			List<MessageVO> messageList = service.list(loginId);
			mv.addObject("messageList", messageList);
			mv.setViewName("message_list");
		}
		return mv;
	}

	@RequestMapping("messageDel.do")
	public void delete(int messageNum, HttpSession session, HttpServletResponse response) {
		response.setContentType("text/html;charset=utf-8");
		String loginId = (String) session.getAttribute("loginId");
		String result = "";
		if (service.delete(messageNum, loginId) == 1) {
			result = "성공";
		} else {
			result = "실패";
		}
		try {
			response.getWriter().write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
