package com.data.DAOs;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.data.DbUtil;
import com.model.History;

public class HistoryDao {
	public HistoryDao() {}
	
	public void addBillofUser(History his) {
		Transaction transaction = null;
		try (Session session = DbUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.save(his);
			transaction.commit();
		}
		catch (Exception e) {
			if(transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}
}
