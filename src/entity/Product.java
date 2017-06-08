package entity;

public class Product {
    
    private Integer id;

    
    private String proname;

    
    private Double proprice;

    
    private String imgurl;

    
    private Integer typeid;

    
    private Integer prostatus;

    
    public Integer getId() {
        return id;
    }

    
    public void setId(Integer id) {
        this.id = id;
    }

    
    public String getProname() {
        return proname;
    }

    
    public void setProname(String proname) {
        this.proname = proname == null ? null : proname.trim();
    }

    
    public Double getProprice() {
        return proprice;
    }

    
    public void setProprice(Double proprice) {
        this.proprice = proprice;
    }

    
    public String getImgurl() {
        return imgurl;
    }

    
    public void setImgurl(String imgurl) {
        this.imgurl = imgurl == null ? null : imgurl.trim();
    }

    
    public Integer getTypeid() {
        return typeid;
    }

    
    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    
    public Integer getProstatus() {
        return prostatus;
    }

    
    public void setProstatus(Integer prostatus) {
        this.prostatus = prostatus;
    }


	@Override
	public String toString() {
		return "Product [id=" + id + ", proname=" + proname + ", proprice="
				+ proprice + ", imgurl=" + imgurl + ", typeid=" + typeid
				+ ", prostatus=" + prostatus + "]";
	}
}