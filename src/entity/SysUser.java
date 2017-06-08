package entity;

public class SysUser {
    
    private Integer id;

    
    private String username;

    
    private String loginname;

    
    private String loginpassword;

    
    private Integer sysuserstatus;

    
    public Integer getId() {
        return id;
    }

    
    public void setId(Integer id) {
        this.id = id;
    }

    
    public String getUsername() {
        return username;
    }

    
    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    
    public String getLoginname() {
        return loginname;
    }

    
    public void setLoginname(String loginname) {
        this.loginname = loginname == null ? null : loginname.trim();
    }

    
    public String getLoginpassword() {
        return loginpassword;
    }

    
    public void setLoginpassword(String loginpassword) {
        this.loginpassword = loginpassword == null ? null : loginpassword.trim();
    }

    
    public Integer getSysuserstatus() {
        return sysuserstatus;
    }

    
    public void setSysuserstatus(Integer sysuserstatus) {
        this.sysuserstatus = sysuserstatus;
    }
}