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
public class EditDao {
@Autowired
private HibernateTemplate hibernateTemplate;

public EditDao() {
	super();
	// TODO Auto-generated constructor stub
}

public HibernateTemplate getHibernateTemplate() {
	return hibernateTemplate;
}

public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
	this.hibernateTemplate = hibernateTemplate;
}

public List<UserDetails> orderList(User user){
	List<UserDetails> ulist = hibernateTemplate.execute(new HibernateCallback<List<UserDetails>>() {

		@Override
		public List<UserDetails> doInHibernate(Session arg0) throws HibernateException {
			Transaction t = arg0.beginTransaction();
			Criteria q = arg0.createCriteria(UserDetails.class);
			q.add(Restrictions.eq("userName", user.getUserName()));
			List<UserDetails> ul = q.list();
			t.commit();
			arg0.close();
			return ul;
		}
	
	});
	return ulist;

}

public List<UserDetails> UserList(){
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

}

