package sample;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class EmpDAO {

	
	// DB 연결관련 변수선언
	// 주의!!! IP 주소!!!!!
	// 본인 IP 주소 확인하는 법 : CMD -> ipconfig
	
	String driverName = "oracle.jdbc.driver.OracleDriver";
// 	String url ="jdbc:oracle:thin:@192.168.0.141:1521:xe"; // 학원
// 	String url ="jdbc:oracle:thin:@192.168.55.150:1521:xe"; // 집
	String url ="jdbc:oracle:thin:@localhost:1521:xe";
	String user ="HR";
	String pass ="1234";
	
	
	
	// selectEmp.jsp 참고
	// 생성자 함수 하나 생성
	// 싱글톤으로!! private으로!!
	private EmpDAO() throws Exception {
		// 1. 드라이버 로딩
		Class.forName(driverName);
		// 예외처리방법 
		// 1) 내가 직접 잡음 : try-catch 
		// 2) 예외 그냥 던짐 : throws Exception 추가
		System.out.println("생성자 한번");
	}
	
	
	// 생성자를 싱글톤으로 만든 후에, 
	// 변수하나 생성
	static EmpDAO dao = null;
	// 멤버변수. 자동초기화가 되기 때문에 = null 을 써주지 않아도 사실은 괜찮다.
	public static EmpDAO getInstance() throws Exception {
		if(dao==null) { // 첫번째 사용자가 접속했을 경우에는 dao가 null이라서
			dao = new EmpDAO(); // 생성자를 불러와서 객체를 생성한다.
		}
		return dao;
		// return dao 니까 위에 반환형이랑 자료형을 맞춰준다.
	}
	// 생성자는 딱 한번만 불려온다.
	// static으로 함수를 만들면 외부에서 클래스 이름으로 가져올 수 있다.
	// static함수는 static변수만 불러올 수 있어서, 변수도 static으로 해주었다.
	
	
	
	

	//----------------------------------------------	
	// selectEmp의 시작
	// DB에서 데이터를 가져오는 함수 selectEmp 생성
	
	
	// 뒤에(현재103번째줄이지만 나중에 달라질지도;;) 
	// return list;가 오류가 안 나려면 여기서 ArrayList<EmpVO>를 추가해주어야 한다.
	public ArrayList<EmpVO> selectEmp() throws Exception {
		
		// 우리가 try - finally를 사용하려고 하는데
		// 지역변수는 함수 안에서 생성되고, 함수가 끝나면 사라지기 때문에
		// 변수는 try - finally 밖에다가 생성해준다.
		// 지역변수는 자동 초기화가 안 되기 때문에, null 값으로 초기화를 해주어야 한다.
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
		
		// 2. 연결객체 얻어오기
		// 자동 임포트 해야한다.
		con = DriverManager.getConnection(url, user, pass);
		// 3. sql문장 만들기
		String sql = "SELECT * FROM employee";
		
		// 4. 전송객체 얻어오기
		ps = con.prepareStatement(sql);
		// 5. 전송 (executeQuery() / executeUpdate() )
		// select 쿼리문의 ResultSet을 변수rs에 저장
		ResultSet rs = ps.executeQuery();
		
		
		
		// SQL에 가져온 한 행의 데이터를 vo에 넣는데, 행이 여러개니까, ...
		// 자료형이 같은 데이터를 하나의 변수에 넣는 방법 : 배열
		// 배열의 문제점 : 데이터의 갯수를 정확히 알아야한다.
		// 동적 배열인 어레이 리스트를 사용한다.
		// 반드시 어레이리스트가 바깥에 있어야 한다.
		ArrayList<EmpVO> list = new ArrayList<EmpVO>();
		

		while(rs.next()) {
			// rs.next()인 이유는? 첫줄은 컬럼이름이기 때문이다. 
			// 컬럼이름 빼고, 데이터만 가져오려고 rs.next()라고 했다.
			// 하나하나 내려가면서, next() 다음줄에 데이터가 있으면 true
			// 계속 내려가다가 다음줄에 데이터가 없으면 false
			// 가져온 SQL 데이터를 한 행 가져와서 넣어줄 변수 vo 생성
			EmpVO vo = new EmpVO();
			// getInt("대문자") : 대문자로 쓴 이유는, SQL문은 대소문자를 가리지 않기 때문이다.
			vo.setEno(rs.getInt("ENO"));
			vo.setEname(rs.getString("ENAME"));
			vo.setManager(rs.getInt("MANAGER"));
			vo.setJob(rs.getString("JOB"));
			list.add(vo);
		}
		// list를 보여주세요. 그냥 이렇게 하면 오류난다. 위에 함수 선언부에 반환형을 맞춰주어야 한다.
		return list;
		
		} finally {
		
		// 6. 닫기
		// 중요 1 : 닫는 순서
		// 죽일때는 자식을 먼저 죽이고, 부모를 나중에 죽여야한다. 
		// 부모를 먼저 죽이고, 자식을 죽이려고 하면
		// 자식의 메모리 주소를 찾을 수가 없게 된다. 그러면, 좀비 프로그램이 생기게 된다. (리눅스 쪽에서 아주아주 중요한 내용)
		
		// 중요 2 : 무조건 닫는다.
		// 가장 중요한 것! 데이터베이스와의 연동은, 성공을 했던, 실패를 했던, 무조건 닫아야한다!
		// 그래서 try - finally 를 사용한다.
		
		ps.close();
		con.close();
		}
		
	}

	// selectEmp의 종료
	//----------------------------------------------
	
	
	

	//----------------------------------------------	
	// insertEmp의 시작	
	// 입력값으로 받은 데이터를 DB에 넣어주는 함수 insertEmp 생성
	// 기본세팅은 위와 같다.
	// sql문, 전송객체, sql문 종류에따른 전송() 부분만 용도에 맞게 바꾸어주면 된다.
	
	public void insertEmp(EmpVO vo) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			// 2. 연결객체 얻어오기
			conn = DriverManager.getConnection(url, user, pass);
			
			//3. sql 문장 만들기
			String sql = "INSERT INTO employee(eno, ename, salary, job)"
					+ " VALUES(?,?,?,?)";
					// 주의 **************************************
					// 자바에서 sql문을 작성할 때 enter를 쳐서 다음줄에 작성하게 된다면
					// "빈칸띄어쓰기하나~~계속~~"
					// 빈칸이 하나 있어야 한다.
					// *******************************************
			
			// 4. 전송객체얻어오기
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getEno());
			pstmt.setString(2, vo.getEname());
			pstmt.setInt(3, vo.getSalary());
			pstmt.setString(4, vo.getJob());

			// 5. 전송 ()
			pstmt.executeUpdate();
			
		} finally {
			
			//6. 닫기 : 가장 작은 아이부터 close해야한다.
			pstmt.close();
			conn.close();
		}
	}
	
	// insertEmp의 종료
	//----------------------------------------------

	
	
	
	//----------------------------------------------	
	// viewEmp의 시작
	// DB에서 데이터를 가져오는 함수 viewEmpEmp 생성
	
	
	public EmpVO viewEmp(String eno) throws Exception {
		
		// JDBC 절차 작성
		
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
		
		// 2. 연결객체 얻어오기
		con = DriverManager.getConnection(url, user, pass);
		
		// 3. sql문장 만들기
		String sql = "SELECT * FROM employee WHERE eno=?";
		// 물음표?를 쓰는 이유는?
		// 입력값을 추후에 받을 것이기 때문이다!
		// 물음표는 반드시 SET 해주어야한다!!!
		
		
		// 4. 전송객체 얻어오기
		ps = con.prepareStatement(sql);

		// 이 부분이 또 중요!!!
		// 위에 SQL문에 물음표?가 들어가면, 반드시 여기에서 set을 해주어야 합니다.
		
		ps.setInt(1, Integer.parseInt(eno));
		// 왜 0이 아니라 1부터 시작해요?
		// 프로그램 언어가 아닌 것은 1부터 시작합니다.
		// 대표적으로: 데이터베이스, CSS 가 그렇습니다.
		
		
		// 5. 전송 
		// 리턴값이 다르기 때문에 다른 함수를 쓴다.
		// int executeQuery() / ResultSet executeUpdate() 
		// select 쿼리문의 ResultSet을 변수rs에 저장
		ResultSet rs = ps.executeQuery();

		EmpVO vo = new EmpVO();
		
		if( rs.next() ) {
			vo.setEno(rs.getInt("ENO"));
			vo.setEname(rs.getString("ENAME"));
			vo.setJob(rs.getString("JOB"));
			vo.setManager(rs.getInt("MANAGER"));
			vo.setHiredate(rs.getString("HIREDATE"));
			vo.setSalary(rs.getInt("SALARY"));
			vo.setCommission(rs.getInt("COMMISSION"));
			vo.setDno(rs.getInt("DNO"));
		}
		return vo;
		
		} finally {
				
		ps.close();
		con.close();
		}
		
	}

	// viewEmp의 종료
	//----------------------------------------------	
	
	
