package action;

import PO.InformationEntity;
import com.opensymphony.xwork2.ActionSupport;

import org.apache.struts2.ServletActionContext;

import java.util.ArrayList;
import java.util.List;
import Dao.movieDao;

import javax.servlet.http.HttpServletRequest;

public class ListAllAction extends ActionSupport {

    private List<InformationEntity> list=new ArrayList<InformationEntity>();
    public List<InformationEntity> getList() {
        return list;
    }

    public void setList(List<InformationEntity> list) {
        this.list = list;
    }
    private HttpServletRequest request;
    private String message="input";
    public String execute() throws Exception{
        try{
            request= ServletActionContext.getRequest();
            movieDao dao=new movieDao();
            List list=dao.findAllInfo();
            request.getSession().setAttribute("count", list.size());
            request.getSession().setAttribute("allInfo", list);
            message="success";
            return message;

        }catch (Exception e) {
            e.printStackTrace();
        }
        return message;

    }

   
}
