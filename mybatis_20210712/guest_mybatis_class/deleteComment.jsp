<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="mybatis.guest.model.Comment" %>   
<%@ page import="mybatis.guest.service.CommentService" %>  
    
    
  <% 
  long commentNo = Integer.parseInt( request.getParameter("cId"));
  Comment comment = CommentService.getInstance().delectCommentByPK(commentNo);
  %>
      
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메세지 삭제</title>
</head>
<body>

삭제되었을까요?

<a href="listComment.jsp"><p>목록보기</p></a>


</body>
</html>