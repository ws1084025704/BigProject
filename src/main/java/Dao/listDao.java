package Dao;

import PO.InformationEntity;
import hibernate.HibernateUtil;

import javax.management.Query;
import javax.swing.*;
import java.util.List;

public class listDao {
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





}
