package constant;

public interface shopingConstant {

	public interface productType{
		public static final Integer PRODYCT_TYPE_OPEN = 1;
		public static final Integer PRODYCT_TYPE_CLOSE  = 0;
	}
	
	public interface SysUser{
		public static final Integer SUPER_SYSTEM_USER = 1;
		public static final Integer ADMIN_SYSTEM_USER  = 3;
		public static final Integer SYSTEM_USER_CLOSE  = 2;
		public static final String DEFAULT_PASSWORD  = "000000";
	}
	
	public interface Product{
		public static final Integer PRODUCT_OPEN = 1;
		public static final Integer PRODUCT_CLOSE  = 2;
	}
	
	public interface MemberUser{
		public static final String DEFAULT_PASSWORD  = "123456";
	}
	
	public interface OnlineOrder{
		public static final Integer ORDER_OPEN = 1;
		public static final Integer ORDER_CONFIRM  = 2;
		public static final Integer ORDER_CLOSE  = 3;
	}
}
