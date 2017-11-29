package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import service.MemberService;
import vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping("/joinForm.do")
	public String joinForm() {
		return "join_form";
	}
	
	@RequestMapping("/join.do")
	public String join(MemberVO member) {
		if(service.svJoin(member)) {
			return "join_success";
		}else {
			return "join_fail";
		}
	}
	
	@RequestMapping("/loginForm.do")
	public String loginForm() {
		return "login_form";
	}
	
	@RequestMapping("/loginCheck.do")
	public String loginCheck() {
		return "login_check";
	}
	
	
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(String id, String password, HttpSession session) {
		if(service.svlogin(id, password)) {	
			session.setAttribute("loginId", id);
			return "login_success";
		}else {
			return "login_fail";
		}
	}
	
	@RequestMapping("/logout.do")
	public String loguot(HttpSession session) {
		session.invalidate();
		return "logout_form";
	}

}
