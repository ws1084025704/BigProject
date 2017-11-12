package cn.yong.action;

import cn.yong.dao.StoryDAO;
import cn.yong.entity.Story;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

public class Upload {
    Story story;
    StoryDAO dao= new StoryDAO();
    private File myFile;
    private String myFileContentType;
    private String myFileFileName;
    private float lng;

    public float getLng() {
        return lng;
    }

    public void setLng(float lng) {
        this.lng = lng;
    }

    public float getLat() {
        return lat;
    }

    public void setLat(float lat) {
        this.lat = lat;
    }

    private float lat;
    public Story getStory() {
        return story;
    }

    public void setStory(Story story) {
        this.story = story;
    }

    public File getMyFile() {
        return myFile;
    }

    public void setMyFile(File myFile) {
        this.myFile = myFile;
    }

    public String getMyFileContentType() {
        return myFileContentType;
    }

    public void setMyFileContentType(String myFileContentType) {
        this.myFileContentType = myFileContentType;
    }

    public String getMyFileFileName() {
        return myFileFileName;
    }

    public void setMyFileFileName(String myFileFileName) {
        this.myFileFileName = myFileFileName;
    }

    public String upload()
    {
        HttpSession httpSession = ServletActionContext.getRequest().getSession();
        story.setUsername((String)httpSession.getAttribute("username"));
        try {
            String destPath;
            System.out.println(myFileContentType);
            ServletContext sc= ServletActionContext.getServletContext();
            destPath=sc.getRealPath("img");
            File destFile = new File(destPath, myFileFileName);
            FileUtils.copyFile(myFile, destFile);
        } catch (IOException e) {
            e.printStackTrace();
            return "error";
        }
        story.setImgPath("/img/"+myFileFileName);
        story.setLng(lng);
        story.setLat(lat);

        dao.upload(story);
        return "success";
    }
}
