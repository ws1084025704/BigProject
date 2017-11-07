package cn.sifan.action;


import cn.sifan.InformationEntity;
import com.googlecode.s2hibernate.struts2.plugin.annotations.SessionTarget;
import com.googlecode.s2hibernate.struts2.plugin.annotations.TransactionTarget;
import com.opensymphony.xwork2.ActionSupport;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;




public class ListAllAction extends ActionSupport {
    //使用@SessionTarget标注得到Hibernate Session
    @SessionTarget
    private Session session = null;
    //使用@TransactionTarget标注得到Hibernate Transaction
    @TransactionTarget
    private Transaction transaction = null;
    private List<InformationEntity> points;
    public String list(){
        try{
            //得到user表中的所有记录
            points = session.createCriteria(InformationEntity.class).list();
            transaction.commit();
            session.close();
            return SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ERROR;
        }
    }
    public List<InformationEntity> pointID(){
        return points;
    }
    public void setPointID(List<InformationEntity> points){
        this.points = points;
    }

}
