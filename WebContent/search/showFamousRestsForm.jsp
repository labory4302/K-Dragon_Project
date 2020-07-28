<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="FamousRest.FamousRestVo"%>
<%@ page import="FamousRest.FamousRestDao"%>
<%@ page import="FamousRest.ReviewVo"%>
<%@ page import="FamousRest.ReviewDao"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Collections"%>
<%@ page import="java.io.PrintWriter"%>

<%
	int count = 0;

request.setCharacterEncoding("UTF-8");

FamousRestDao dao = new FamousRestDao();
List<FamousRestVo> famousRestList = dao.getFamousRestList();
List<FamousRestVo> resultfamousRestList = new ArrayList<>();

String search = request.getParameter("search");
String category = request.getParameter("category");
String deliveryStatus = request.getParameter("deliveryStatus");
String parkingStatus = request.getParameter("parkingStatus");

if (category == null) {
	category = "";
}
if (deliveryStatus == null) {
	deliveryStatus = "";
}
if (parkingStatus == null) {
	parkingStatus = "";
}

if (search != "") {
	for (FamousRestVo searchVo : famousRestList) {
		if (searchVo.getRestName().contains(search) || searchVo.getCategory().contains(search)
		|| searchVo.getAddress().contains(search) || searchVo.getMenu().contains(search)) {
	resultfamousRestList.add(searchVo);
	count++;
		}
	}
	if (count != 0) {
		Collections.sort(resultfamousRestList);
	} else {
		resultfamousRestList = null;
	}
} else if (category != "" || deliveryStatus != "" || parkingStatus != "") {
	for (FamousRestVo searchVo : famousRestList) {
		if (searchVo.getCategory().contains(category) && searchVo.getDeliveryStatus().contains(deliveryStatus)
		&& searchVo.getParkingStatus().contains(parkingStatus)) {
	resultfamousRestList.add(searchVo);
	count++;
		}
	}
	if (count != 0) {
		Collections.sort(resultfamousRestList);
	} else {
		resultfamousRestList = null;
	}
} else {
	for (FamousRestVo searchVo : famousRestList) {
		resultfamousRestList.add(searchVo);
	}
	Collections.sort(resultfamousRestList);
}
%>

<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<c:url value='/resources/common/css/common.css'/>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<meta charset="UTF-8">
<title>검색된 맛집 표시</title>
<style>
body {
	background-image: url('../images/bc.png');
}

.font {
	font-family: 'Nanum Pen Script', cursive;
	font-weight: bold;
	font-size: 40pt;
	color: black;
}

.font2 {
	font-size: 14pt;
	color: black;
	font-weight: bold;
}

label {
	font-weight: bold;
	font-size: 30pt;
}

.st {
	font-weight: bold;
	background-color: #dffc03;
	font-size: 25pt;
}

table {
	width: 30%;
	border: 3px solid #444444;
	border-collapse: collapse;
	background-color: white;
	font-family: 'Nanum Pen Script', cursive;
}

th, td {
	border: 3px solid #444444;
	text-align: center;
}

