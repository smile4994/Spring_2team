package controller;

import java.io.File;
import java.io.IOException;
import java.util.HashSet;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.json.XML;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import service.MemberService;
import vo.API_MemberVO;
import vo.MemberVO;

@Controller
public class MemberController {
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
	@ResponseBody
	public void login(String id, String pw, HttpSession session, HttpServletResponse resp) {
		if (service.svlogin(id, pw)) {
			id=id.toLowerCase();
			session.setAttribute("loginId", id);
			clientList.add(id); // 세션 아이디 저장리스트
			String sessionId = (String) session.getAttribute("loginId");
			System.out.println("----------------------------------------");
			System.out.println("등록된아이디 : " + clientList);
			System.out.println("*생성* // 세션 아이디 : " + sessionId + " // 세션의 수 : " + clientList.size());

			try {
				resp.getWriter().println("<script type=\"text/javascript\">\r\n" + "	alert('success');\r\n"
						+ "location.href='main.do';" +
						// "parent.location.reload();" +
						"</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				resp.getWriter().println(
						"<script type=\"text/javascript\">\r\n" + "	alert('fail');\r\n" + "location.href='main.do';" +
						// "parent.location.reload();" +
								"</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/******************* 강제 종료시 인터럽트 처리로 로그아웃 *******************/
	Thread t;
	@RequestMapping("/candidateLogout.do")
	public void candidateLogout(HttpSession session) {
		System.out.println("로그아웃후보:" + session.getAttribute("loginId"));
		t = new Thread() {
			@Override
			public void run() {
				try {
					sleep(4 * 1000);
					logout(session);
				} catch (InterruptedException e) {
					System.out.println("로그아웃 취소");
					e.printStackTrace();
				}
			}
		};
		t.start();
	}

	@RequestMapping("/candidateCancel.do")
	public void candidateCancel(HttpSession session) {
		t.interrupt();
		System.out.println("로그아웃후보 취소:" + session.getAttribute("loginId"));
	}

	/*************************************************************/

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		String sessionId = (String) session.getAttribute("loginId");

		clientList.remove(session.getAttribute("loginId"));
		System.out.println("----------------------------------------");
		System.out.println("등록된아이디 : " + clientList);
		System.out.println("!소멸! // 세션 아이디 : " + sessionId + " // 세션의 수 : " + clientList.size());

		session.invalidate();
		return "logout_form";
	}
	
	@RequestMapping("/miniProfile.do")
	public ModelAndView miniProfile(HttpSession session, String memberId) {
		String loginId = (String) session.getAttribute("loginId");
		ModelAndView mv = new ModelAndView();
		if (loginId != null && loginId.length() > 0) {
			MemberVO member = service.getMemberInfo(memberId);
			mv.addObject("memberInfo", member);
		} else {
			mv.addObject("message","로그인 정보가 없거나 탈퇴한 회원입니다");
		}
		mv.setViewName("mini_profile");
		return mv;
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
	
	/*************************카카오 / 네이버 API*******************************/
	Kakao kakao = new Kakao();

	// 네이버 로그인
	@RequestMapping(value = "/naverstart.do", method = RequestMethod.GET)
	public String naverStart() throws Exception {
		return "redirect:" + Naver.getCode();
	}

	@RequestMapping(value = "/naverlogin.do", method = RequestMethod.GET)
	@ResponseBody
	public void naverLogin(@RequestParam("code") String code, @RequestParam("state") String state,
			HttpSession session, HttpServletResponse resp) throws Exception {
		System.out.println("naver code : " + code);
		System.out.println("naver state : " + state);

		// String result = Naver.getAccessToken(code, state);

		Map<String, String> mapResult = Naver.JSONStringToMap(Naver.getAccessToken(code, state));
		String result = (String) Naver.getxml((String) mapResult.get("token_type"),
				(String) mapResult.get("access_token"));
		System.out.println("result :" + result);

		JSONObject jsonObject = XML.toJSONObject(result);
		System.out.println("jsonObject :" + jsonObject);

		JSONObject responseData = jsonObject.getJSONObject("data");
		System.out.println("responseData :" + responseData);

		Map<String, String> userMap = Naver.JSONStringToMap(responseData.get("response").toString());
		System.out.println("id:" + (String) userMap.get("id"));
		System.out.println("name:" + (String) userMap.get("name"));
		System.out.println("nickname: " + (String) userMap.get("nickname"));
		System.out.println("email:" + (String) userMap.get("email"));
		String api_id = userMap.get("id");
		API_MemberVO api_member;
		

		if (service.apiLogin(api_id)) {
			session.setAttribute("loginId", api_id);
//			clientList.add(api_id);
//			System.out.println("----------------------------------------");
//			System.out.println("등록된아이디 : " + clientList);
//			System.out.println("*생성* // 세션 아이디 : " + api_id + " // 세션의 수 : " + clientList.size());

			String sessionId = (String) session.getAttribute("loginId");

			try {
				resp.getWriter().println("<script type=\"text/javascript\">\r\n" + "	alert('success');\r\n"
						+ "location.href='main.do';" +
						// "parent.location.reload();" +
						"</script>");
				clientList.add(sessionId);
				System.out.println("----------------------------------------");
				System.out.println("등록된아이디 : " + clientList);
				System.out.println("*API 아이디생성* // 세션 아이디 : " + sessionId + " // 세션의 수 : " + clientList.size());

			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
		} else {
			api_member = new API_MemberVO();
			api_member.setId((String) userMap.get("id"));
			api_member.setName((String) userMap.get("name"));
			api_member.setEmail((String) userMap.get("email"));
			api_member.setNickname((String) userMap.get("nickname"));
			System.out.println(api_member);
			service.apiJoin(api_member);
			session.setAttribute("loginId", api_id);
			String sessionId = (String) session.getAttribute("loginId");

			try {
				resp.getWriter().println("<script type=\"text/javascript\">\r\n" + "	alert('success');\r\n"
						+ "location.href='main.do';" +
						// "parent.location.reload();" +
						"</script>");
				clientList.add(sessionId);
				System.out.println("----------------------------------------");
				System.out.println("등록된아이디 : " + clientList);
				System.out.println("*API 아이디생성* // 세션 아이디 : " + sessionId + " // 세션의 수 : " + clientList.size());
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
		}


	// System.out.println("access_token : "+(String)mapResult.get("access_token"));
	// System.out.println("refresh_token :
	// "+(String)mapResult.get("refresh_token"));
	// System.out.println("token_type : "+(String)mapResult.get("token_type"));
	// System.out.println("expires_in : "+(String)mapResult.get("expires_in"));
//	return"main";

	}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////	// 카카오 로그인
	@RequestMapping(value = "/kakaoGetCode.do", method = RequestMethod.GET)
	public String kakao() throws Exception {
		Kakao kakao = new Kakao();
		// System.out.println("kakao.getCode() : " + kakao.getCode());

		return "redirect:" + kakao.getCode();
	}

	@RequestMapping(value = "/kakaologin.do", method = RequestMethod.GET)
	public void kakaoLogin(@RequestParam("code") String code, HttpSession session, HttpServletResponse resp) throws Exception {
		// System.out.println("code : " + code);

		String data = (String) kakao.getHtml((kakao.getAccessToken(code)));
		System.out.println("data : " + data);

		Map<String, String> map = kakao.JsonStringMap(data);


		String[] list = kakao.getAllList((String) map.get("access_token"));
		System.out.println("list :" + list[0] + list[1] + list[2]); // 0: ID, 1:NIKCNAME, 2:EMAIL

		

		String api_id = list[0];
		API_MemberVO api_member;
		

		if (service.apiLogin(api_id)) {
			session.setAttribute("loginId", api_id);
//			clientList.add(api_id);
//			System.out.println("----------------------------------------");
//			System.out.println("등록된아이디 : " + clientList);
//			System.out.println("*생성* // 세션 아이디 : " + api_id + " // 세션의 수 : " + clientList.size());

			String sessionId = (String) session.getAttribute("loginId");

			try {
				resp.getWriter().println("<script type=\"text/javascript\">\r\n" + "	alert('success');\r\n"
						+ "location.href='main.do';" +
						// "parent.location.reload();" +
						"</script>");
				clientList.add(sessionId);
				System.out.println("----------------------------------------");
				System.out.println("등록된아이디 : " + clientList);
				System.out.println("*API 아이디생성* // 세션 아이디 : " + sessionId + " // 세션의 수 : " + clientList.size());

			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
		} else {
			api_member = new API_MemberVO();
			api_member.setId(list[0]);
			api_member.setName("Kakao");
			api_member.setEmail(list[2]);
			api_member.setNickname(list[1]);
			System.out.println(api_member);
			service.apiJoin(api_member);
			session.setAttribute("loginId", api_id);
			String sessionId = (String) session.getAttribute("loginId");

			try {
				resp.getWriter().println("<script type=\"text/javascript\">\r\n" + "	alert('success');\r\n"
						+ "location.href='main.do';" +
						// "parent.location.reload();" +
						"</script>");
//				clientList.add(sessionId);
//				System.out.println("----------------------------------------");
//				System.out.println("등록된아이디 : " + clientList);
//				System.out.println("*API KAKAO 아이디생성* // 세션 아이디 : " + sessionId + " // 세션의 수 : " + clientList.size());
			} catch (IOException e) {
				e.printStackTrace();
			}
			clientList.add(sessionId);
			System.out.println("----------------------------------------");
			System.out.println("등록된아이디 : " + clientList);
			System.out.println("*API KAKAO 아이디생성* // 세션 아이디 : " + sessionId + " // 세션의 수 : " + clientList.size());
			
			
		}
	}

}
