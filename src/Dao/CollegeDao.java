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

import dto.Admindto;
import dto.Collegedto;
import dto.Payment;
import dto.User;
import dto.UserDetails;


@Repository
public class CollegeDao {
	@Autowired
	Collegedto college;
	@Autowired
	private HibernateTemplate hibernateTemplate;

	public CollegeDao() {
		super();
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	public List<UserDetails> studentsList(String code){
		List<UserDetails> ulist = hibernateTemplate.execute(new HibernateCallback<List<UserDetails>>() {

			@Override
			public List<UserDetails> doInHibernate(Session arg0) throws HibernateException 
			{
				Transaction t = arg0.beginTransaction();
				Criteria q = arg0.createCriteria(UserDetails.class);
				q.add(Restrictions.and(Restrictions.eq("CollegeCode", code), Restrictions.ne("status","Verified")));
				List<UserDetails> ul = q.list();
				t.commit();
				arg0.close();
				return ul;
			}
		
		});
		return ulist;
	}
	
	public boolean checkUser(Collegedto user){
		
		List<Collegedto> ulist = hibernateTemplate.execute(new HibernateCallback<List<Collegedto>>() {

			@Override
			public List<Collegedto> doInHibernate(Session arg0) throws HibernateException {
				Transaction t = arg0.beginTransaction();
				Criteria q = arg0.createCriteria(Collegedto.class);
				q.add(Restrictions.and(Restrictions.eq("userid", user.getUserid()), Restrictions.eq("password", user.getPassword())));
				List<Collegedto> ul = q.list();
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
	


}
