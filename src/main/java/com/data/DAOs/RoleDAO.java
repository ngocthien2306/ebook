package com.data.DAOs;

import com.model.Role;
import org.hibernate.*;

import java.util.Iterator;
import java.util.List;
import javax.persistence.criteria.*;

import com.data.DbUtil;

public class RoleDAO {
    // SELECT ----------------------------------------------------
    public Role getRoleByName(String name) {
        Transaction transaction = null;
        List<Role> rsList = null;
        Role role = null;
        try (Session session = DbUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();

            CriteriaBuilder cb = session.getCriteriaBuilder();
            CriteriaQuery<Role> cr = cb.createQuery(Role.class);
            Root<Role> root = cr.from(Role.class);
            cr.select(root);
            cr.where(cb.equal(root.get("name"), name));

            rsList = session.createQuery(cr).getResultList();
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        for(Iterator<Role> i = rsList.iterator(); i.hasNext();) {
        	role = i.next();
        }
        return role;
    }

    // INSERT ----------------------------------------------------
    public void addRole(Role role) {
        Transaction transaction = null;
        try (Session session = DbUtil.getSessionFactory().openSession()) {

            transaction = session.beginTransaction();
            session.save(role);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    // UPDATE ----------------------------------------------------
    public void updateRole(Role role) {
        Transaction transaction = null;
        try (Session session = DbUtil.getSessionFactory().openSession()) {

            transaction = session.beginTransaction();
            session.update(role);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    // DELETE ----------------------------------------------------
    public Role deleteRole(int id) {
        Transaction transaction = null;
        Role role = null;
        try (Session session = DbUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            role = session.get(Role.class, id);
            if (role != null) {
                session.delete(role);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
        return role;
    }
}
