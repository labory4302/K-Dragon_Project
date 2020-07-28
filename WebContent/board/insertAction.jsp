<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "food.boardDAO" %>
<%@ page import = "food.boardDAOImpl" %>
<%@ page import = "food.boardVO" %>
<%@ page import="java.io.PrintWriter"%>

<%
		String userID = null;
		if (session.getAttribute("userID") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 
			userID = (String) session.getAttribute("userID");//유저아이디에 해당 세션값을 넣어준다.
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = '../login/login.jsp'");
			script.println("</script>");
		}
		%>

<% 
	request.setCharacterEncoding("UTF-8");
	String title = request.getParameter("Title");
	String userid = (String) session.getAttribute("userID");
	String content = request.getParameter("Content");
	
	boardDAOImpl dao = new boardDAOImpl();
	dao.insert(title,userid,content);
	
	response.sendRedirect("view.jsp");
 %>
