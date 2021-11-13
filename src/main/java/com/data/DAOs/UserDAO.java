package com.data.DAOs;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.criteria.*;
import javax.persistence.Query;

import com.DTOs.BusinessDtos.LoginDTO;
import com.data.DbUtil;
import com.model.CardList;
import com.model.Role;
import com.model.User;

import org.hibernate.*;

public class UserDAO {
	// SELECT ----------------------------------------------------
	public User getUser(String id) {
		Transaction transaction = null;
		int ids = Integer.parseInt(id);
		User user = null;
		try (Session session = DbUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			user = session.get(User.class, ids);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return user;
	}
	public int getUserByUserName(String username) {
		EntityManager em = DbUtil.getSessionFactory().createEntityManager();
		EntityTransaction trans =  em.getTransaction();
		String sql = "Select roles from User where username =:uname";
		Query q = em.createQuery(sql);
		q.setParameter("uname", username);
		try {
			trans.begin();
			int id = q.getFirstResult();
			trans.commit();
			return id;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			em.close();
		}
		return 0;
	}
	

	public void getPasswordHashAndSalt(LoginDTO loginDTO) {
		Transaction transaction = null;
		List<User> rsList = null;
		try (Session session = DbUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();

			CriteriaBuilder cb = session.getCriteriaBuilder();
			CriteriaQuery<User> cr = cb.createQuery(User.class);
			Root<User> root = cr.from(User.class);
			cr.multiselect(root.get("username"), root.get("passwordHash"), root.get("passwordSalt"));
			cr.where(cb.equal(root.get("username"), loginDTO.getUsername()));

			rsList = session.createQuery(cr).getResultList();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		if (rsList.size() > 0) {
			loginDTO.setPasswordHash(rsList.get(0).passwordHash);
			loginDTO.setPasswordSalt((rsList.get(0).passwordSalt));
		}
	}

	public Boolean isUsernameExisted(String username) {
		Transaction transaction = null;
		List<User> rsList = null;
		try (Session session = DbUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();

			CriteriaBuilder cb = session.getCriteriaBuilder();
			CriteriaQuery<User> cr = cb.createQuery(User.class);
			Root<User> root = cr.from(User.class);
			cr.multiselect(root.get("username"));
			cr.where(cb.equal(root.get("username"), username));

			rsList = session.createQuery(cr).getResultList();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		if (rsList.size() > 0) {
			return true;
		} else {
			return false;
		}
	}

	public Boolean isEmailExisted(String email) {
		Transaction transaction = null;
		List<User> rsList = null;
		try (Session session = DbUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();

			CriteriaBuilder cb = session.getCriteriaBuilder();
			CriteriaQuery<User> cr = cb.createQuery(User.class);
			Root<User> root = cr.from(User.class);
			cr.multiselect(root.get("username"), root.get("email"));
			cr.where(cb.equal(root.get("email"), email));

			rsList = session.createQuery(cr).getResultList();
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		if (rsList.size() > 0) {
			return true;
		} else {
			return false;
		}
	}

	// INSERT ----------------------------------------------------
	public void addUser(User user) {
		Transaction transaction = null;
		try (Session session = DbUtil.getSessionFactory().openSession()) {

			transaction = session.beginTransaction();
			session.save(user);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

	// UPDATE ----------------------------------------------------
	public void updateUser(User user) {
		Transaction transaction = null;
		try (Session session = DbUtil.getSessionFactory().openSession()) {

			transaction = session.beginTransaction();
			session.update(user);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

	// DELETE ----------------------------------------------------
	public User deleteUser(int id) {
		Transaction transaction = null;
		User user = null;
		try (Session session = DbUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			user = session.get(User.class, id);
			if (user != null) {
				session.delete(user);
			}
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return user;
	}
}
