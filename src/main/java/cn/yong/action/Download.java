package cn.yong.action;

import cn.yong.dao.StoryDAO;
import cn.yong.entity.Story;

import java.util.ArrayList;
import java.util.List;

public class Download {
    List<Story> storys=new ArrayList<Story>();
    StoryDAO storydao=new StoryDAO();
    public List<Story> getStorys() {
        return storys;
    }

    public void setStorys(List<Story> storys) {
        this.storys = storys;
    }
    public String getMarkers()
    {
        storys=storydao.download();
        return "success";
    }

}
