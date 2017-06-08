package util;

public class AjaxResult {
	private Boolean flag;
	
	private String msg;
	
	private Object data;

	public AjaxResult() {
		super();
	}

	public AjaxResult(Boolean flag, String msg, Object data) {
		super();
		this.flag = flag;
		this.msg = msg;
		this.data = data;
	}

	public Boolean getFlag() {
		return flag;
	}

	public void setFlag(Boolean flag) {
		this.flag = flag;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
	
}
