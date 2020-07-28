<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="USER1.UserDAO" %>

<%
        // 인코딩 처리
        request.setCharacterEncoding("UTF-8"); 
        
        // 로그인 화면에 입력된 아이디와 비밀번호를 가져온다

        String name= (String)session.getAttribute("userID");
        String password= request.getParameter("password");
        System.out.println(name);
        // DB에서 아이디, 비밀번호 확인
		UserDAO dao = new UserDAO();
        int check[] = dao.loginCheck(name, password);
        
        // URL 및 로그인관련 전달 메시지
        String msg = "";
        
        if(check[0] == 1)    // 로그인 성공
        { 
        	pageContext.forward("userUpdateForm.jsp");
            
        }
        else if(check[0] == 0) // 비밀번호가 틀릴경우
        {
            pageContext.forward("checkPwForm.jsp");
        }
    %>