package cntr;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.xml.ws.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.example.Codebeautify;
import com.example.Codebeautify.Attributes;
import com.example.Codebeautify.BooksInfo;
import com.example.Codebeautify.CategorySpecificInfoV1;
import com.example.Codebeautify.FlipkartSellingPrice;
import com.example.Codebeautify.FlipkartSpecialPrice;
import com.example.Codebeautify.MaximumRetailPrice;
import com.example.Codebeautify.ProductBaseInfoV1;
import com.example.Codebeautify.ProductShippingInfoV1;
import com.example.Codebeautify.ShippingCharges;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import Dao.AdminDao;
import Dao.CollegeDao;
import Dao.EditDao;
import Dao.ForgotPass;
import Dao.OrderDao;
import Dao.PaymentDao;
import Dao.UserDao;
import Demo.Mailer;
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
	@Autowired
	ForgotPass forgotpass;
	
	public ForgotPass getForgotpass() {
		return forgotpass;
	}

	public void setForgotpass(ForgotPass forgotpass) {
		this.forgotpass = forgotpass;
	}

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
			{
				return "session";
			}	
			else
				return "login";
	}
	
	
	@RequestMapping(value="/session.php")
	public String checklogin(User user,ModelMap model) {
			model.put("user", user);
			return "session";
	}
	
	
	@RequestMapping(value="/sessionexpired.php")
	public String sessionexpire(User user,ModelMap model) {
			model.put("user", user);
				return "sessionexpired";
	}
	
	@RequestMapping(value="/LoginPage.php")
	public String LoginPage(@RequestParam("uid") String uid,ModelMap model) {
			model.put("user", uid);
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
	public String adminLogin (@RequestParam("uid") String uid ,ModelMap model) {
			List<OrderDetails> list= odao.AllPendingList();
				model.put("list",list);
				return "ViewToAdmin";
		
	}
	
	@RequestMapping(value="/AdminSession.php")
	public String admin(Admindto AdminObj ,ModelMap model) {
		this.AdminObj = AdminObj;
		model.put("Admindto", new Admindto());
		if(adao.checkUser(this.AdminObj))
		{
				model.put("uid", AdminObj.getUserId());
				return "CreateAdminSession";
		}
			else
			{
				model.put("Admindto", new Admindto());
				return "Adminlogin_page";
		}
	}
	
	
	@RequestMapping(value="/AdminData1.php")
	public String adminUserName (Admindto AdminObj ,ModelMap model) {
		List<UserDetails> list= editdao.UserList();
		model.put("list",list);
			return "AdminUserName";
	}
	
	
	@RequestMapping(value="/ViewToAdmin.php")
	public String viewtoadmin (ModelMap model) {
	//	System.out.println("payment in progress");
		List<OrderDetails> list= odao.AllPendingList();
		model.put("list",list);
		return "ViewToAdmin";
	}
	
	@RequestMapping(value="/admnUserDetails.php")
	public String adminUserDetails (@RequestParam("uid") String uid,ModelMap model) {
		List<UserDetails> list= dao.singleUser(uid);
		model.put("list",list);
		model.put("user", user);
		return "AdminUserDetails";
	}
	
	@RequestMapping(value="/paymentDetails1.php")
	public String paymentDetails1 (User user,ModelMap model) {
		List<Payment> list =pdao.paymentList(user.getUserName());
		model.put("list", list);
		return "AdminPaymentDetails";
	}
	
	
	@RequestMapping(value="/PayInstallment.php")
	public String PayPage (@RequestParam("orderId") String orderId,ModelMap model) {
		model.put("orderId", orderId);
		return "paymentpage";
	}
	
	
	@RequestMapping(value="/PaymentPage.php")
	public String PayInstallment (@RequestParam("orderId") int orderId,ModelMap model) {
		List<OrderDetails> list = odao.orderList(orderId);
		for(OrderDetails o : list)
		{
			if(o.getRemainingInst()>0)
			{
			
			o.setRemainingInst(o.getRemainingInst()-1);
			odao.OrderUpdate(o);
			}
		}
		
		return "PaymentInProgress";
	}
	
	
	@RequestMapping(value="/PayDownPayment.php")
	public String PayDownPayment(	@RequestParam("uid") String uid,
									@RequestParam("date") String date,
									@RequestParam("orderPrice") String price,
									@RequestParam("descirption") String desc,
									@RequestParam("emi") String emi,
									@RequestParam("dpay") String dpay,
									@RequestParam("noi") String noi			
									,ModelMap model) {
		double price1 = Double.parseDouble(price);
		double emi1 = Double.parseDouble(emi);
		double dpay1 = Double.parseDouble(dpay);
		int noi1 = Integer.parseInt(noi);
		OrderDetails od = new OrderDetails();
		od.setUserId(uid);
		od.setOrderDate(date);
		od.setOrderPrice(price1);
		od.setDescription(desc);
		od.setEMIAmount(emi1);
		od.setDownPayment(dpay1);
		od.setNoOfInstalments(noi1);
		od.setRemainingInst(noi1);
		System.out.println(uid);
		odao.InsertOrder(od);
		Payment p = new Payment();
		p.setOrderId(od.getOrderId());
		p.setModeOfTrans("Net Banking");
		p.setTransAmount(price1);
		p.setTransDate(date);
		p.setUserId(uid);
		pdao.InsertPayment(p);
		
		
		return "PaymentInProgress";
	}
	
	public EditDao getEditdao() {
		return editdao;
	}

	public void setEditdao(EditDao editdao) {
		this.editdao = editdao;
	}

	@RequestMapping(value="/paymentdetails.php")
	public String paymentdetails (ModelMap model) {
		List<Payment> list =pdao.UserPaymentList(user);
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
	public String changePass (@RequestParam("email") String email,ModelMap model) {
		
		List<UserDetails> list= forgotpass.getpass(email);
		String pwd="";
		for(UserDetails m : list){ 
			
		pwd = m.getUserPass();
		break;
		}
		Mailer ml=new Mailer();
		String link="http://localhost:8001/Project/prepLog.php";
		ml.send("3p.mechto@gmail.com","prafull3p",email,"Your One Time Password is::","Your password is "+pwd+" "+"Use this password to login");  
		System.out.println("Password send to your email id successfully !");
		return "forgot_pass";
		
	}
	
	
	@RequestMapping(value="/forgotpass1.php")
	public String forgotPass (ModelMap model) {
				
		return "ForgotPass";
	}
	
	@RequestMapping(value="/paymentpage.php")
	public String paymentpage (ModelMap model) {
		System.out.println("payment in progress");
		return "paymentpage";
	}
	
	@RequestMapping(value="/PaymentInProgress.php")
	public String paymentfinal (ModelMap model) {
		System.out.println("payment in done");
		return "PaymentInProgress";
	}
	
	@RequestMapping(value="/ValidateUser.php")
	public String Timepass (@RequestParam("value") String value,@RequestParam("uid") String uid,ModelMap model) {
		List<UserDetails> list = dao.checkUserDetails(uid);
		for(UserDetails u :list)
		{
			
			u.setStatus(value);
			dao.updateUser(u);
		}
		
		List<UserDetails> list2 = dao.checkUserDetails(uid);
		for(UserDetails u :list2)
		{
			Mailer ml=new Mailer();
			ml.send("3p.mechto@gmail.com","prafull3p",u.getEmailId(),"EMI POOL::","Your Account is in "+ value+"status");  
		}
		List<User> list1 = dao.checkLoginDetails(uid);
		for(User u1 :list1)
		{
			
			u1.setStatus(value);
			dao.updateUserLogin(u1);
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
	public String orderUPdate (@RequestParam("value") String value1,@RequestParam("uid") String uid1,ModelMap model) {
		int uid = Integer.parseInt(uid1);
		String value = value1;
		List<OrderDetails> list = odao.orderList(uid);
		for(OrderDetails u :list)
		{
			u.setOrderStatus(value);
			odao.OrderUpdate(u);
		}
		List<UserDetails> list1 = dao.checkUserDetails(uid);
		for(UserDetails u :list1)
		{
			Mailer ml=new Mailer();
			ml.send("3p.mechto@gmail.com","prafull3p",u.getEmailId(),"EMI POOL::","Your order is been : "+ value);  
		
		}
		return "orderUpdatePage";
	}
	
	
	
	@RequestMapping(value="/searchProduct.php", method = RequestMethod.POST)
	public String SearchProduct(@RequestParam("search") String flipkartUrl,@RequestParam("uid") String uid,ModelMap model) {
		//System.out.println(flipkartUrl);
		
		
	    MultiValueMap<String, String> parameters = UriComponentsBuilder.fromUriString(flipkartUrl).build().getQueryParams();
	    List<String> pid = parameters.get("pid");
	    //System.out.println("PID is "+pid.get(0));
		String affliateUrl = "https://affiliate-api.flipkart.net/affiliate/1.0/product.json?id="+pid.get(0);
		RestTemplate restTemplate=new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.set("Fk-Affiliate-Id", "mevishals");
		headers.set("Fk-Affiliate-Token", "5660a14f6add4eefbdcf9d86bcd4afeb");
		
		HttpEntity entity = new HttpEntity(headers);

		ResponseEntity<String> response = restTemplate.exchange(affliateUrl, HttpMethod.GET, entity, String.class);

		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		Codebeautify productInfo = gson.fromJson(response.getBody().toString(), Codebeautify.class);
		
		//System.out.println("Product Response "+response.getBody().toString());
		
		//System.out.println("product info "+(productInfo == null));
		//System.out.println("-------------------------");
		//System.out.println("Product Id "+(productInfo.getProductBaseInfoV1() == null));
		//System.out.println(productInfo.getProductBaseInfoV1().getProductId());
		//System.out.println(productInfo.getProductBaseInfoV1().getImageUrls());
		//System.out.println("-------------------------");
//		System.out.println("image urls "+(productInfo.getProductBaseInfoV1().getImageUrls() == null));
//		System.out.println("single image "+(productInfo.getImageUrls().get800x800()));
//		
//		System.out.println("Prdouct specs "+productInfo.getImageUrls().get800x800());
		
		
		//System.out.println("REsponse "+response.getBody().toString());
		//System.out.println("--------------Calling");
		
		String productid=productInfo.getProductBaseInfoV1().getProductId();
		model.put("productid",productid);
		
		String title=productInfo.getProductBaseInfoV1().getTitle();
		model.put("title", title);
		System.out.println(title);
		
		MaximumRetailPrice maximumRetailPrice=productInfo.getProductBaseInfoV1().getMaximumRetailPrice();
		float maxprice=maximumRetailPrice.getAmount();
		model.put("maxprice", maxprice);
		
		String currency=maximumRetailPrice.getCurrency();
		model.put("currenncy", currency);
		
		FlipkartSellingPrice flipkartsellingprice=productInfo.getProductBaseInfoV1().getFlipkartSellingPrice();
		float sellprice=flipkartsellingprice.getAmount();
		model.put("sellprice",sellprice );
	
		
		FlipkartSpecialPrice flipkartspecialprice=productInfo.getProductBaseInfoV1().getFlipkartSpecialPrice();
		float specialprice=flipkartspecialprice.getAmount();
		model.put("specialprice", specialprice);
		
		String producturl=productInfo.getProductBaseInfoV1().getProductUrl();
		model.put("producturl",producturl);
		
		String brand=productInfo.getProductBaseInfoV1().getProductBrand();
		model.put("brand", brand);
		
		boolean instock=productInfo.getProductBaseInfoV1().getInStock();
		model.put("instock", instock);
		
		boolean codavailable=productInfo.getProductBaseInfoV1().getCodAvailable();
		model.put("codavailable", codavailable);
		
		float discountPercentage=productInfo.getProductBaseInfoV1().getDiscountPercentage();
		model.put("discountpercent", discountPercentage);
		String image = productInfo.getProductBaseInfoV1().getImageUrls().get_400_x400();
		model.put("image", image);

		Attributes atributes=productInfo.getProductBaseInfoV1().getAttributes();
		String size=atributes.getSize();
		String color=atributes.getColor();
		String Storage=atributes.getStorage();
		String displaysize=atributes.getDisplaySize();		
		model.put("size", size);
		model.put("color", color);
		model.put("Storage", Storage);
		model.put("displaysize", displaysize);
		
		ShippingCharges shippinginfo=productInfo.getProductShippingInfoV1().getShippingCharges();
		float shippingcharges=shippinginfo.getAmount();
		model.put("shippingcharges", shippingcharges);
		
		String estimateddeliverytime=productInfo.getProductShippingInfoV1().getEstimatedDeliveryTime();
		model.put("estimateddeliverytime", estimateddeliverytime);
		String sellername=productInfo.getProductShippingInfoV1().getSellerName();
		model.put("sellername",sellername);
		float selleravgrating=productInfo.getProductShippingInfoV1().getSellerAverageRating();
		model.put("selleravgrating", selleravgrating);
		
		ArrayList<Object> categoryspeci=productInfo.getCategorySpecificInfoV1().robject();		
		model.put("categoryspeci", categoryspeci);
		
		ArrayList<Object> offers=productInfo.getProductBaseInfoV1().roffers();
		model.put("offers", offers);
		
		BooksInfo book=productInfo.getCategorySpecificInfoV1().getBooksInfo();
		String language=book.getLanguage();
		String binding=book.getBinding();
		String pages=book.getPages();
		String publisher=book.getPublisher();
		float year=book.getYear();
		
		model.put("language", language);
		model.put("binding", binding);
		model.put("pages", pages);
		model.put("publisher", publisher);
		model.put("year", year);
		
		ArrayList<Object> arrauthor =  productInfo.getCategorySpecificInfoV1().getBooksInfo().rauthor();
		model.put("author", arrauthor);
		
		
		/*ArrayList<Object> arrspecilist =  productInfo.getCategorySpecificInfoV1().specilist();
		for (Object a : arrspecilist) {
			System.out.println(a.toString());
		}*/		
		model.put("uid", uid);
		
		return "EMI_page";
	}
	
	
	
	

}

	

