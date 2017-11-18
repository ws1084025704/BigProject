package action;

import com.opensymphony.xwork2.ActionSupport;

import Dao.movieDao;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
import javax.swing.JOptionPane;
import org.apache.struts2.ServletActionContext;

public class FindMassageAction extends ActionSupport {

    private String search;
    private HttpServletRequest request;
    private String message="input";
    public String getSearch() {
        return search;
    }
    public void setSearch(String search) {
        this.search = search;
    }
    public void validate(){
        if(this.getSearch().equals("null")){
            message("暂无信息");
            addFieldError("search","暂无信息！");
        }
    }
    public String execute() throws Exception{
        request=ServletActionContext.getRequest();
        movieDao dao=new movieDao();
        List list=dao.findInfo("search", this.getSearch());
        request.getSession().setAttribute("oneInfo", list);
        message="success";
        return message;
    }

    public void message(String mess){
        int type=JOptionPane.YES_NO_OPTION;
        String title="remind";
        JOptionPane.showMessageDialog(null, mess, title, type);
    }

}
