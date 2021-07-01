<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import='java.util.*' %>
<%@ page import='sample.*' %>

<%
	// 이부분이 제일 중요한데....
	// eno 값을 가져올것이다.
	// 어떻게 가져올까? 파라메터
	// get 방식 
	// 클라이언트  ----- request ---->  서버
	// 클라이언트  <---- responset ---  서버
	// 지금은 request를 쓴다!
	// 서버에 요청을 한다. eno의 파라메터를 가져오고싶어요. 
	// request.getParameter("eno");
	// 그것을 변수에 넣어준다.	
	String eno = request.getParameter("eno");

	
	EmpDAO dao = EmpDAO.getInstance();
	List<EmpVO> list = dao.viewEmp(eno);
%>
    
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>특정사원목록보기</title>
</head>


<body>

<table border='2'>

	<tr>
		<td>사번</td>
		<td>사원명</td>
		<td>업무</td>
		<td>매니저</td>
		<td>고용일</td>
		<td>급여</td>
		<td>커미션</td>
		<td>부서번호</td>
	</tr>
	
	<% for(EmpVO vo : list){ %>
	<tr>
		<td><%=vo.getEno()%></td>
		<td><%=vo.getEname() %></td> 
		<td><%=vo.getJob()%></td>
		<td><%=vo.getManager()%></td>
		<td><%=vo.getHiredate()%></td>
		<td><%=vo.getSalary()%></td>
		<td><%=vo.getCommission()%></td>
		<td><%=vo.getDno()%></td>
	</tr>
	<% } // end of for %>

</table>



</body>
</html>