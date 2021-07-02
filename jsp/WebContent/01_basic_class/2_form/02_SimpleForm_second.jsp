<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

String name = request.getParameter("name");
String gender = request.getParameter("gender");
String occupation = request.getParameter("occupation");
String[] hobby = request.getParameterValues("hobby");

// 체크박스에서 여러 데이터 가져오기 -> 배열! 


%>



<!DOCTYPE html>
<html>
<head>
<title> 폼과 서블릿 </title></head>

<body>

이름 : <%=name %>
<br>

성별 : <%=gender %>
<br>

직업 : <%=occupation %>
<br>

<!-- 체크박스에서 여러 데이터 가져오기 : 배열! -->
<!-- 이렇게 가져와야한다! -->
취미 : <% for(int i = 0 ; hobby != null && i < hobby.length ; i++){
  		  out.println(hobby[i] + "&nbsp;");
		} %>

<br>

</body>
</html>
