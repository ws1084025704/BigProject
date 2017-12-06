package PO;

@javax.persistence.Entity
@javax.persistence.Table(name = "information", schema = "movieInfo")
public class InformationEntity {
    private String pointId;
    private String userId;
    private String longitude;
    private String latitude;
    private String info;
    private String movieName;

    @javax.persistence.Id
    @javax.persistence.Column(name = "pointID", nullable = false, length = 100)
    public String getPointId() {
        return pointId;
    }

    public void setPointId(String pointId) {
        this.pointId = pointId;
    }

    @javax.persistence.Basic
    @javax.persistence.Column(name = "userID", nullable = false, length = 45)
    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    @javax.persistence.Basic
    @javax.persistence.Column(name = "longitude", nullable = false, length = 45)
    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    @javax.persistence.Basic
    @javax.persistence.Column(name = "latitude", nullable = false, length = 45)
    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    @javax.persistence.Basic
    @javax.persistence.Column(name = "info", nullable = true, length = 100)
    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    @javax.persistence.Basic
    @javax.persistence.Column(name = "movieName", nullable = false, length = 100)
    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        InformationEntity that = (InformationEntity) o;

        if (pointId != null ? !pointId.equals(that.pointId) : that.pointId != null) return false;
        if (userId != null ? !userId.equals(that.userId) : that.userId != null) return false;
        if (longitude != null ? !longitude.equals(that.longitude) : that.longitude != null) return false;
        if (latitude != null ? !latitude.equals(that.latitude) : that.latitude != null) return false;
        if (info != null ? !info.equals(that.info) : that.info != null) return false;
        if (movieName != null ? !movieName.equals(that.movieName) : that.movieName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = pointId != null ? pointId.hashCode() : 0;
        result = 31 * result + (userId != null ? userId.hashCode() : 0);
        result = 31 * result + (longitude != null ? longitude.hashCode() : 0);
        result = 31 * result + (latitude != null ? latitude.hashCode() : 0);
        result = 31 * result + (info != null ? info.hashCode() : 0);
        result = 31 * result + (movieName != null ? movieName.hashCode() : 0);
        return result;
    }
}
