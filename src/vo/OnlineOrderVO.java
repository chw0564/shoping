package vo;

import java.util.Date;

public class OnlineOrderVO {
    
	//订单信息
    private Integer id;

    private String orderno;

    private Double buynum;

    private Date buydate;
    
    private Integer ordersttus;

    //产品信息
    private Integer productid;
    
    private String productName;
    
    private Double productPrice;
    
    //产品了类型信息
    private Integer productTypeId;
    
    private String productTypeName;
    
    //用户信息
    private Integer userId;
    
    private String userName;

    private String userLoginName;
    
    //收货地址
    private Integer addressid;
    
    private String address;
    
    private String tel;
    
    private String linkMan;

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
		this.orderno = orderno;
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

	public Integer getOrdersttus() {
		return ordersttus;
	}

	public void setOrdersttus(Integer ordersttus) {
		this.ordersttus = ordersttus;
	}

	public Integer getProductid() {
		return productid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Double productPrice) {
		this.productPrice = productPrice;
	}

	public Integer getProductTypeId() {
		return productTypeId;
	}

	public void setProductTypeId(Integer productTypeId) {
		this.productTypeId = productTypeId;
	}

	public String getProductTypeName() {
		return productTypeName;
	}

	public void setProductTypeName(String productTypeName) {
		this.productTypeName = productTypeName;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserLoginName() {
		return userLoginName;
	}

	public void setUserLoginName(String userLoginName) {
		this.userLoginName = userLoginName;
	}

	public Integer getAddressid() {
		return addressid;
	}

	public void setAddressid(Integer addressid) {
		this.addressid = addressid;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getLinkMan() {
		return linkMan;
	}

	public void setLinkMan(String linkMan) {
		this.linkMan = linkMan;
	}
    
}