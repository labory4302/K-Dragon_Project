<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="food.commentDAOImpl"%>
<%@ page import="food.commentVO"%>
<%@ page import="food.boardDAOImpl"%>
<%@ page import="food.boardVO"%>
<%@ page import="java.util.List"%>
<%
	request.setCharacterEncoding("utf-8");
	
	//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	
	int pageNumber = 1; //기본 페이지 넘버
	
	//페이지넘버값이 있을때
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	
	Long no=Long.parseLong(request.getParameter("no"));
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	
	commentDAOImpl dao=new commentDAOImpl();
	List<commentVO> list=dao.getList(no);
	
	boardDAOImpl board=new boardDAOImpl();
	Long like=board.Like(no);
	
	Integer upcheck=board.updatecheck(no, userID);
	
	int likecheck=board.likecheck(no, userID);
%>
<% if(userID==null){%>
		<script> 
		alert("로그인이 되어있지 않습니다.");
		history.go(-1);
		</script>
	<%}%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/resources/common/css/common.css'/>" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<title>jsp 게시판 웹사이트</title>
<style>
body{
background-image:url('../images/aa222.jpg');
background-size: cover;
}
</style>
</head>
<body>

 <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="../search/main.jsp" _msthash="238680" _msttexthash="28185131">맛집탐방</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample05" aria-controls="navbarsExample05" aria-expanded="false" aria-label="Toggle navigation" _msthidden="A" _msthiddenattr="204581" _mstaria-label="320099">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarsExample05">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active" width =20%>
        <a class="nav-link" href="../search/main.jsp"><font _mstmutation="1" _msthash="699582" _msttexthash="4991896">main </font><span class="sr-only" _msthash="1019902" _msttexthash="11687494">(현재)</span></a>
      </li>
      <li class="nav-item" width =20%>
        <a class="nav-link" href="../board/view.jsp" _msthash="699998" _msttexthash="9876347">board</a>
      </li>
      <li class="nav-item" width =20%>
        <a class="nav-link" href="../ladder/ladder.jsp" _msthash="699998" _msttexthash="9876347">game</a>
      </li>
	</div>
	 <% 
    	if (userID==null){
    %>
			<ul class="navbar-nav mr-auto">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" style="color: white">접속하기</a>
					<ul class="dropdown-menu">
						<li><a href="../login/login.jsp">로그인</a></li>
						<li><a href="../login/join.jsp">회원가입</a></li>

					</ul></li>
			</ul>

			<%
				} else {
			%>
			
			<ul class="navbar-nav mr-auto">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" style="color: white">회원관리</a>
					<ul class="dropdown-menu">
						<li><a href="../login/logoutAction.jsp">로그아웃</a></li>
						<li><a href="../login/checkPwForm.jsp">정보수정</a></li>
					</ul></li>
			</ul>

			<%
				}
			%>
</nav>
	<!-- 게시판 -->
	<div class="container">
		<div class="row">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<!-- ************** Update 버튼 ************** -->
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;"><%=title %></th>
					
				
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td class="form-control" style="height: 350px;"><%=content %></td>
					</tr>
				</tbody>
			</table>
				<form action="like.jsp" method="post" style="margin-bottom: 3%">
			<input type="hidden" name="userid" value="<%=userID %>">
				<input type="hidden" name="like" value="1"> 
				<input type="hidden" name="no" value="<%=no %>"> 
				<input type="hidden" name="no" value="<%=session.getAttribute("userID") %>"> 
				<input type="hidden" name="title" value="<%=title %>"> 
				<input type="hidden" name="content" value="<%=content %>">
				<a><%=like %></a>
				<%if(likecheck==0){ %>
				<input type="submit" class="btn btn-dark" style="color:white;"  value="좋아요" name="up">
				<%} else{ %>
				<input type="submit" class="btn btn-danger" style="color:white;"  value="취소" name="cencel">
				<%} %>
				</form>
			<% if (upcheck!=0){ %>
					<div style = "margin-left: 900px">
					<form action="boardupdate.jsp" method="post">
						<input type="hidden" name="no" value=<%=no %>>
						<input type="hidden" name="title" value=<%=title %>>
						<input type="hidden" name="content" value=<%=content %>>
						<input type="hidden" name="userid" value=<%=session.getAttribute("userID") %>>
				
						<input type="submit" style="color:white;"class="btn btn-dark" value="update">
					</form>
					</div>
					<form action="boarddelete.jsp" method="post">
						<input type="hidden" name="no" value=<%=no %>>
						<input type="hidden" name="title" value=<%=title %>>
						<input type="hidden" name="content" value=<%=content %>>
						<input type="hidden" name="userid" value=<%=session.getAttribute("userID") %>>
						<input type="submit" style="color:white;"class="btn btn-dark" value="delete">	
					</form>
					
				<%} %>
		
		</div>
	</div>
	<%
   for(commentVO vo:list){
   %>
	<form action="boardform.jsp" method="post">
		<div class="container">
			<div class="row">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<tbody>
						<tr>
							<td><%=vo.getUsername() %></td>
							<td><%=vo.getBcomment() %></td>
							<td><%= vo.getPubdate()%></td>
							<td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</form>

	<%} %>
	<!-- 게시판 -->
	<form action="commentinsert.jsp" method="post">
		<div class="container">
			<div class="row" style="margin-bottom: 1%">
			<input type="hidden" name="userid" value="<%=session.getAttribute("userID") %>">
				<input type="hidden" name="no" value="<%=no %>"> <input
					type="hidden" name="title" value="<%=title %>"> <input
					type="hidden" name="content" value="<%=content %>"> <input
					type="text" style="width: 90%; height: 30px" name="comment">
				<input type="submit" class="btn btn-dark" style="color:white;" value="입력">
			</div>
		</div>
	</form>



	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="../js/bootstrap.js"></script>

</body>
</html>