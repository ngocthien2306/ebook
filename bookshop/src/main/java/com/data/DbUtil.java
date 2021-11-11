package com.data;

import java.util.Properties;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import com.model.CardList;
import com.model.Category;
import com.model.MyProduct;
import com.model.Product;
import com.model.Role;
import com.model.User;

public class DbUtil {
  private static SessionFactory sessionFactory;

  public static SessionFactory getSessionFactory() {
    if (sessionFactory == null) {
      try {
        Configuration configuration = new Configuration();

        // Hibernate settings equivalent to hibernate.cfg.xml's properties
        Properties settings = new Properties();
        settings.put(Environment.DRIVER, "com.mysql.jdbc.Driver");
        settings.put(Environment.URL, "jdbc:mysql://localhost:3306/book_store?useSSL=false");
        settings.put(Environment.USER, "root");
        settings.put(Environment.PASS, "ngocthien2306.com");
        settings.put(Environment.DIALECT, "org.hibernate.dialect.MySQL5Dialect");

        settings.put(Environment.SHOW_SQL, "true");

        settings.put(Environment.CURRENT_SESSION_CONTEXT_CLASS, "thread");

        //settings.put(Environment.HBM2DDL_AUTO, "update");
        //settings.put(Environment.HBM2DDL_AUTO, "create-drop");

        configuration.setProperties(settings);
        configuration.addAnnotatedClass(Category.class);
        configuration.addAnnotatedClass(Product.class);
        configuration.addAnnotatedClass(User.class);
        configuration.addAnnotatedClass(MyProduct.class);
        configuration.addAnnotatedClass(Role.class);
        //configuration.addAnnotatedClass(Item.class);
        configuration.addAnnotatedClass(CardList.class);

        ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
            .applySettings(configuration.getProperties()).build();
        System.out.println("Hibernate Java Config serviceRegistry created");
        sessionFactory = configuration.buildSessionFactory(serviceRegistry);
        return sessionFactory;

      } catch (Exception e) {
        e.printStackTrace();
      }
    }
    return sessionFactory;
  }

  public static void shutdown() {
    getSessionFactory().close();
  }
}