package entity;

public class ProductType {
    
    private Integer id;

    
    private String producttypename;

    
    private Integer producttypestatus;

    
    public Integer getId() {
        return id;
    }

    
    public void setId(Integer id) {
        this.id = id;
    }

    
    public String getProducttypename() {
        return producttypename;
    }

    
    public void setProducttypename(String producttypename) {
        this.producttypename = producttypename == null ? null : producttypename.trim();
    }

    
    public Integer getProducttypestatus() {
        return producttypestatus;
    }

    
    public void setProducttypestatus(Integer producttypestatus) {
        this.producttypestatus = producttypestatus;
    }
}