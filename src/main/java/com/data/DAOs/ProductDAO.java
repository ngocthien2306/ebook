package com.data.DAOs;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

import org.hibernate.*;
import com.data.DbUtil;
import com.model.Product;

public class ProductDAO {
	public ProductDAO() {
	}

	@SuppressWarnings("unchecked")
	public List<Product> getProducts() throws Exception {
		try {
			return DbUtil.getSessionFactory().openSession().createQuery("From Product").getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	public void addProducts(Product product) {
		Transaction transaction = null;
		try (Session session = DbUtil.getSessionFactory().openSession()) {
			transaction = session.beginTransaction();
			session.save(product);
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

	public void updateProducts(Product product) {
		EntityManager em = DbUtil.getSessionFactory().createEntityManager();
		EntityTransaction trans = em.getTransaction();
		trans.begin();
		try {
			Product theProduct = em.find(Product.class, product.getId());
			theProduct.setNameAuthor(product.getNameAuthor());
			theProduct.setNXB(product.getNXB());
			theProduct.setProductName(product.getProductName());
			theProduct.setDescription(product.getDescription());
			theProduct.setPrice(product.getPrice());
			theProduct.setSupplier(product.getSupplier());
			em.merge(theProduct);
			trans.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
		} 
		finally {
			em.close();
		}
	}

	public void deleteProduct(int id) {
		Transaction transaction = null;
		Product product = null;
		try (Session session = DbUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			product = session.get(Product.class, id);
			if (product != null) {
				session.delete(product);
			}
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
	}

	public Product getProduct(int id) {
		Transaction transaction = null;

		Product product = null;
		try (Session session = DbUtil.getSessionFactory().openSession()) {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			product = session.get(Product.class, id);
			// commit transaction
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			e.printStackTrace();
		}
		return product;
	}
	/*
	 * public void addProduct(Product theProduct) throws ClassNotFoundException,
	 * SQLException { Connection myCon = null; PreparedStatement myPreS = null;
	 * 
	 * try { myCon = db.getConnection(); String insertProductQuery =
	 * "insert into product (name, description, price) values (?, ?, ?)"; myPreS =
	 * myCon.prepareStatement(insertProductQuery); myPreS.setString(1,
	 * theProduct.getNameAuthor()); myPreS.setString(2,
	 * theProduct.getDescription()); myPreS.setInt(3, theProduct.getPrice());
	 * myPreS.execute(); } finally { db.closeConnection(myCon, myPreS, null); } }
	 */
	/*
	 * public Product getProducts(String theProductId) throws Exception { Product
	 * theProduct = null; Connection myCon = null; PreparedStatement myPres = null;
	 * ResultSet myRes = null; int productId; try { productId =
	 * Integer.parseInt(theProductId); myCon = db.getConnection(); String sql =
	 * "select * from product where id=?"; myPres = myCon.prepareStatement(sql);
	 * myPres.setInt(1, productId); myRes = myPres.executeQuery(); if(myRes.next())
	 * { String name = myRes.getString("nameAuthor"); String des =
	 * myRes.getString("description"); int price = myRes.getInt("price"); //double
	 * discount = price * 0.08; theProduct = new Product(name, des, price, ""); }
	 * else { throw new Exception("Could not fount the product id: " + productId); }
	 * return theProduct; } finally { db.closeConnection(myCon, myPres, myRes); }
	 * 
	 * }
	 */
}
