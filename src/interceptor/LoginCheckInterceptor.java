package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{
	 @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	            throws Exception {
	        HttpSession session = request.getSession();
	         
	        String loginId = 
	                (String) session.getAttribute("loginId");
	         
	        if(loginId!=null && loginId.length()>0) {
	            // 로그인 정보 있음~!
	            return true;
	        }else {
	            // 로그인 정보 없음;;
	            String logMsg = "로그인 안된 사용자가 시도함:";
	            logMsg += request.getRemoteAddr();
	            request.getServletContext().log(logMsg);
	             
	            System.out.println("로그인정보 없어서 걸림!");
	            response.sendRedirect("loginCheck.do");
	            return false;
	        }
	    }

}
