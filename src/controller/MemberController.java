package controller;

import java.io.File;
import java.io.IOException;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.MemberService;
import vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	@RequestMapping("/main.do")
	public String main() {
		return "main";
	}
	
	@RequestMapping("/joinForm.do")
	public String joinForm() {
		return "join_form";
	}
	
	@RequestMapping(value="/join.do",method=RequestMethod.POST)
	public ModelAndView join(MemberVO member) {
		ModelAndView mv = new ModelAndView();
		
		String uploadPath = "c:images";
		File dir = new File(uploadPath);
		if (dir.exists() == false) {
			dir.mkdir();
		}
		String savedName = new Random().nextInt(1000) + member.getMemImg().getOriginalFilename();
		String memSrc = uploadPath+"/"+savedName;
		File savedFile = new File(memSrc);
		System.out.println("memSrc : "+memSrc);
		member.setMemberSrc(memSrc);
		try {
			member.getMemImg().transferTo(savedFile);
			System.out.println("원본 이름 : " + member.getMemImg().getOriginalFilename());
			System.out.println("저장된 경로 : " + savedFile.getAbsolutePath());
			System.out.println("---------------------------");
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		if(service.svJoin(member)) {
			mv.addObject("message","회원가입 성공");
		}else {
			mv.addObject("message","회원가입 실패");
		}
		mv.setViewName("main");
		return mv;
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
	public ModelAndView login(String id, String pw, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if(service.svlogin(id, pw)) {	
			session.setAttribute("loginId", id);
		}else {
			mv.addObject("message","로그인 실패");
		}
		mv.setViewName("main");
		return mv;
	}
	
	@RequestMapping("/logout.do")
	public String loguot(HttpSession session) {
		session.invalidate();
		return "logout_form";
	}

}
