package action;


import PO.InformationEntity;
import com.opensymphony.xwork2.ActionSupport;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import Dao.movieDao;



public class turnAction extends ActionSupport {
    private List<InformationEntity> list = new ArrayList<InformationEntity>();

    public List<InformationEntity> getList() {
        return list;
    }

    public void setList(List<InformationEntity> list) {
        this.list = list;
    }

    public String execute() throws Exception {

        return "success";

    }

    public String getid() throws Exception {
        movieDao dao = new movieDao();
        list = dao.findAllInfo();
        return "success";

    }

    public String getid() throws Exception {
        movieDao dao = new movieDao();
        list = dao.findAllInfo();
        return "success";

    }
}