package Dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
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

	public void deleteUser(User user) {
		hibernateTemplate.execute(new HibernateCallback<User>() {

			@Override
			public User doInHibernate(Session arg0) throws HibernateException {
				Transaction t = arg0.beginTransaction();
				arg0.delete(user);
				t.commit();
				arg0.flush();
				arg0.close();
				return null;
			}
		
		});
	}
	public void updateUser(UserDetails user) {
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
	
	public List<UserDetails> allUserList(){
		List<UserDetails> ulist = hibernateTemplate.execute(new HibernateCallback<List<UserDetails>>() {

			@Override
			public List<UserDetails> doInHibernate(Session arg0) throws HibernateException {
				Transaction t = arg0.beginTransaction();
				Criteria q = arg0.createCriteria(UserDetails.class);
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
		if(ulist.isEmpty())		
			return false;
		else
			return true;
		
	}
	
	public List<UserDetails> singleUser(String uid){
		List<UserDetails> ulist = hibernateTemplate.execute(new HibernateCallback<List<UserDetails>>() {

			@Override
			public List<UserDetails> doInHibernate(Session arg0) throws HibernateException {
				Transaction t = arg0.beginTransaction();
				Criteria q = arg0.createCriteria(UserDetails.class);
				q.add(Restrictions.and(Restrictions.eq("userName", uid)));
				List<UserDetails> ul = q.list();
				t.commit();
				arg0.close();
				return ul;
			}
		
		});
		return ulist;
	}
	
/*	public boolean CheckPhone(User user){
		
		List<User> ulist = hibernateTemplate.execute(new HibernateCallback<List<User>>() {

			@Override
			public List<User> doInHibernate(Session arg0) throws HibernateException {
				Transaction t = arg0.beginTransaction();
				Criteria q = arg0.createCriteria(UserDetails.class);
				q.add(Restrictions.eq("phoneNo","d" ));
				List<User> ul = q.list();
				t.commit();
				arg0.close();
				return ul;
			}
		
		});
		if(ulist.isEmpty())		
			return false;
		else
			return true;
		
	}
	*/

}
