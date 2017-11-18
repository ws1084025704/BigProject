package action;

import Dao.movieDao;
import PO.InformationEntity;

import java.util.ArrayList;
import java.util.List;

public class Search {
    private List<InformationEntity> list = new ArrayList<InformationEntity>();

    public List<InformationEntity> getList() {
        return list;
    }

    public void setList(List<InformationEntity> list) {
        this.list = list;
    }

    private HttpServletRequest request;
    private String message = "input";

    public String execute() throws Exception {
        try {
            request = ServletActionContext.getRequest();
            movieDao dao = new movieDao();
            List list = dao.findAllInfo();
            request.getSession().setAttribute("count", list.size());
            request.getSession().setAttribute("allInfo", list);
            message = "success";
            return message;

        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            request = ServletActionContext.getRequest();
            movieDao dao = new movieDao();
            List list = dao.findAllInfo();
            request.getSession().setAttribute("count", list.size());
            request.getSession().setAttribute("allInfo", list);
            message = "success";
            return message;

        } catch (Exception e) {
            e.printStackTrace();
        }


        return message;

    }
}
