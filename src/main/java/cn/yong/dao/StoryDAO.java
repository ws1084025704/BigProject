package cn.yong.dao;

import cn.yong.entity.Story;
import org.hibernate.Session;

import java.util.List;

public class StoryDAO {

    public void upload(Story story){
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(story);
        session.getTransaction().commit();
        session.close();
    }
    public List<Story> download(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql="From Story";
        List<Story> storys=session.createQuery(hql).list();
        session.close();
        return storys;
    }
    public List<Story> queryStories(String movieName){
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql="From Story Where movieName like '%"+movieName+"%'";
        List<Story> stories=session.createQuery(hql).list();
        session.close();
        return stories;
    }
}
