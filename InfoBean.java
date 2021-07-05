package info.beans;

public class InfoBean {
	
	// 멤버변수와 세터,게터 만 가지고 있는 애들을 빈즈라고 부른다.
	
	private String name;
	private String id;
	
	// 기본 생성자
	public InfoBean() {
		
	}
	
	public String getGender() {
		char sexNum = id.charAt(7);  // 801002-1234567
		if(sexNum == '1' || sexNum == '3') {
			return "남자";
		} else {
			return "여자";
		}
	}
	
	// setter / getter
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	
	
	
}
