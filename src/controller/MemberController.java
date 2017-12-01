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

	// �߰��� �κ� ����Ȯ������
	public static HashSet<String> clientList = new HashSet<>();

	//////// ajax����Ҳ���////////////
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
				dir.mkdir();// �ش� ���丮 ������ ����
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
			System.out.println("src�� default�� ����");
			member.setMemberSrc("img/default.jpg");
		}

		if (service.svJoin(member)) {
			mv.addObject("message", "ȸ������ ����");
		} else {
			mv.addObject("message", "ȸ������ ����");
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

			clientList.add(id); // ���� ���̵� ���帮��Ʈ
			String sessionId = (String) session.getAttribute("loginId");
			System.out.println("----------------------------------------");
			System.out.println("��ϵȾ��̵� : " + clientList);
			System.out.println("*����* // ���� ���̵� : " + sessionId + " // ������ �� : " + clientList.size());

		} else {
			mv.addObject("message", "�α��� ����");
		}
		mv.setViewName("main");
		return mv;
	}

	@RequestMapping("/logout.do")
	public String loguot(HttpSession session) {
		String sessionId = (String) session.getAttribute("loginId");
		
		clientList.remove(session.getAttribute("loginId"));
		System.out.println("----------------------------------------");
		System.out.println("��ϵȾ��̵� : " + clientList);
		System.out.println("!�Ҹ�! // ���� ���̵� : " + sessionId + " // ������ �� : " + clientList.size());

		session.invalidate();
		return "logout_form";
	}

	@RequestMapping("deleteMember.do")
	public ModelAndView deleteMember(HttpSession session) {
		ModelAndView mv = new ModelAndView("main");
		String loginId = (String) session.getAttribute("loginId");
		if (service.deleteMember(loginId) == 1) {
			mv.addObject("message", "ȸ�� Ż�� �Ϸ�");
		}
		return mv;
	}

	@RequestMapping(value = "/updateMember.do", method = RequestMethod.POST)
	public ModelAndView updateMember(MemberVO member, HttpSession session, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("main");
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("update�� �Ѿ�� member ��");
		System.out.println(member);
		if (member.getMemImg().getSize() > 0) {
			System.out.println("����� 0���� Ŀ�� �����ʻ��� ����");
			String uploadPath = request.getServletContext().getRealPath("img");
			File dir = new File(uploadPath);
			if (dir.exists() == false) {
				dir.mkdir();// �ش� ���丮 ������ ����
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
			mv.addObject("message", "���� ���� �Ϸ�");
		} else {
			mv.addObject("message", "���� ���� ����");
		}
		return mv;
	}

	
	
	/**************** ������ ������ �� ****************/
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
	}
	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
	}
	/*********************************************/
}
