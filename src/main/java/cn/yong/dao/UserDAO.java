package cn.yong.dao;

import cn.yong.entity.User;
import org.hibernate.Session;


public class UserDAO {
    Session session = HibernateUtil.getSessionFactory().openSession();

    public void showUsers() {

    }

    public void register(User user) {
        session.beginTransaction();
        session.save(user);
        session.getTransaction().commit();
    }
}
