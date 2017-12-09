package Dao;

import hibernate.HibernateUtil;
import PO.InformationEntity;
import java.util.List;
import javax.swing.JOptionPane;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class movieDao {
    private Transaction transaction;
    private Session session;
    private Query query;
    public movieDao(){
    }
    public boolean  saveInfo(InformationEntity info){
        try{
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            transaction=session.beginTransaction();
            session.save(info);
            transaction.commit();
            session.close();
            return true;
        }catch(Exception e){
            message("saveInfo.error:"+e);
            e.printStackTrace();
            return false;
        }
    }

    public List findAllInfo(){
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try{
            transaction=session.beginTransaction();
            String queryString="from InformationEntity";
            query=session.createQuery(queryString);
            List list=query.list();
            transaction.commit();

            return list;
        }catch(Exception e){
            message("findInfo.error:"+e);
            e.printStackTrace();
            return null;
        }
    }


    public List<InformationEntity> findInfo(String type,Object value){
        session=HibernateUtil.getSessionFactory().getCurrentSession();
        if(session==null){
            System.out.println("dao中session是空的");
        }
        try{
            transaction=session.beginTransaction();
            String queryString="from InformationEntity as model where model.movieName like '%\"+sname+\"%'";

            query=session.createQuery(queryString);

            List<InformationEntity>  list=query.list();
            transaction.commit();

            return list;
        }catch(Exception e){
            message("findInfo.error:"+e);
            e.printStackTrace();
            return null;
        }
    }





    public void message(String mess){
        int type=JOptionPane.YES_NO_OPTION;
        String title="提示信息";
        JOptionPane.showMessageDialog(null, mess, title, type);
    }

    public void message(String mess){
        int type=JOptionPane.YES_NO_OPTION;
        String title="提示信息";
        JOptionPane.showMessageDialog(null, mess, title, type);
    }
}
