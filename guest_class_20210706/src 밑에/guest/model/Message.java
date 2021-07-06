package guest.model;

public class Message {

	// 데이터베이스의 한 레코드를 담기 위한 클래스 생성
	
	// 자바 빈즈!
	// 뭉텅이 변수들과 게터세터들
	
	private int messageId;
	private String guestName;
	private String password;
	private String message;

	// constructor
	// 생성자 생성
	
	// 기본 생성자 함수 반드시 습관적으로 만들기
	public Message() {}
	
	// 인자 있는 생성자 함수가 있으면 반드시 기본 생성자 함수를 만들어줍시다.
	
	public Message(int messageId, String guestName, String password, String message) {
		super();
		this.messageId = messageId;
		this.guestName = guestName;
		this.password = password;
		this.message = message;
	}
	
	
	// getter / setter

	public int getMessageId() {
		return messageId;
	}
	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}
	public String getGuestName() {
		return guestName;
	}
	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	
	
	
}
