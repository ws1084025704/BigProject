package cn.yong.action;

import cn.yong.dao.UserDAO;
import cn.yong.entity.User;

public class UserActions {
    private User user;
    UserDAO dao= new UserDAO();


    public String register() {
        dao.register(user);
        return "success";
    }
    public String login() {
        return dao.login(user);

    }
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


}
