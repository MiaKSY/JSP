<%@page contentType="text/xml; charset=utf-8" %>
<%@ page language="java" import="java.sql.*"%>

<%
String driver="oracle.jdbc.driver.OracleDriver";
String user="hr";
String pass="1234";
String dbURL="jdbc:oracle:thin:@localhost:1521:xe";



String rtn_xml="";

	Class.forName(driver);
	Connection connection=DriverManager.getConnection(dbURL,user,pass);
	
	String sql = "select * from ajax_temp";
	
	Statement stmt = connection.createStatement();
	ResultSet rs = stmt.executeQuery(sql);	

	// xml 형식 (최근에는 json을 많이 쓰고, json을 하려면 json library가 있어야 한다.)
	rtn_xml += "<customer>";

	while (rs.next()){		
		rtn_xml += "<person>";
		rtn_xml += "<name>" + rs.getString("name") + " </name>";
		rtn_xml += "<age>" + rs.getString("age") +  "</age>";
		rtn_xml += "<tel>" + rs.getString("tel") +  "</tel>";
		rtn_xml += "<addr>" + rs.getString("addr") +  "</addr>";
		rtn_xml += "</person>";		
	}	
	rtn_xml += "</customer>";
	
	rs.close();
	stmt.close();
	connection.close();

	

	System.out.println(rtn_xml);
	
	out.write(rtn_xml);

%>