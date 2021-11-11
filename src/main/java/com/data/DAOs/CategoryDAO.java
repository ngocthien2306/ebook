package com.data.DAOs;

import com.model.Category;
import com.data.DbUtil;
import org.hibernate.*;

public class CategoryDAO {
    // SELECT ----------------------------------------------------
    // INSERT ----------------------------------------------------
    public void addCategory(Category category) {
        Transaction transaction = null;
        try (Session session = DbUtil.getSessionFactory().openSession()) {

            transaction = session.beginTransaction();
            session.save(category);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    // UPDATE ----------------------------------------------------
    public void updateCategory(Category category) {
        Transaction transaction = null;
        try (Session session = DbUtil.getSessionFactory().openSession()) {

            transaction = session.beginTransaction();
            session.update(category);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    // DELETE ----------------------------------------------------
    public Category deleteCategory(int id) {
        Transaction transaction = null;
        Category category = null;
        try (Session session = DbUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            category = session.get(Category.class, id);
            if (category != null) {
                session.delete(category);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return category;
    }
}
