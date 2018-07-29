package Dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import dto.User;
import dto.UserDetails;

@Repository
public class UserDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	@Autowired
	UserDetails ud;
	@Autowired
	User user;
	public UserDao() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}


	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public void createUser(User user) {
		hibernateTemplate.execute(new HibernateCallback<User>() {

			@Override
			public User doInHibernate(Session arg0) throws HibernateException {
				Transaction t = arg0.beginTransaction();
				arg0.save(user);
				t.commit();
				arg0.close();
				return null;
			}
		
		});
	}

	public void createUserDetails(UserDetails user) {
		this.ud=user;
		hibernateTemplate.execute(new HibernateCallback<UserDetails>() {
			
			@Override
			public UserDetails doInHibernate(Session arg0) throws HibernateException {
				Transaction t = arg0.beginTransaction();
				arg0.save(ud);
				t.commit();
				arg0.flush();
				arg0.close();
				return null;
			}
		
		});
	}
	
	public void InsertIntoLogin(User user) {
		this.user=user;
		hibernateTemplate.execute(new HibernateCallback<User>() {
			
			@Override
			public User doInHibernate(Session arg0) throws HibernateException {
				Transaction t = arg0.beginTransaction();
				arg0.save(user);
				t.commit();
				arg0.flush();
				arg0.close();
				return null;
			}
		
		});
	}
	public void updateUser(UserDetails user) {
		hibernateTemplate.execute(new HibernateCallback<UserDetails>() {

			@Override
			public UserDetails doInHibernate(Session arg0) throws HibernateException {
				Transaction t = arg0.beginTransaction();
				arg0.update(user);
				t.commit();
				System.out.println(user);
				arg0.flush();
				arg0.close();
				return null;
			}
		
		});
	}
	
	public void updateUserLogin(User user) {
		hibernateTemplate.execute(new HibernateCallback<User>() {

			@Override
			public User doInHibernate(Session arg0) throws HibernateException {
				Transaction t = arg0.beginTransaction();
				arg0.update(user);
				t.commit();
				System.out.println(user);
				arg0.flush();
				arg0.close();
				return null;
			}
		
		});
	}
	
	
	
	public List<User> userList(){
		List<User> ulist = hibernateTemplate.execute(new HibernateCallback<List<User>>() {

			@Override
			public List<User> doInHibernate(Session arg0) throws HibernateException {
				Transaction t = arg0.beginTransaction();
				Criteria q = arg0.createCriteria(User.class);
				List<User> ul = q.list();
				t.commit();
				arg0.close();
				return ul;
			}
		
		});
		return ulist;
	}
	
	public List<UserDetails> checkUserDetails(String uid){
		List<UserDetails> ulist = hibernateTemplate.execute(new HibernateCallback<List<UserDetails>>() {

			@Override
			public List<UserDetails> doInHibernate(Session arg0) throws HibernateException {
				Transaction t = arg0.beginTransaction();
				Criteria q = arg0.createCriteria(UserDetails.class);
				q.add(Restrictions.eq("userName", uid));
				List<UserDetails> ul = q.list();
				t.commit();
				arg0.close();
				return ul;
			}
		
		});
		return ulist;
	}
	
	public List<User> checkLoginDetails(String uid){
		List<User> ulist = hibernateTemplate.execute(new HibernateCallback<List<User>>() {

			@Override
			public List<User> doInHibernate(Session arg0) throws HibernateException {
				Transaction t = arg0.beginTransaction();
				Criteria q = arg0.createCriteria(User.class);
				q.add(Restrictions.eq("userName", uid));
				List<User> ul = q.list();
				t.commit();
				arg0.close();
				return ul;
			}
		
		});
		return ulist;
	}
	
	public List<UserDetails> checkMobileDetails(String uid){
		List<UserDetails> ulist = hibernateTemplate.execute(new HibernateCallback<List<UserDetails>>() {

			@Override
			public List<UserDetails> doInHibernate(Session arg0) throws HibernateException {
				Transaction t = arg0.beginTransaction();
				Criteria q = arg0.createCriteria(UserDetails.class);
				q.add(Restrictions.eq("phoneNo", uid));
				List<UserDetails> ul = q.list();
				t.commit();
				arg0.close();
				return ul;
			}
		
		});
		return ulist;
	}
	
	public List<UserDetails> checkMailDetails(String uid){
		List<UserDetails> ulist = hibernateTemplate.execute(new HibernateCallback<List<UserDetails>>() {

			@Override
			public List<UserDetails> doInHibernate(Session arg0) throws HibernateException {
				Transaction t = arg0.beginTransaction();
				Criteria q = arg0.createCriteria(UserDetails.class);
				q.add(Restrictions.eq("emailId", uid));
				List<UserDetails> ul = q.list();
				t.commit();
				arg0.close();
				return ul;
			}
		
		});
		return ulist;
	}
	
	
	
	public boolean checkUser(User user){
		
		List<User> ulist = hibernateTemplate.execute(new HibernateCallback<List<User>>() {

			@Override
			public List<User> doInHibernate(Session arg0) throws HibernateException {
				Transaction t = arg0.beginTransaction();
				Criteria q = arg0.createCriteria(User.class);
				q.add(Restrictions.and(Restrictions.eq("userName", user.getUserName()), Restrictions.eq("userPass", user.getUserPass())));
				List<User> ul = q.list();
				t.commit();
				
			
				
				
				arg0.close();
				return ul;
			}
		
		});
		
String s="Verified";
		
		if(ulist.isEmpty() && (!user.getStatus().equals(s))	)	
			return false;
		else 
			return true;
	}
	
	
	
	


}
