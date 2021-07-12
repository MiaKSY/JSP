<%@page import="mybatis.guest.service.CommentService"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="" %>    
    
<%


HashMap hm = CommentService.getInstance().selectEmployee();


%>
     
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원정보</title>
</head>
<body>
<!-- 
	table 구조로 사원번호 / 사원명 / 업무 / 부서이름 을 출력하기
 -->
 <table border="1">
 	
 	<tr>
 		<td>사원번호</td>
 		<td>사원명</td>
 		<td>업무</td>
 		<td>부서이름</td>
 	</tr>
	<% for(String h : hm.keySet()) {%>
 	<tr>
 		<td><%=hm %></td>
 		<td><%= %></td>
 		<td><%= %></td>
 		<td><%= %></td>
 	</tr>
 	<%}//end of for %>
 </table>
 
 
</body>
</html>