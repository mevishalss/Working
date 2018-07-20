package cntr;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import dto.User;

@Controller
public class WelcomeController {
	@RequestMapping(value="/prepLog.php")
	public String prepLogin(ModelMap model) {
		model.put("user", new User());
		return "login";
	}
	
	@RequestMapping(value="/login.php")
	public String login(User user,ModelMap model) {
		model.put("msg", "Welcome !! "+user.getUserName());
		return "info";
	}
}
