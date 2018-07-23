package cntr;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

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
	Admindto AdminObj;
	@Autowired
	AdminDao adao;
	
	
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
			if(dao.checkUser(this.user))
				return "home";
			else
				return "login";
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
		if(adao.checkUser(this.AdminObj))
			return "Adminlogin_page";
		else
			return "AdminHome";
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
	

	
	
}