//	//----------------------------------------------	
//	// 효원님이 푸신 정성님 숙제의 시작	
//	
//   public ArrayList<EmpVO> viewEmpMa (String manager) throws Exception{
//         Connection con = null;
//         PreparedStatement ps = null;
//         
//         try {
//            //2.연결객체 가져오기
//            con = DriverManager.getConnection(url, user,pass);
//            //3.sql문장 작성
//             String sql = "SELECT * FROM employee WHERE manager=?";   
//            //4.sql문장을 전송객체 얻어오기
//            ps = con.prepareStatement(sql);
//            ps.setInt(1, Integer.parseInt(manager));
//            // index 자릿수
//            
//            //5.전송
//            //준비된 상태의 실행할 쿼리문장을 결과값인 resultset인 rs에 저장해라
//            ResultSet rs = ps.executeQuery();
//            
//            ArrayList<EmpVO> list = new ArrayList<EmpVO>();
//            
//            while(rs.next()) {
//               EmpVO vo = new EmpVO();
//               vo.setEno(rs.getInt("ENO"));
//               vo.setJob(rs.getString("JOB"));
//               vo.setEname(rs.getString("ENAME"));
//               vo.setManager(rs.getInt("MANAGER"));
//               vo.setHiredate(rs.getString("HIREDATE"));
//               vo.setSalary(rs.getInt("SALARY"));
//               vo.setCommission(rs.getInt("COMMISSION"));
//               vo.setDno(rs.getInt("DNO"));
//               list.add(vo);
//               
//            }
//            
//             return list;
//             
//         }finally {
//            //6.연결객체 닫기
//            ps.close();
//            con.close();
//         
//         }
//	      
//	   
//	   }
//	// 효원님이 푸신 정성님 숙제의 종료
//	//----------------------------------------------
	
	
	
	//----------------------------------------------	
	// deleteEmp의 시작
	
	public int deleteEmp(String eno) throws Exception{
		
		// JDBC 절차 작성
		
		Connection con = null;
		PreparedStatement ps = null;
		
		try {
		
		// 2. 연결객체 얻어오기
		con = DriverManager.getConnection(url, user, pass);
		
		// 3. sql문장 만들기
		String sql = "DELETE * FROM employee WHERE eno=?";

		// 4. 전송객체 얻어오기
		ps = con.prepareStatement(sql);	
		ps.setInt(1, Integer.parseInt(eno));

		// 5. 전송 
		int result = ps.executeUpdate();
		return result;
		
		} finally {
			
		ps.close();
		con.close();
		}
		
	}
	
	// deleteEmp의 종료
	//----------------------------------------------	
		
	
	
	//----------------------------------------------	
	// modifyEmp의 시작
	
	public void modifyEmp(EmpVO vo) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			// 2. 연결객체 얻어오기
			conn = DriverManager.getConnection(url, user, pass);
			
			//3. sql 문장 만들기
			String sql = "UPDATE employee SET "
					+ " eno=?, "
					+ " ename=?, "
					+ " job=?, "
					+ " manager=?, "
					+ " salary=?, "
					+ " commission=?, "
					+ " dno=?, "
					+ " WHERE eno=? ";
			
			// UPDATE employee SET ename='홍길순, job='개발자,
			// salary=5000 WHERE eno=7799;

			
			// 4. 전송객체얻어오기
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getEno());
			pstmt.setString(2, vo.getEname());
			pstmt.setString(3, vo.getJob());
			pstmt.setInt(4, vo.getManager());
			pstmt.setString(5, vo.getHiredate());
			pstmt.setInt(6, vo.getSalary());
			pstmt.setInt(7, vo.getCommission());
			pstmt.setInt(8, vo.getDno());
			pstmt.setInt(9, vo.getEno());

			// 5. 전송 ()
			pstmt.executeUpdate();
			
		} finally {
			
			//6. 닫기 : 가장 작은 아이부터 close해야한다.
			pstmt.close();
			conn.close();
		}
	}
	
	// modifyEmp의 종료
	//----------------------------------------------
	
	
	

}
