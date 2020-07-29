<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="FamousRest.FamousRestVo"%>
<%@ page import="FamousRest.FamousRestDao"%>
<%@ page import="FamousRest.ReviewVo"%>
<%@ page import="FamousRest.ReviewDao"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");

Long restNo = Long.parseLong(request.getParameter("restNo"));
String search = request.getParameter("search");
String category = request.getParameter("category");
String deliveryStatus = request.getParameter("deliveryStatus");
String parkingStatus = request.getParameter("parkingStatus");

FamousRestDao famousRestDao = new FamousRestDao();
FamousRestVo famousRestVo = famousRestDao.getFamousRestInformation(restNo);

ReviewDao reviewDao = new ReviewDao();
List<ReviewVo> reviewList = reviewDao.getFamousRestReviewList(restNo);
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
<title>리뷰</title>
<style>
body {
	background-image: url('../images/aa222.jpg');
	background-size: cover;
}

.font {
	font-family: 'Nanum Pen Script', cursive;
	font-weight: bold;
	font-size: 40pt;
	color: black;
}

.font1 {
	font-family: 'Nanum Pen Script', cursive;
	font-weight: bold;
	font-size: 20pt;
	color: black;
}

p {
	font-family: 'Nanum Pen Script', cursive;
	font-weight: bold;
	font-size: 30pt;
	color: black;
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
<!-- Google Map API -->
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA9vE3cizYfloHOys4QoTtrdfMLELtwhdY">
    </script>
<script>

     window.onload = function () {
        console.log('Map is initialized.');

        var resultMap = new google.maps.Map(document.getElementById('google-map'), {
            zoom: 16,
            center: {
                lat: 36.810711,
                lng: 127.148333
            }
        });
        var geocoder = new google.maps.Geocoder();

            console.log('geocodeAddress 함수 실행');

            var address = "<%=famousRestVo.getAddress()%>";

            geocoder.geocode({'address': address}, function(result, status) {
                console.log(result);
                console.log(status);

                if (status === 'OK') {
                    // 맵의 중심 좌표를 설정한다.
                    resultMap.setCenter(result[0].geometry.location);
                    // 맵의 확대 정도를 설정한다.
                    resultMap.setZoom(18);
                    // 맵 마커
                    var marker = new google.maps.Marker({
                        map: resultMap,
                        position: result[0].geometry.location
                    });

                    // 위도
                    console.log('위도(latitude) : ' + marker.position.lat());
                    // 경도
                    console.log('경도(longitude) : ' + marker.position.lng());
                } else {
                    alert('지오코드가 다음의 이유로 성공하지 못했습니다 : ' + status);
                }
            });
        
    }
    </script>
<style>
#google-map {
	width: 500px;
	height: 300px;
	padding: 0
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
	<div align="center">
		<div>
			<img src="../images/<%=famousRestVo.getRestNoImage()%>.jpg"
				style="width: 300px; box-shadow: 10px 10px 10px black;">
		</div>

		<div>
			<a class="font"><%=famousRestVo.getRestName()%></a>
		</div>

		<div>
			<a class="font1">평점 : <%=famousRestVo.getRating()%>점
			</a>
		</div>

		<br> <br>

		<div style="width: 50%; height: auto; line-height: 16px">
			<a class="font1">주소 : <%=famousRestVo.getAddress()%></a> <br> <br>
			<div style="box-shadow: 10px 10px 10px black;" id="google-map"></div>
			<br>
			<div style="background: white; border: solid 3px; width: 55s0px;">
				<br>
				<p>
					전화번호 :
					<%=famousRestVo.getPhoneNumber()%></p>
				<br>
				<p>
					배달 :
					<%=famousRestVo.getDeliveryStatus()%></p>
				<br>
				<p>
					주차 :
					<%=famousRestVo.getParkingStatus()%></p>
				<br>
				<p>
					영업시간 :
					<%=famousRestVo.getStartBusiness()%>
					~
					<%=famousRestVo.getCloseBusiness()%></p>
				<br>
				<p>
					업종 :
					<%=famousRestVo.getCategory()%></p>
				<br>
				<p>
					메뉴 :
					<%=famousRestVo.getMenu()%></p>
				<br>
				<p>
					가격대 :
					<%=famousRestVo.getPriceRange()%>원대
				</p>
				<br>
			</div>
			<form action="showFamousRestsForm.jsp" method="post">
				<input type="hidden" name="search" value=<%=search%>> <input
					type="hidden" name="category" value=<%=category%>> <input
					type="hidden" name="deliveryStatus" value=<%=deliveryStatus%>>
				<input type="hidden" name="parkingStatus" value=<%=parkingStatus%>>
				<input type="submit" class="btn btn-dark" style="color: white;"
					value="목록">
			</form>
		</div>
		<br>


		<div class="container" width="50%">
			<div class="row">
				<form action="InsertReviewForm.jsp" method="post">
					<table class="table table-striped"
						style="text-align: center; border: 1px solid #dddddd; width: 1200px;">
						<thead>

							<tr>
								<th style="background-color: #eeeeee; text-align: center;">작성자</th>
								<th style="background-color: #eeeeee; text-align: center;">내용</th>
								<th style="background-color: #eeeeee; text-align: center;">평점</th>
								<th style="background-color: #eeeeee; text-align: center;">작성일
									<input type="hidden" name="restNo"
									value=<%=famousRestVo.getRestNo()%>> <input
									type="hidden" name="search" value=<%=search%>> <input
									type="hidden" name="category" value=<%=category%>> <input
									type="hidden" name="deliveryStatus" value=<%=deliveryStatus%>>
									<input type="hidden" name="parkingStatus"
									value=<%=parkingStatus%>>
								</th>
							</tr>

						</thead>
						<%
							for (ReviewVo vo : reviewList) {
						%>

						<tbody>
							<tr>
								<td><%=vo.getUserID()%></td>
								<td><%=vo.getContent()%></td>
								<td><%=vo.getUserRating()%></td>
								<td><%=vo.getCreationDate()%></td>
							</tr>
						</tbody>
						<%
							}
						%>
					</table>
					<%
						if (userID != null) {
					%>
					<div style="margin-right: 50px;">
						<input type="submit" class="btn btn-dark" style="color: white;"
							value="리뷰작성하기">
					</div>
					<%
						}
					%>
				</form>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.js"></script>
	 <%if(userID!=null){ %>
 	<div id="chet_form">
	<!-- 콘솔 메시지의 역할을 하는 로그 텍스트 에리어.(수신 메시지도 표시한다.) -->
	<textarea id="messageTextArea" rows="10" cols="35"></textarea>
		<br />

		<!-- 유저 명을 입력하는 텍스트 박스(기본 값은 anonymous(익명)) -->

		<!-- 송신 메시지를 작성하는 텍스트 박스 -->
		<input id="textMessage" type="text" onkeydown="enterkey()">
		<!-- 메세지를 송신하는 버튼 -->
		<input onclick="sendMessage()" value="전송" type="button">
		<!-- WebSocket 접속 종료하는 버튼 -->

		<p id="chetmember_num"></p>

	
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
						"ws://192.168.0.21:8088/FamousRest/broadsocket",
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
			
			scrolldown();

		};
		// 웹 소켓 생성, 소켓을 여는 서버의 IP 주소와 톰캣 서버 포트 넣어줘야 합니다.
		var webSocket = connectWebSocket(
				"ws://192.168.0.21:8088/FamousRest/broadsocket", message,
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
			webSocket.send("{{" + "<%=session.getAttribute("userID")%>" + "}}" + message.value);
			// 송신 메시지를 작성한 텍스트 박스를 초기화한다.
			message.value = "";
			scrolldown();
		}
		
		function enterkey() {
	           if (event.keyCode == 13) {
	              sendMessage();
	           }
	       }
		
		// Disconnect 버튼을 누르면 호출되는 함수
		function disconnect() {
			// WebSocket 접속 해제
			webSocket.close();
		}
		
		function scrolldown(){
	           var elem = document.getElementById('messageTextArea');
	           elem.scrollTop = elem.scrollHeight;
	       }
	</script>
	<%} %>
</body>
</html>