package cn.yong.entity;

import javax.persistence.*;

@Entity
@Table(name = "story", schema = "Movie")
public class Story {
    private int id;
    private String username;
    private String movieName;
    private String details;
    private String imgPath;
    private double lng;
    private double lat;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "username")
    public String getUsername() { return username; }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "movieName")
    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    @Basic
    @Column(name = "details")
    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    @Basic
    @Column(name = "imgPath")
    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    @Basic
    @Column(name = "lng")
    public double getLng() {
        return lng;
    }

    public void setLng(double lng) {
        this.lng = lng;
    }

    @Basic
    @Column(name = "lat")
    public double getLat() {
        return lat;
    }

    public void setLat(double lat) {
        this.lat = lat;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Story that = (Story) o;

        if (id != that.id) return false;
        if (Double.compare(that.lng, lng) != 0) return false;
        if (Double.compare(that.lat, lat) != 0) return false;
        if (movieName != null ? !movieName.equals(that.movieName) : that.movieName != null) return false;
        if (details != null ? !details.equals(that.details) : that.details != null) return false;
        return imgPath != null ? imgPath.equals(that.imgPath) : that.imgPath == null;
    }

    @Override
    public int hashCode() {
        int result;
        long temp;
        result = id;
        result = 31 * result + (movieName != null ? movieName.hashCode() : 0);
        result = 31 * result + (details != null ? details.hashCode() : 0);
        result = 31 * result + (imgPath != null ? imgPath.hashCode() : 0);
        temp = Double.doubleToLongBits(lng);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        temp = Double.doubleToLongBits(lat);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        return result;
    }
}
