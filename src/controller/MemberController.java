package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import service.MemberService;
import vo.MemberVO;
import vo.MessageVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;

	@RequestMapping("/main.do")
	public String main() {
		return "main";
	}

	@RequestMapping("/about.do")
	public String about() {
		return "about";
	}

	@RequestMapping("/gallery.do")
	public String gallery() {
		return "gallery";
	}

	@RequestMapping("/codes.do")
	public String codes() {
		return "codes";
	}

	@RequestMapping("/jys.do")
	public String jys() {
		return "jys";
	}

	@RequestMapping("/matching.do")
	public String matching() {
		return "matching";
	}

	@RequestMapping("/map.do")
	public String map() {
		return "map";
	}

	@RequestMapping("/joinForm.do")
	public String joinForm() {
		return "join_form";
	}

	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public ModelAndView join(MemberVO member, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		String uploadPath = request.getServletContext().getRealPath("img");
		File dir = new File(uploadPath);
		if (dir.exists() == false) {
			dir.mkdir();// 해당 디렉토리 없으면 생성
		}
		String extensionStr = member.getMemImg().getOriginalFilename();
		String extension = extensionStr.substring(extensionStr.length() - 4, extensionStr.length());
		String fileName = new Random().nextInt(100000) + extension;
		String savedPath = uploadPath + "/" + fileName;
		File savedFile = new File(savedPath);
		String memSrc = "img/" + fileName;
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

		if (service.svJoin(member)) {
			mv.addObject("message", "회원가입 성공");
		} else {
			mv.addObject("message", "회원가입 실패");
		}
		mv.setViewName("main");
		return mv;
	}

	@RequestMapping("/loginForm.do")
	public String loginForm() {
		return "login_form";
	}

	// @RequestMapping("/loginCheck.do")
	// public String loginCheck() {
	// return "login_check";
	// }

	@RequestMapping("/myPage.do")
	public ModelAndView myPage(HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		ModelAndView mv = new ModelAndView();
		if (loginId != null && loginId.length() > 0) {
			MemberVO member = service.getMemberInfo(loginId);
			mv.addObject("memberInfo", member);
			mv.setViewName("my_page");
		} else {
			mv.setViewName("no_login");
		}
		return mv;
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(String id, String pw, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (service.svlogin(id, pw)) {
			session.setAttribute("loginId", id);
		} else {
			mv.addObject("message", "로그인 실패");
		}
		mv.setViewName("main");
		return mv;
	}

	@RequestMapping("/logout.do")
	public String loguot(HttpSession session) {
		session.invalidate();
		return "logout_form";
	}
	
	@RequestMapping(value="/deleteMember.do", method=RequestMethod.POST)
	public ModelAndView deleteMember(int memberNum, HttpSession session) {
		ModelAndView mv = new ModelAndView("main");
		String loginId =(String)session.getAttribute("loginId");
		if(service.deleteMember(memberNum,loginId)==1) {
			mv.addObject("message","회원 탈퇴 완료");
		}
		return mv;
	}
	@RequestMapping(value="/updateMember.do", method=RequestMethod.POST)
	public ModelAndView updateMember(MemberVO member, HttpSession session) {
		System.out.println("update시 넘어온 member 값");
		System.out.println(member);
		ModelAndView mv = new ModelAndView("main");
		String loginId =(String)session.getAttribute("loginId");
		if(service.updateMember(member,loginId)==1) {
			mv.addObject("message","회원 탈퇴 완료");
		}
		return mv;
	}
}
