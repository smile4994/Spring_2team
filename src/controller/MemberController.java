package controller;

import java.io.File;
import java.io.IOException;
import java.util.HashSet;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import service.MemberService;
import vo.MemberVO;

@Controller
public class MemberController implements HttpSessionListener {
	@Autowired
	private MemberService service;

	// 추가된 부분 세션확인위해
	public static HashSet<String> clientList = new HashSet<>();

	//////// ajax사용할꺼야////////////
	@RequestMapping("clientList.do")
	public void clientList(HttpServletResponse respons) {
		respons.setContentType("text/html;charset=utf-8");
		Gson gson = new Gson();
		try {
			respons.getWriter().write(gson.toJson(clientList));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/testMain.do")
	public String testMain() {
		return "testMain";
	}

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

		if (member.getMemImg().getSize() > 0) {
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
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("src에 default값 저장");
			member.setMemberSrc("img/default.jpg");
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

			clientList.add(id); // 세션 아이디 저장리스트
			String sessionId = (String) session.getAttribute("loginId");
			System.out.println("----------------------------------------");
			System.out.println("등록된아이디 : " + clientList);
			System.out.println("*생성* // 세션 아이디 : " + sessionId + " // 세션의 수 : " + clientList.size());

		} else {
			mv.addObject("message", "로그인 실패");
		}
		mv.setViewName("main");
		return mv;
	}

	@RequestMapping("/logout.do")
	public String loguot(HttpSession session) {
		String sessionId = (String) session.getAttribute("loginId");
		
		clientList.remove(session.getAttribute("loginId"));
		System.out.println("----------------------------------------");
		System.out.println("등록된아이디 : " + clientList);
		System.out.println("!소멸! // 세션 아이디 : " + sessionId + " // 세션의 수 : " + clientList.size());

		session.invalidate();
		return "logout_form";
	}

	@RequestMapping("deleteMember.do")
	public ModelAndView deleteMember(HttpSession session) {
		ModelAndView mv = new ModelAndView("main");
		String loginId = (String) session.getAttribute("loginId");
		if (service.deleteMember(loginId) == 1) {
			mv.addObject("message", "회원 탈퇴 완료");
		}
		return mv;
	}

	@RequestMapping(value = "/updateMember.do", method = RequestMethod.POST)
	public ModelAndView updateMember(MemberVO member, HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("main");
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("update시 넘어온 member 값");
		System.out.println(member);
		if (member.getMemImg().getSize() > 0) {
			System.out.println("사이즈가 0보다 커서 프로필사진 변경");
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
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		if (service.updateMember(member, loginId) == 1) {
			mv.addObject("message", "정보 수정 완료");
		} else {
			mv.addObject("message", "정보 수정 실패");
		}
		return mv;
	}

	
	
	/**************** 세션의 생성과 끝 ****************/
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
	}
	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
	}
	/*********************************************/
}
