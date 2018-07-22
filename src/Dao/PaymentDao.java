package Dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import dto.Payment;
import dto.User;


@Repository
public class PaymentDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;

	public PaymentDao() {
		super();
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	public List<Payment> paymentList(){
		List<Payment> ulist = hibernateTemplate.execute(new HibernateCallback<List<Payment>>() {

			@Override
			public List<Payment> doInHibernate(Session arg0) throws HibernateException 
			{
				Transaction t = arg0.beginTransaction();
				Criteria q = arg0.createCriteria(Payment.class);
				List<Payment> ul = q.list();
				t.commit();
				arg0.close();
				return ul;
			}
		
		});
		return ulist;
	}
	

}
