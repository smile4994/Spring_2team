package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {
	@RequestMapping(value="/naverlogin.do" , method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView naverLogin() {
        String message = "Simple Login Page";
        return new ModelAndView("naverlogin", "message", message);
    }
 
	@RequestMapping(value="/callback.do" , method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView callback() {
        String message = "Simple Callback Page";
        return new ModelAndView("callback", "message", message);
    }
}
