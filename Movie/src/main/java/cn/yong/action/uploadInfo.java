package cn.yong.action;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

public class uploadInfo {
    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    private String movieName;
    private String details;
    private File myFile;
    private String myFileContentType;
    private String myFileFileName;
    private float lng;
    private float lat;
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


    public String execute() {
        System.out.println("纬度为："+lat);
        String destPath;
        try {
            System.out.println("Src File name: " + myFile);
            System.out.println("Dst File name: " + myFileFileName);
            System.out.println(myFileContentType);
            ServletContext sc=ServletActionContext.getServletContext();
            destPath=sc.getRealPath("img");
            File destFile = new File(destPath, myFileFileName);
            FileUtils.copyFile(myFile, destFile);
        } catch (IOException e) {
            e.printStackTrace();
            return "error";
        }

        HttpSession session = ServletActionContext.getRequest().getSession(false);
        session.removeAttribute("movieName");
        session.setAttribute("movieName",movieName);
        session.removeAttribute("details");
        session.setAttribute("details",details);
        session.removeAttribute("imageName");
        session.setAttribute("imageName","img/"+myFileFileName);
        return "success";
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
}
