<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");

	Long restNo = Long.parseLong(request.getParameter("restNo"));
	String search = request.getParameter("search");
	String category = request.getParameter("category");
	String deliveryStatus = request.getParameter("deliveryStatus");
	String parkingStatus = request.getParameter("parkingStatus");
%>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value='/resources/common/css/common.css'/>" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
background-image:url('../images/aa222.jpg');
background-size: cover;
}
</style>
</head>
<body>
	<%		
		String userID = null;
		if(session.getAttribute("userID") != null ){
			userID = (String) session.getAttribute("userID");
		}
	%>
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

</nav>
	<a style="font-family:'Nanum Pen Script', cursive;font-weight: bold;font-size: 50pt;margin-left: 100px;">리뷰내용</a>
	<form action="InsertReview.jsp" method="post">
		
		<div style="text-align: center; margin-right: 0px">
		<input type="text" style="width:600px; height:400px; border:3px solid #444444; text-align: center;font-weight: bold;font-size: 30pt;" name="content" placeholder="리뷰내용을 써주세요." required><br>
		<div style="text-align: center;"><br><br><br>
		<a style = "font-weight: bold; background-color: #dffc03;">평점</a> <input type="number" min="0" max="10" style=" border:3px solid #444444;width: 600px; margin-right: 39px;" name="userRating" required><br>
		</div>
		<input type="hidden" name="restNo" value=<%=restNo%>>
		<input type="hidden" name="search" value=<%=search%>>
		<input type="hidden" name="category" value=<%=category%>>
		<input type="hidden" name="deliveryStatus" value=<%=deliveryStatus%>>
		<input type="hidden" name="parkingStatus" value=<%=parkingStatus%>>
		<div style="margin-left: 1100px;">
		<input type="submit" class="btn btn-dark" style="color: white; margin-right: 400px;" value="작성">
		</div>
		</div>
	</form>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
	<script src="../js/bootstrap.js"></script>
</body>
</html>