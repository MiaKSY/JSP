<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.Date"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 임포트해주고 -->
<%@ page import="java.util.*" %> 
<%@ page import="sample.* "%>


<!-- 자바 코드 씁니다 -->
<%
	
	// 클라이언트가 있고, 서버가 있다.
	
	// 클라이언트  ----- request ---->  서버
	// 클라이언트  <---- responset ---  서버
	
	// request와 responset을 구별합시다!
	
	// 단계 : 
	// 1. 이전 화면에서 사용자의 입력값을 얻어오기		
	// 2. 입력값을 VO객체의 변수로 지정하기	
	// 3. DAO의 insert함수를 호출
	
	
	// 한글처리
	request.setCharacterEncoding("UTF-8");
	
	
	
	
	// 1. 이전 화면에서 사용자의 입력값을 얻어오기
	// (이전화면 : insertFormEmp.jsp)
	// ***************************************************
	// 여기서 진짜 진짜 진짜 중요한 것은
	// 우리가 form 태그 안에 각각 name 값으로 지정해 준 그 친구들을 가져와야 한다.
	// 대소문자 하나라도 다르면 안된다.
	// 근데 보통을 헷갈리니까 id값, name값을 똑같게 지정해준다.
	// ***************************************************
	// 입력값 가져온 후에, 변수에 지정해주어야한다.
	// 사번
//	String eno = request.getParameter("eno");
	// 사원명
//	String ename = request.getParameter("ename");
	// 월급
//	String salary = request.getParameter("salary");
	// 직업
//	String job = request.getParameter("job");	

	String eno = request.getParameter("eno");	// 파라메터로 받는건 무조건 스트링만 된다.
	String ename = request.getParameter("ename");	
	String job = request.getParameter("job");	
	String manager = request.getParameter("manager");	
	String hiredate = request.getParameter("hiredate");	
	String salary = request.getParameter("salary");	
	String commission = request.getParameter("commission");	
	String dno = request.getParameter("dno");
	
	
	
	// 2. 입력값을 VO객체의 변수로 지정하기
	EmpVO vo = new EmpVO();
// 	데이터타입

	vo.setEno(Integer.parseInt(eno)); // 그래서 같은 자료형으로 형변환해줘야 한다.
	vo.setEname(ename); 
	vo.setJob(job);
	vo.setManager(Integer.parseInt(manager));
	vo.setHiredate(hiredate);
	vo.setSalary(Integer.parseInt(salary)); 
	vo.setCommission(Integer.parseInt(commission)); 
	vo.setDno(Integer.parseInt(dno)); 
	
	// 사번
	// url, 파라메터로 얻어온 값들은 전부 String이다.
	//형변환
//	vo.setEno(Integer.parseInt(eno));
	// 사원명
//	vo.setEname(ename);
	// 월급
//	vo.setSalary(Integer.parseInt(salary));
	// 직업
//	vo.setJob(job);
	
	
	
	// 3. DAO의 insert함수를 호출	
	EmpDAO dao = EmpDAO.getInstance();
	dao.modifyEmp(vo);

	// 페이지 변경하는 코드
	// 수정하기 후 상세보기 페이지
// 	response.sendRedirect("viewEmp.jsp?eno=" + vo.getEno());
//	변수가 있기 때문에	

	// 수정 정보를 viewEmp로 보내줘야한다.
	response.sendRedirect("viewEmp.jsp?eno="+eno);
	
	
%>



<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

입력되었습니다.

</body>
</html>