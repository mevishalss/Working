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
import dto.User;

@Repository
public class AdminDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;

	public AdminDao() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}


	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public boolean checkUser(Admindto user){
		
		List<Admindto> ulist = hibernateTemplate.execute(new HibernateCallback<List<Admindto>>() {

			@Override
			public List<Admindto> doInHibernate(Session arg0) throws HibernateException {
				Transaction t = arg0.beginTransaction();
				Criteria q = arg0.createCriteria(Admindto.class);
				q.add(Restrictions.and(Restrictions.eq("userId", user.getUserId()), Restrictions.eq("password", user.getPassword())));
				List<Admindto> ul = q.list();
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