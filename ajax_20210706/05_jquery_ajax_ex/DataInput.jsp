<%@ page language="java" import="java.sql.*"%>
<%
String driver="oracle.jdbc.driver.OracleDriver";
String user="hr";
String pass="1234";
String dbURL="jdbc:oracle:thin:@localhost:1521:xe";

// 한글처리
request.setCharacterEncoding("utf-8");
// 사용자 입력값을 가져올게요
String name  = request.getParameter("name");
String age = request.getParameter("age");
String tel = request.getParameter("tel");
String addr= request.getParameter("addr");


	Class.forName(driver);
	Connection connection=DriverManager.getConnection(dbURL,user,pass);		
	
	// 물음표? 없이 sql문 작성하는 방법
	// "values('"+test+')"
	String sql = "insert into ajax_temp(name, age, tel, addr) values(";
	sql += "'" + name + "','" + age + "','" + tel + "','" + addr + "')";
	// Statement를 사용한다.
	Statement stmt = connection.createStatement();
	int result = stmt.executeUpdate(sql);		

	stmt.close();
	connection.close();
	
	out.write(String.valueOf(result));
%>