#chet_form {
	border-style: solid;
	width: 280px;
	position: fixed;
	left: 100%;
	top: 30%;
	margin-left: -300px;
}
</style>
</head>
<body>
	<%
		String userID = null;
	if (session.getAttribute("userID") != null) {
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


	<%
		if (resultfamousRestList == null) {
	%>
	<div class="row text-center">
		<h3>검색한 내용과 일치하는 항목이 없습니다.</h3>
		<br>
		<h3>다시 검색해주세요.</h3>
	</div>
	<%
		} else {
		ReviewDao reviewDao = new ReviewDao();
		for (FamousRestVo vo : resultfamousRestList) {
	%>
	<div align="center">
		<form action="reviewForm.jsp" method="post">
			<div style="margin-top: 60px;">
				<table>
					<tr>
						<td height="60px"><label>이름:</label><a class="st"><%=vo.getRestName()%></a></td>
					</tr>
					<tr>
						<td height="60px"><label>평점:</label><a class="st"><%=vo.getRating()%>점</a></td>
					</tr>
					<tr>
						<td height="60px"><label>#<%=vo.getCategory()%> #<%=vo.getMenu()%></label></td>
					</tr>
					<tr>
						<td height="60px"><label>주차:</label> <a class="st"><%=vo.getParkingStatus()%></a><label>
								/ 배달:</label> <a class="st"><%=vo.getDeliveryStatus()%></a></td>
					</tr>
					<tr height="60px">
						<td height="25%" align="center"><input type="hidden"
							name="restNo" value=<%=vo.getRestNo()%>> <input
							type="hidden" name="search" value=<%=search%>> <input
							type="hidden" name="category" value=<%=category%>> <input
							type="hidden" name="deliveryStatus" value=<%=deliveryStatus%>>
							<input type="hidden" name="parkingStatus"
							value=<%=parkingStatus%>> <input type="submit"
							style="color: white;" class="btn btn-dark" value="리뷰보러가기"><label>리뷰</label>
							<a class="st"><%=reviewDao.getReviewsNumber(vo.getRestNo())%>개</a></td>
					</tr>

				</table>
			</div>
		</form>
	</div>
	<%
		}
	}
	%>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	<%
		if (userID != null) {
	%>
	<div id="chet_form">
		<!-- 콘솔 메시지의 역할을 하는 로그 텍스트 에리어.(수신 메시지도 표시한다.) -->
		<textarea id="messageTextArea" rows="10" cols="35"></textarea>
		<br />
		<form>
			<!-- 유저 명을 입력하는 텍스트 박스(기본 값은 anonymous(익명)) -->

			<!-- 송신 메시지를 작성하는 텍스트 박스 -->
			<input id="textMessage" type="text">
			<!-- 메세지를 송신하는 버튼 -->
			<input onclick="sendMessage()" value="전송" type="button">
			<!-- WebSocket 접속 종료하는 버튼 -->

			<p id="chetmember_num"></p>

		</form>
	</div>
	<script type="text/javascript">
		// 콘솔 텍스트 에리어 오브젝트
		var messageTextArea = document.getElementById("messageTextArea");
		var chetmember_num = document.getElementById("chetmember_num");
		// 웹 소켓 접속 함수, url 뒤의 파라미터는 callback 함수를 받는다.
		function connectWebSocket(url, message, open, close, error) {
			// WebSocket 오브젝트 생성 (자동으로 접속 시작한다. - onopen 함수 호출)
			let webSocket = new WebSocket(url);
			// 함수 체크하는 함수
			function call(cb, msg) {
				// cb가 함수 타입인지 확인
				if (cb !== undefined && typeof cb === "function") {
					// 함수 호출
					cb.call(null, msg);
				}
			}
			// WebSocket 서버와 접속이 되면 호출되는 함수
			webSocket.onopen = function() {
				// callback 호출
				call(open);
			};
			// WebSocket 서버와 접속이 끊기면 호출되는 함수
			webSocket.onclose = function() {
				// callback 호출
				call(close);
			};
			// WebSocket 서버와 통신 중에 에러가 발생하면 요청되는 함수
			webSocket.onerror = function() {
				// callback 호출
				call(error);
			};
			// WebSocket 서버로 부터 메시지가 오면 호출되는 함수
			webSocket.onmessage = function(msg) {
				// callback 호출
				call(message, msg);
			};
			// 웹 소켓 리턴
			return webSocket;
		}
		// 연결 발생 때 사용할 callback 함수
		var open = function() {
			// 콘솔 텍스트에 메시지를 출력한다
			messageTextArea.value += "채팅 접속 완료...\n";
		}
		// 종료 발생 때 사용할 callback 함수
		var close = function() {
			// 콘솔 텍스트에 메시지를 출력한다
			messageTextArea.value += "채팅 접속 불가...\n";
			// 재 접속을 시도한다.
			setTimeout(function() {
				// 재접속
				webSocket = connectWebSocket(
						"ws://192.168.0.29:8088/food/broadsocket",
						message, open, close, error);
			});
		}
		// 에러 발생 때 사용할 callback 함수
		var error = function() {
			messageTextArea.value += "error...\n";
		}
		// 메세지를 받을 때 사용할 callback 함수
		var message = function(msg) {
			// 콘솔 텍스트에 메시지를 출력한다.
			var msgdata_split = msg.data.split("||");
			messageTextArea.value += msgdata_split[0] + "\n";
			chetmember_num.innerText = "현재 접속 자 수는 " + msgdata_split[1] + 
										"명 입니다";

		};
		// 웹 소켓 생성, 소켓을 여는 서버의 IP 주소와 톰캣 서버 포트 넣어줘야 합니다.
		var webSocket = connectWebSocket(
				"ws://192.168.0.29:8088/food/broadsocket", message,
				open, close, error);
		// Send 버튼을 누르면 호출되는 함수
		function sendMessage() {
			// 유저명 텍스트 박스 오브젝트를 취득
			//var user = document.getElementById("user");
			// 송신 메시지를 작성하는 텍스트 박스 오브젝트를 취득
			var message = document.getElementById("textMessage");
			// 콘솔 텍스트에 메시지를 출력한다.
			messageTextArea.value += "<%=session.getAttribute("userID")%>" + "(사용자) => " + message.value
					+ "\n";
			// WebSocket 서버에 메시지를 전송(형식 「{{유저명}}메시지」)
			webSocket.send("{{" + "<%=session.getAttribute("userID")%>
		" + "}}"
					+ message.value);
			// 송신 메시지를 작성한 텍스트 박스를 초기화한다.
			message.value = "";
		}
		// Disconnect 버튼을 누르면 호출되는 함수
		function disconnect() {
			// WebSocket 접속 해제
			webSocket.close();
		}
	</script>
	<%
		}
	%>
</body>
</html>