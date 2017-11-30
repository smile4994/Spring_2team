package controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	Kakao kakao = new Kakao();
	
	@RequestMapping(value="/naverstart.do", method=RequestMethod.GET)
	public String naverStart() throws Exception{
		return "redirect:" + Naver.getCode();
	}
	
	
	@RequestMapping(value="/naverlogin.do" , method=RequestMethod.GET)
    public String naverLogin(@RequestParam("code") String code, @RequestParam("state")String state) throws Exception {
		System.out.println("naver code : " + code);
		System.out.println("naver state : " + state);
		
		Map<String, String> mapResult=Naver.JSONStringToMap(Naver.getAccessToken(code, state));
		System.out.println("access_token : "+(String)mapResult.get("access_token"));
		System.out.println("refresh_token : "+(String)mapResult.get("refresh_token"));
		System.out.println("token_type : "+(String)mapResult.get("token_type"));
		System.out.println("expires_in : "+(String)mapResult.get("expires_in"));
		String result = Naver.getAccessToken(code, state);
		System.out.println("result :"+result);
		return null;
    }
	
	@RequestMapping(value="/kakaoGetCode.do", method=RequestMethod.GET)
	public String kakao() throws Exception{
		Kakao kakao = new Kakao();
		System.out.println("kakao.getCode() : " + kakao.getCode());
		
		return "redirect:"+kakao.getCode();
	}
	
	@RequestMapping(value="/kakaologin.do", method=RequestMethod.GET)
	public String kakaoLogin(@RequestParam("code") String code) throws Exception {
		System.out.println("code : " + code);
		
		
		
//		kakao.getAccessToken(code);
		
		String data = (String)kakao.getHtml((kakao.getAccessToken(code)));
		System.out.println("data : " + data);
		
		Map<String, String> map = kakao.JsonStringMap(data);
		System.out.println("map :"+map);
		System.out.println("access_token :"+map.get("access_token"));
		System.out.println("refresh_token :"+map.get("refresh_token"));
		System.out.println("scope :"+map.get("scope"));
		System.out.println("token_type :"+map.get("token_type"));
		System.out.println("expires_in :"+map.get("expires_in"));
		
		
		String list = kakao.getAllList((String)map.get("access_token"));
		System.out.println("list :"+list);
		
		Map<String, String> getAllListMap = kakao.JsonStringMap(list);
		System.out.println("getAllListMap :"+getAllListMap);
		System.out.println("nickName :"+(String)getAllListMap.get("nickName"));
		System.out.println("profileImageURL :"+(String)getAllListMap.get("profileImageURL"));
		System.out.println("thumbnailURL :"+(String)getAllListMap.get("thumbnailURL"));
		System.out.println("countryISO :"+(String)getAllListMap.get("countryISO"));
		return "kakaologin";
	}
}
