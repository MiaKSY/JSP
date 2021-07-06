<%@ page contentType="text/xml; charset=utf-8" %>
<%@ page language="java" import="java.sql.*"%>

<%

// 지금은 db연결을 jsp에 전부 때려박았지만,
// 앞으로 db연결은 무조건 java에서!

String driver="oracle.jdbc.driver.OracleDriver";
String user="hr";
String pass="1234";
String dbURL="jdbc:oracle:thin:@localhost:1521:xe";


	Class.forName(driver);
	Connection connection=DriverManager.getConnection(dbURL,user,pass);
	
	String sql = "select * from employee where ename=?";
	System.out.println(sql);
	PreparedStatement ps = connection.prepareStatement(sql);
	ps.setString(1, request.getParameter("id"));
	ResultSet rs = ps.executeQuery();		
	// 자료형 ResultSet 주의
	
	String result="NO";
	if (rs.next()){		
		result = "YES";
	}		
	out.print(result);
%>
 
