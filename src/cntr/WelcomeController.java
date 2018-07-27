package cntr;


import java.util.List;

import javax.servlet.http.Cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Dao.AdminDao;
import Dao.CollegeDao;
import Dao.EditDao;
import Dao.OrderDao;
import Dao.PaymentDao;
import Dao.UserDao;
import dto.Admindto;
import dto.Collegedto;
import dto.OrderDetails;
import dto.Payment;
import dto.User;
import dto.UserDetails;

@Controller
public class WelcomeController {
	@Autowired
	UserDao dao;
	@Autowired
	PaymentDao pdao;
	@Autowired
	CollegeDao cdoa;
	@Autowired
	OrderDao odao;
	@Autowired
	EditDao editdao;
	@Autowired
	User user;
	@Autowired
	UserDetails ud;
	@Autowired
	Admindto AdminObj;
	@Autowired
	AdminDao adao;
	public UserDetails getUd() {
		return ud;
	}

	public void setUd(UserDetails ud) {
		this.ud = ud;
	}
	
	
	public AdminDao getAdao() {
		return adao;
	}

	public void setAdao(AdminDao adao) {
		this.adao = adao;
	}

	public Admindto getAdminObj() {
		return AdminObj;
	}

	public void setAdminObj(Admindto adminObj) {
		AdminObj = adminObj;
	}

	public CollegeDao getCdoa() {
		return cdoa;
	}

	public void setCdoa(CollegeDao cdoa) {
		this.cdoa = cdoa;
	}

	public OrderDao getOdao() {
		return odao;
	}

	public void setOdao(OrderDao odao) {
		this.odao = odao;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public PaymentDao getPdao() {
		return pdao;
	}

	public void setPdao(PaymentDao pdao) {
		this.pdao = pdao;
	}

	public UserDao getDao() {
		return dao;
	}

	public void setDao(UserDao dao) {
		this.dao = dao;
	}

	@RequestMapping(value="/prepLog.php")
	public String prepLogin(ModelMap model) {
		model.put("user", user);
		return "login";
	}
	
	@RequestMapping(value="/home.php")
	public String home(ModelMap model) {
		return "home";
	}
	
	@RequestMapping(value="/login.php")
	public String login(User user,ModelMap model) {
		this.user = user;
		model.put("uid", user.getUserName());
		model.put("user", user);
			if(dao.checkUser(this.user))
				return "session";
			//else
				//return "login";
			return "session";
	}
	
	
	
	@RequestMapping(value="/session.php")
	public String checklogin(User user,ModelMap model) {
			model.put("user", user);
			
				return "session";
	}
	
	@RequestMapping(value="/LoginPage.php")
	public String LoginPage(User user,ModelMap model) {
			model.put("user", user);
					return "home";
				}
	
		

	@RequestMapping(value="/ClgLogin.php")
	public String clglogin (ModelMap model) {
		model.put("collegedto", new Collegedto());
		return "CollegeLogin";
	}
	
	@RequestMapping(value="/MLogin.php")
	public String clglogin (  Collegedto clgdto ,ModelMap model) {
		List<UserDetails> list =cdoa.studentsList(clgdto.getUserid());
		model.put("list", list);
		model.put("user",dao);
		model.put("CollegeCode",clgdto.getUserid());
		return "ClgLoginInfo";
	}
	
	
	@RequestMapping(value="/AdminLogin.php")
	public String adminLogin (ModelMap model) {
		model.put("Admindto", new Admindto());
		return "Adminlogin_page";
	}
	
	@RequestMapping(value="/AdminData.php")
	public String adminLogin (Admindto AdminObj ,ModelMap model) {
		this.AdminObj = AdminObj;
	//	if(adao.checkUser(this.AdminObj))
		{
				List<OrderDetails> list= odao.AllorderList();
				model.put("list",list);
				return "ViewToAdmin";
		}
		//	else
		//	{
		//		return "AdminHome";
		//}
	}
	
	public EditDao getEditdao() {
		return editdao;
	}

	public void setEditdao(EditDao editdao) {
		this.editdao = editdao;
	}

	@RequestMapping(value="/paymentdetails.php")
	public String paymentdetails (ModelMap model) {
		
		List<Payment> list =pdao.paymentList(user);
		model.put("list", list);
		
		return "payment";
	}
	
	@RequestMapping(value="/orderdetails.php")
	public String orderdetails (ModelMap model) {
		List<OrderDetails> list= odao.orderList(user);
		model.put("list",list);
		return "orderhistory";
	}
	
	@RequestMapping(value="/edit.php")
	public String edituser (ModelMap model) {
		List<UserDetails> list= editdao.orderList(user);
		model.put("user",ud);
		model.put("list",list);
		return "edit";
	}
	
	@RequestMapping(value="/forgotpass.php")
	public String forgotPass (ModelMap model) {
		System.out.println("hello");
		return "ForgotPass";
	}
	
	@RequestMapping(value="/ValidateUser.php")
	public String Timepass (@RequestParam("value") String value,@RequestParam("uid") String uid,ModelMap model) {
		List<UserDetails> list = dao.checkUserDetails(uid);
		for(UserDetails u :list)
		{
			u.setStatus(value);
			dao.updateUser(u);
		}
		return "ValidateUser";
	}
	
	
	@RequestMapping(value="/edited.php")
	public String editDetails(UserDetails user,ModelMap model) {
			dao.updateUser(user);
				return "home";
	}
	

	@RequestMapping(value="/registration.php")
	public String Regis(ModelMap model) {
		model.put("user",new UserDetails());
		return "registrationpage";
	}
	
	@RequestMapping(value="/registrationpage.php")
	public String Regis(UserDetails d ,ModelMap model){
		this.ud = d;
		System.out.println(ud.getAddress());
		dao.createUserDetails(d);
		user.setUserName(ud.getUserName());
		user.setUserPass(ud.getUserPass());
		dao.InsertIntoLogin(user);
		model.put("user", user);
		return "login";
	}
	

	
	@RequestMapping(value="/ValidateUserId.php")
	public String validateuserid(@RequestParam("value") String value,ModelMap model) {
		List<UserDetails> list = dao.checkUserDetails(value);
		String ans;
		if(list.isEmpty())
			ans = "true";
		else
			ans = "false";
			
		model.put("ans", ans);
		return "ValidateUserId";
	}
	
	@RequestMapping(value="/ValidateMailId.php")
	public String ValidateMailId(@RequestParam("value") String value,ModelMap model) {
		List<UserDetails> list = dao.checkMailDetails(value);
		String ans;
		if(list.isEmpty())
			ans = "true";
		else
			ans = "false";
		
		model.put("ans", ans);
		return "ValidateMailId";
	}
	
		
	@RequestMapping(value="/ValidateMobile.php")
	public String Validatemobile(@RequestParam("value") String value,ModelMap model) {
		List<UserDetails> list = dao.checkMobileDetails(value);
		String ans;
		if(list.isEmpty())
			ans = "true";
		else
			ans = "false";
		
		model.put("ans", ans);
		return "ValidateMobile";
	}
	
	
	

	@RequestMapping(value="/orderUpdatePage.php")
	public String orderUPdate (@RequestParam("value") String value,@RequestParam("uid") String uid,ModelMap model) {
		List<OrderDetails> list = odao.orderList(uid);
		for(OrderDetails u :list)
		{
			u.setOrderSatus(value);
			odao.OrderUpdate(u);
		}
		return "orderUpdatePage";
	}
	


	
	
	

}

	

