<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = 'java.util.*' %>
<%@ page import = 'sample.*' %>
<%
	//한글처리
	request.setCharacterEncoding("utf-8");
	// 이전 화면에서 넘겨주는 파라메터 값 받기
	String eno = request.getParameter("eno");
	// DAO 에 viewEmp()호출
	EmpDAO dao = EmpDAO.getInstance(); // 인스턴스객체 생성(싱글톤)
	EmpVO vo = dao.viewEmp(eno);
	// 아래 화면에 해당 사원의 각각의 정보 출력

%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 사원등록 화면 </title>
</head>
<body>
	<!-- 사번,이름,업무,월급 -->
	<!-- get은 주소에 정보가 그대로 노출된다. -->
	<form action="modifyEmp.jsp" method ="post">  
	<table>
		<tr>
			<td>사번</td>
			<td><label for="eno"><input type="text" id="eno" readonly name="eno" placeholder="사번" value="<%=vo.getEno() %>"/></label></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><label for="ename"><input type="text" id="ename" name = 'ename' value="<%=vo.getEname() %>"/></label></td>
		</tr>
		<tr>
			<td>업무</td>
			<td><label for="job"><input type="text" id="job"name = 'job' value="<%=vo.getJob() %>"/></label></td>
		</tr>
		<tr>
			<td>담당사수</td>
			<td><label for="manager"><input type="text" id="manager" name = "manager" value="<%=vo.getManager() %>"/></label></td>
		</tr>
		<tr>
			<td>고용일</td>
			<td><label for="hiredate"><input type="text" id="hiredate" name = "hiredate" value="<%=vo.getHiredate() %>"/></label></td>
		</tr>
		<tr>
			<td>월급</td>
			<td><label for="salary"><input type="text" id="salary" name = "salary" value="<%=vo.getSalary() %>"/></label></td>
		</tr>
		<tr>
			<td>COMMISSION</td>
			<td><label for="commission"><input type="text" id="commission" name = "commission" value="<%=vo.getCommission() %>"/></label></td>
		</tr>
		<tr>
			<td>부서</td>
			<td><label for="dno"><input type="text" id="dno" name = "dno" value="<%=vo.getDno() %>"/></label></td>
		</tr>
		<tr>
			<td colspan ="2" align='center'>
			<input type="submit" value="수정" />
			<input type="reset" value = "초기화"/>
			<input type="reset" value="이전" onclick="location.href = 'viewEmp.jsp?eno=<%=vo.getEno()%>'"/>
			</td>
		</tr>
		<tr>
			<td><a href="start.jsp">이전</a></td>
		</tr>
	</table>
	</form>
	
</body>
</html>