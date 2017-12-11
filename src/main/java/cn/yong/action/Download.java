package cn.yong.action;

import cn.yong.dao.StoryDAO;
import cn.yong.entity.Story;

import java.util.ArrayList;
import java.util.List;

public class Download {
    List<Story> storys = new ArrayList<Story>();
    StoryDAO storydao = new StoryDAO();
    List<Story> table_Storys = new ArrayList<Story>();

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    String movieName;
    public List<Story> getTable_Storys() {
        return table_Storys;
    }

    public void setTable_Storys(List<Story> table_Storys) {
        this.table_Storys = table_Storys;
    }

    public List<Story> getStorys() {
        return storys;
    }

    public void setStorys(List<Story> storys) {
        this.storys = storys;
    }

    public String getMarkers() {
        storys = storydao.download();
        return "success";
    }

    public String getTable(){
        table_Storys=storydao.;
        return "success";
    }
}
