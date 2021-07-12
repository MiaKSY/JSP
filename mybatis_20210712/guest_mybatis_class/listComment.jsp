<%@ page language="java" contentType="text/html; charset=utf-8" %>
 <%@ page import="java.util.*" %>
 <%@ page import="mybatis.guest.model.Comment" %>    
 <%@ page import="mybatis.guest.service.CommentService" %>  
  
  <!-- 서비스의 메소드 호출  -->
  <%
  
  	String condition = request.getParameter("condition");
  	String keyword = request.getParameter("keyword");
  	
  	HashMap map = new HashMap();
    map.put("condition",condition);
    map.put("keyword",keyword);
     
     List<Comment> mList = CommentService.getInstance().selectComment(map);
 %>
  
<!DOCTYPE HTML>
<html> 
<head> 
	<meta charset="UTF-8">
<title>목록보기</title>
</head>
<body>


<!-- 조건검색 -->

<form action="" method="get">
	<select name='condition'>
		<option value='user_Id'>작성자</option>
		<option value='comment_Content'>내용</option>
	</select> 
	<input type='text' name='keyword'> 
	<input type='submit' value='검색'/>
</form>


<a href="insertCommentForm.jsp">방명록 남기기 </a><br/><br/>

<table border="1">
	<tr><td>글번호</td><td>작성자</td><td>등록일</td></tr>
	<% for( Comment comment : mList ) { %>
		<tr>
			<td><%= comment.getCommentNo() %></td>
			<td><a href="viewComment.jsp?cId=<%=comment.getCommentNo()%>"><%= comment.getUserId()%> 님이 쓴 글</a></td>
			<td><%= comment.getRegDate()%></td>
		</tr> 
	<% } %>
</table>
</body>
</html>  