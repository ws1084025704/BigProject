package Dao;

import hibernate.HibernateUtil;
import PO.InformationEntity;
import java.util.List;
import javax.swing.JOptionPane;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class userDao {
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
