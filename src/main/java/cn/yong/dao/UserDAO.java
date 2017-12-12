package cn.yong.dao;

import cn.yong.entity.User;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import javax.servlet.http.HttpSession;
import java.util.List;


public class UserDAO {


    public void register(User user) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        session.save(user);
        session.getTransaction().commit();
        session.close();
    }

    public String login(User user) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        String hql="Select U.password From User U Where U.username='"+user.getUsername()+"'";
        List ls=session.createQuery(hql).list();
        session.close();
        if(ls.isEmpty())
            return "error";
        else{
            String pwd=(String)ls.get(0);
            if(pwd.equals(user.getPassword())){
                HttpSession httpSession= ServletActionContext.getRequest().getSession();
                httpSession.setAttribute("username",user.getUsername());
                return "success";
            }
        }
        return "error";
    }
}
