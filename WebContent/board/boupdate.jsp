<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="food.boardDAOImpl"%>
<%@ page import="food.boardVO"%>
<%	
	String userID = null;
	if (session.getAttribute("userID") != null) {
	request.setCharacterEncoding("utf-8");
	Long no=Long.parseLong(request.getParameter("no"));
	String content=request.getParameter("content");
	String title=request.getParameter("title");
	String name=(String)session.getAttribute("userid");
	boardDAOImpl dao=new boardDAOImpl();
	dao.boardUpdate(no,title,content);
	pageContext.forward("boardform.jsp");
	}
	else{
%>
	<script> 
	alert("로그인이 되어있지 않습니다.");
   	history.go(-1);</script>
	<%
		}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>