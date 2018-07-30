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
import dto.Payment;
import dto.User;


@Repository
public class PaymentDao {
	@Autowired
	Payment payment;
	
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
	
	public List<Payment> paymentList(String uid){
		List<Payment> ulist = hibernateTemplate.execute(new HibernateCallback<List<Payment>>() {

			@Override
			public List<Payment> doInHibernate(Session arg0) throws HibernateException 
			{
				Transaction t = arg0.beginTransaction();
				Criteria q = arg0.createCriteria(Payment.class);
				q.add(Restrictions.eq("userId",uid));
				List<Payment> ul = q.list();
				t.commit();
				arg0.close();
				return ul;
			}
		
		});
		return ulist;
	}
	
	public List<Payment> UserPaymentList(User user){
		List<Payment> ulist = hibernateTemplate.execute(new HibernateCallback<List<Payment>>() {

			@Override
			public List<Payment> doInHibernate(Session arg0) throws HibernateException 
			{
				Transaction t = arg0.beginTransaction();
				Criteria q = arg0.createCriteria(Payment.class);
				q.add(Restrictions.eq("userId",user.getUserName()));
				List<Payment> ul = q.list();
				t.commit();
				arg0.close();
				return ul;
			}
		
		});
		return ulist;
	}
	
	public void PayInstallments(Payment payment1) {
		this.payment=payment1;
		hibernateTemplate.execute(new HibernateCallback<User>() {
			
			@Override
			public User doInHibernate(Session arg0) throws HibernateException {
				Transaction t = arg0.beginTransaction();
				arg0.save(payment);
				t.commit();
				arg0.flush();
				arg0.close();
				return null;
			}
		
		});
	}
	
	public void InsertPayment(Payment o) {
		this.payment=o;
		hibernateTemplate.execute(new HibernateCallback<User>() {
			
			@Override
			public User doInHibernate(Session arg0) throws HibernateException {
				Transaction t = arg0.beginTransaction();
				arg0.save(payment);
				t.commit();
				arg0.flush();
				arg0.close();
				return null;
			}
		
		});
	}
	
	

}
