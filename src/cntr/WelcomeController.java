package cntr;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import Dao.UserDao;
import dto.Admindto;
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
	

	@RequestMapping(value="/ClgLogin.php")
	public String clglogin (ModelMap model) {
		model.put("collegedto", new Collegedto());
		return "CollegeLogin";
	}
	
	@RequestMapping(value="/MLogin.php")
	public String clglogin (  Collegedto clgdto ,ModelMap model) {
		model.put("msg","validUser"+clgdto.getUserid());
		return "ClgLoginInfo";
	}
	
	
	@RequestMapping(value="/AdminLogin.php")
	public String adminLogin (ModelMap model) {
		model.put("Admindto", new Admindto());
		return "Adminlogin_page";
	}
	
	@RequestMapping(value="/AdminData.php")
	public String adminLogin (Admindto AdminObj ,ModelMap model) {
		model.put("msg", "welcome  "+AdminObj.getUserid());
		return "AdminHome";
	}
	
}
