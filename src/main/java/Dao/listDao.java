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





}
