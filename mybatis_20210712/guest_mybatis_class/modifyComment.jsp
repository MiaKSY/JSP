<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ page import="mybatis.guest.model.Comment" %>   
 <%@ page import="mybatis.guest.service.CommentService" %>  
 
 
 <!--  이전 폼에서 넘겨오는 데이타의 한글 처리  -->
 <% 
 	request.setCharacterEncoding("utf-8");
 
 	long cId = Long.parseLong(request.getParameter("cId"));
 	
 	
 %>
   
 <!-- 서비스의 메소드 호출  -->
 <%
 
 CommentService csv = CommentService.getInstance();
 Comment cm = csv.selectCommentByPK(cId);
 %> 
     
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정</title>
</head>
<body>


<form name="frm" action="modifyCommentSave.jsp?cId=<%=cm.getCommentNo()%>" >
<table>
	<tr><td>글번호</td><td><input type="text" name="commentNo" size="3" value="<%=cm.getCommentNo() %>"/></td></tr>
	<tr><td>사용자</td><td><input type="text" name="userId" size="15" value="<%=cm.getUserId() %>"/></td></tr>
	<tr><td>메세지</td><td><textarea name="commentContent" rows="10" columns="40" value="<%=cm.getCommentContent()%>"></textarea></td></tr>
	<tr><td><input type="submit" value="입력"/></td></tr>
</table>
</form>



<a href="listComment.jsp"><p>목록보기</p></a>

</body>
</html>