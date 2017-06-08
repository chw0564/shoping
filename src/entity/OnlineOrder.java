package entity;

import java.util.Date;

public class OnlineOrder {
    
    private Integer id;

    
    private String orderno;

    
    private Integer productid;

    private Product product;
    
    private Integer userid;

    
    private Double buynum;

    
    private Date buydate;

    
    private Integer addressid;

    
    private Integer ordersttus;

    
    public void addBuyNum(Integer buyNum) {
        this.buynum+=buyNum;
    }
    
    public OnlineOrder(Integer productid, Double buynum,Product product) {
		super();
		this.productid = productid;
		this.buynum = buynum;
		this.product = product;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public OnlineOrder() {
		super();
	}


	public Integer getId() {
        return id;
    }

    
    public void setId(Integer id) {
        this.id = id;
    }

    
    public String getOrderno() {
        return orderno;
    }

    
    public void setOrderno(String orderno) {
        this.orderno = orderno == null ? null : orderno.trim();
    }

    
    public Integer getProductid() {
        return productid;
    }

    
    public void setProductid(Integer productid) {
        this.productid = productid;
    }

    
    public Integer getUserid() {
        return userid;
    }

    
    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    
    public Double getBuynum() {
        return buynum;
    }

    
    public void setBuynum(Double buynum) {
        this.buynum = buynum;
    }

    
    public Date getBuydate() {
        return buydate;
    }

    
    public void setBuydate(Date buydate) {
        this.buydate = buydate;
    }

    
    public Integer getAddressid() {
        return addressid;
    }

    
    public void setAddressid(Integer addressid) {
        this.addressid = addressid;
    }

    
    public Integer getOrdersttus() {
        return ordersttus;
    }

    
    public void setOrdersttus(Integer ordersttus) {
        this.ordersttus = ordersttus;
    }
}