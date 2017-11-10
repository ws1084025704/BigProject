package action;

import com.opensymphony.xwork2.ActionSupport;

import org.apache.struts2.ServletActionContext;

import java.util.List;
import Dao.movieDao;

import javax.servlet.http.HttpServletRequest;

public class ListAllAction extends ActionSupport {


    private HttpServletRequest request;
    private String message="input";
    public String execute() throws Exception{
        request= ServletActionContext.getRequest();
        movieDao dao=new movieDao();
        List list=dao.findAllInfo();
        request.getSession().setAttribute("count", list.size());
        request.getSession().setAttribute("allInfo", list);
        message="success";
        return message;
    }
}
