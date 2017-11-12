package cn.yong.action;

import cn.yong.entity.User;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;


public class loginAction{
    private User user;

    public String validateUser() {
        if ("yong".equals(user.getUsername())) {
            HttpSession session= ServletActionContext.getRequest().getSession();
            session.setAttribute("username","yong");
            return "success";
        } else
            return "error";
    }

//    @Override
//    public void validate() {
//        if (user.getUsername() == null || user.getUsername().trim().equals(""))
//            addFieldError("user.username", "请输入正确的用户名xx");
//        if (user.getPassword() == null || user.getPassword().trim().equals(""))
//            addFieldError("user.password", "密码不能为空");
//    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
