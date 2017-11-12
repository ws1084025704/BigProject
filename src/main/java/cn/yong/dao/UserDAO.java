package cn.yong.dao;

import cn.yong.entity.User;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;

import javax.servlet.http.HttpSession;
import java.util.List;


public class UserDAO {
    Session session = HibernateUtil.getSessionFactory().openSession();


    public void register(User user) {
        session.beginTransaction();
        session.save(user);
        session.getTransaction().commit();
    }

    public String login(User user) {
        String hql="Select U.password From User U Where U.username='"+user.getUsername()+"'";
        List ls=session.createQuery(hql).list();
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
