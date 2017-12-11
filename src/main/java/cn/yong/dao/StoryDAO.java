package cn.yong.dao;

import cn.yong.entity.Story;
import org.hibernate.Session;

import java.util.List;

public class StoryDAO {
    Session session = HibernateUtil.getSessionFactory().openSession();

    public void upload(Story story){
        session.beginTransaction();
        session.save(story);
        session.getTransaction().commit();
    }
    public List<Story> download(){
        String hql="From Story";
        List<Story> storys=session.createQuery(hql).list();
        return storys;
    }
    public List<Story> queryStories(String movieName){
        String hql="From Story Where "
    }
}
