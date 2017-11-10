package cn.yong.action;

import cn.yong.dao.UserDAO;
import cn.yong.entity.User;

public class UserActions {
    private User newUser;
    UserDAO dao= new UserDAO();
    public User getNewUser() {
        return newUser;
    }

    public void setNewUser(User newUser) {
        this.newUser = newUser;
    }

    public String register() {
        dao.register(newUser);
        return "success";
    }
}
