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

import dto.OrderDetails;
import dto.User;

@Repository
public class OrderDao {

	@Autowired
	private HibernateTemplate hibernateTemplate;

	public OrderDao() {
		super();
		// TODO Auto-generated constructor stub
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	
	public List<OrderDetails> orderList(User user){
		List<OrderDetails> ulist = hibernateTemplate.execute(new HibernateCallback<List<OrderDetails>>() {

			@Override
			public List<OrderDetails> doInHibernate(Session arg0) throws HibernateException {
				Transaction t = arg0.beginTransaction();
				Criteria q = arg0.createCriteria(OrderDetails.class);
				q.add(Restrictions.eq("userId", user.getUserName()));
				List<OrderDetails> ul = q.list();
				t.commit();
				arg0.close();
				return ul;
			}
		
		});
		return ulist;
	
}
	}
