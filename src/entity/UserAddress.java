package entity;

public class UserAddress {
    
    private Integer id;

    
    private String address;

    
    private String tel;

    
    private String linkname;

    
    private Integer userid;

    
    public Integer getId() {
        return id;
    }

    
    public void setId(Integer id) {
        this.id = id;
    }

    
    public String getAddress() {
        return address;
    }

    
    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    
    public String getTel() {
        return tel;
    }

    
    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    
    public String getLinkname() {
        return linkname;
    }

    
    public void setLinkname(String linkname) {
        this.linkname = linkname == null ? null : linkname.trim();
    }

    
    public Integer getUserid() {
        return userid;
    }

    
    public void setUserid(Integer userid) {
        this.userid = userid;
    }
}