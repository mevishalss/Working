package cntr;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import Dao.UserDao;
import dto.Collegedto;
import dto.User;

@Controller
public class WelcomeController {
	@Autowired
	UserDao dao;
	
	public UserDao getDao() {
		return dao;
	}

	public void setDao(UserDao dao) {
		this.dao = dao;
	}

	@RequestMapping(value="/prepLog.php")
	public String prepLogin(ModelMap model) {
		model.put("user", new User());
		return "login";
	}
	
	@RequestMapping(value="/login.php")
	public String login(User user,ModelMap model) {
		dao.createUser(user);
		model.put("msg", "Welcome !! "+user.getUserName());
		return "info";
	}
	

	@RequestMapping(value="/ValidateClgUser.php")
	public String clglogin (ModelMap model) {
		model.put("collegedto", new Collegedto());
		return "ClgHomePage";
	}
}
