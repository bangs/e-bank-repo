package zw.co.quantum.legend.util

class Response {
	String code
	String message
	Object principal

	public Response(String code, String message, Object principal) {
		this.code = code
		this.message = message
		this.principal = principal
	}
	
	Boolean isSuccess() {
		return Constants.RESPONSE_TYPE_SUCCESS.equals(code)
	}
	
}
