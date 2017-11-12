package cn.yong.dao;

import cn.yong.entity.Story;
import org.hibernate.Session;

public class StoryDAO {
    Session session = HibernateUtil.getSessionFactory().openSession();

    public void upload(Story story){
        session.beginTransaction();
        session.save(story);
        session.getTransaction().commit();
    }
}
