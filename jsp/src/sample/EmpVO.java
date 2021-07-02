package sample;

public class EmpVO {
	
	// 데이터를 주고받기 위해서만 쓰는 클래스
	// VO / DTO 보통 이 두개의 이름으로 많이 설정한다.
	

	// 데이터베이스 테이블에 해당하는 것을 여기서 담당
	
	// 1. 테이블(Employee)의 컬럼과 연동할 변수를 선언
	
	// 지금은 80년대 예문이라 그렇지만, 요즘은 다르다!!
	// 숫자로만 이루어져 있지만 문자로 처리하는 것 : 주민번호, 사번, 학번, 전화번호
	// 이유는?  연산이 되면 안되기 때문에!!
	int eno;
	String ename;
	String job;
	int manager;
	String hiredate;
	int salary;
	int commission;
	int dno;
	
	// 단축키
	// 컨트롤 쉬프트 x
	// 컨트롤 쉬프트 y
	
	
	// 2. 변수를 생성했으면 setter/getter 생성 (날코딩X, 자동으로 생성!)
	
	
	
	public int getEno() {
		return eno;
	}
	public void setEno(int eno) {
		this.eno = eno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public int getManager() {
		return manager;
	}
	public void setManager(int manager) {
		this.manager = manager;
	}
	public String getHiredate() {
		return hiredate;
	}
	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public int getCommission() {
		return commission;
	}
	public void setCommission(int commission) {
		this.commission = commission;
	}
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	
	
	
	
	
	
	
}
