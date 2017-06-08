package exception;

public class SysUserException extends Exception {

	private static final long serialVersionUID = 1L;

	public SysUserException() {
		super();
	}

	public SysUserException(String message, Throwable cause) {
		super(message, cause);
	}

	public SysUserException(String message) {
		super(message);
	}

	public SysUserException(Throwable cause) {
		super(cause);
	}

	
}
